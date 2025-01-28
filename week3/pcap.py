import dpkt
import matplotlib.pyplot as plt

toBoard = "toBoard.pcap"
toPhone = "toPhone.pcap"

#used to clear vars
def init():
	global time_intervals, byte_intervals, interval, curr_interval, curr_bytes,icmpTimes, latencies, total, start, end, throughPut, lat
	icmpTimes = {}
	latencies = []
	time_intervals = []
	byte_intervals = []
	interval = 1
	curr_interval = 0
	curr_bytes = 0
	total = 0
	start, end = None, None
	throughPut = 0
	lat = 0
	

def read(toPhone, toBoard):
	global tpPcap, tbPcap
	tpFile = open(toPhone, 'rb') 
	tbFile = open(toBoard, 'rb') 
	tpPcap = dpkt.pcap.Reader(tpFile)
	tbPcap = dpkt.pcap.Reader(tbFile)

'''
Find average latency of ICMP packets - Done
Find the average throughput of the ICMP packet flow - Done
Plot the data rate vs time for the trace
Find the loss rate of the trace
'''
def process(pcap, outFile):
	global start, end, total, throughPut, lat, time_intervals, byte_intervals, interval, curr_interval, curr_bytes
	for timestamp, buffer in pcap:
		eth = dpkt.ethernet.Ethernet(buffer)
		ip = eth.data
		#skip gross packets
		if (not isinstance(ip,dpkt.ip.IP)) or (not isinstance(ip.data,dpkt.icmp.ICMP)):
			continue
		icmp = ip.data

		if curr_interval == 0:
				curr_interval = int(timestamp)
		
		if int(timestamp) - curr_interval >= interval:
			time_intervals.append(curr_interval)
			byte_intervals.append(curr_bytes)
			curr_interval += interval
			curr_bytes = 0
		curr_bytes += len(buffer)
		if (icmp.type == 8):
			icmpTimes[hash(icmp.data)] = timestamp
		elif (icmp.type == 0):
			if hash(icmp.data) in icmpTimes:
				latencies.append(timestamp - icmpTimes[hash(icmp.data)])
		#throughPut
		if start is None:
			start = timestamp
		end = timestamp
		total += len(buffer)
		#for debugging
		#print(f"Start time: {start}, End time: {end}, Total packets: {total}")
	lat = sum(latencies) / len(latencies) if latencies else 0
	throughPut = (total/(end-start))
	plt.plot(time_intervals,byte_intervals)
	plt.xlabel("Time (s)")
	plt.ylabel("Bytes per/sec")
	plt.title("Data Rate vs Time")
	plt.savefig(outFile)
	plt.close()


if __name__ == '__main__':
	read(toPhone,toBoard)

	#first Device: RW612 Board
	init()
	process(tbPcap,"rw612.png")
	print("RW612 Board:")
	print(f"Latency (avg): {lat}")
	print(f"Throughput: {throughPut}")
	#second Device: Iphone
	init()
	process(tpPcap,"iphone.png")
	print("IPhone:")
	print(f"Latency (avg): {lat}")
	print(f"Throughput: {throughPut}")
