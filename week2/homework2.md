


In this assignment, you will create some wireless packet traces and collect some statistics on them.


You will first need to install the tcpdump package if you don't have it already. This package records traces of packets

On mac OS: `brew install tcpdump`
On Ubuntu: `sudo apt install tcpdump`

You will be measuring network performance of two devices on your WiFi network. Find the IP address of two devices (other than your laptop) on the local wireless network. The first device should be your RW612 board. The other can be your phone, TV, another computer or tablet. I chose to use my phone, which has IP address 192.168.1.51.

To create a wireless packet trace, open up two terminal windows on your laptop. In the first terminal window, type the following command, which captures only ICMP packets and saves them to a file called icmp.pcap:

  tcpdump -n icmp -w icmp.pcap

In a second terminal, run the following command, which sends ICMP echo requests to 192.168.1.51:

  sudo ping -f 192.168.1.51 -c 1000000 host

For each pcap file created by tcpdump:

  1. Find the average latency of ICMP packets.
  2. Find the average throughput of the ICMP packet flow.
  3. Plot the data rate vs time for the trace.
  4. Find the loss rate of the trace.

Helpful notes:

You can use the dpkt python module for parcing the packet trace (do a search for the module). Or you can use a different tool to parse. You can also use Wireshark for assistance. Please attach the code (however small) for each of the above parts at the end of your solutions.
