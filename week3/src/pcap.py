import dpkt
import matplotlib.pyplot as plt

toBoard = "toBoard.pcap"
toPhone = "toPhone.pcap"

#used to clear vars
def init():
	global loss,time_intervals, byte_intervals, interval, curr_interval, curr_bytes,icmpTimes, latencies, total, start, end, throughPut, lat
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
	loss= 0
	

def read(toPhone, toBoard):
	global tpPcap, tbPcap
	tpFile = open(toPhone, 'rb') 
	tbFile = open(toBoard, 'rb') 
	tpPcap = dpkt.pcap.Reader(tpFile)
	tbPcap = dpkt.pcap.Reader(tbFile)

'''
Find average latency of ICMP packets - Done
Find the average throughput of the ICMP packet flow - Done
Plot the data rate vs time for the trace - Done
Find the loss rate of the trace - Done
'''
def process(pcap, outFile):
	sent, received = 0, 0
	global loss, start, end, total, throughPut, lat, time_intervals, byte_intervals, interval, curr_interval, curr_bytes
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
			sent+=1
		elif (icmp.type == 0):
			if hash(icmp.data) in icmpTimes:
				latencies.append(timestamp - icmpTimes[hash(icmp.data)])
				received+=1
		#throughPut
		if start is None:
			start = timestamp
		end = timestamp
		total += len(buffer)
		#for debugging
		#print(f"Start time: {start}, End time: {end}, Total packets: {total}")
	lat = sum(latencies) / len(latencies) if latencies else 0
	throughPut = (total/(end-start)) if start and end else 0
	loss = (sent - received) / sent if sent > 0 else 0
	plt.plot(time_intervals,byte_intervals)
	plt.xlabel("Time (s)")
	plt.ylabel("Bytes per/sec")
	plt.title("Data Rate vs Time")
	plt.savefig("../results/" + outFile)
	plt.close()


if __name__ == '__main__':
	read(toPhone,toBoard)

	#first Device: RW612 Board
	init()
	process(tbPcap,"../results/rw612.png")
	with open("../results/rw612.md","w") as file:
		file.write(f"Latency (avg): {lat}\n")
		file.write(f"Throughput: {throughPut}\n")
		file.write(f"Loss rate: {loss}\n")
		file.write("![Data Rate vs Time](rw612.png)\n")
	#second Device: Iphone
	init()
	process(tpPcap,"../results/iphone.png")
	with open("../results/iphone.md","w") as file:
		file.write(f"Latency (avg): {lat}\n")
		file.write(f"Throughput: {throughPut}\n")
		file.write(f"Loss rate: {loss}\n")
		file.write("![Data Rate vs Time](iphone.png)\n")