import pydpkt
import matplotlib.pyplot as plt

def calcLatency(packet):
    with open(packet, 'rb') as file:
        pcap = pydpkt.pcap.Reader(file)
        icmpTimes = {}
        latencies = []

        for timestamp, buffer in pcap:
            eth = pydpkt.ethernet.Ethernet(buffer)
            ip = eth.data
            icmp = ip.data
            #request
            if (icmp.type == 8):
                icmpTimes[icmp.data] = timestamp
            #reply
            elif (icmp.type == 0):
                if icmp.data in icmpTimes:
                    latencies.append(timestamp - icmpTimes[icmp.data])
        return sum(latencies) / len(latencies)
    
def calcThroughput(packet):
    with open(packet, 'rb') as file:
        pcap = pydpkt.pcap.Reader(file)
        total = 0
        start = None
        end = None 
        for timestamp, buffer in pcap:
            #triggers for first packet read
            if start is None: 
                start = timestamp
            end = timestamp
            total += len(buffer)
        return total / (end - start)
    
#still working
def plot(packet):
    with open(packet, "rb") as file:
        pcap = pydpkt.pcap.Reader(file)
        
def calcLossRate(packet):
    with open(packet, 'rb') as file:
        pcap = pydpkt.pcap.Reader(file)
        rqc, rpc = 0, 0
        for timestamp, buffer in pcap:
            eth = pydpkt.ethernet.Ethernet(buffer)
            ip = eth.data
            icmp = ip.data

            if icmp.type == 8:
                rqc += 1
            elif icmp.type == 0:
                rpc += 1
        #found that if rqc is 0 then the program will hit a divide by zero error
        if (rqc == 0):
            return 0
        return (rqc - rpc) / rqc