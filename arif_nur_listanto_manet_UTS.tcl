# Define options
set val(chan)  Channel/WirelessChannel     ;# channel type
set val(prop)  Propagation/TwoRayGround    ;# radio-propagation model
set val(netif) Phy/WirelessPhy             ;# network interface type
set val(mac)   Mac/802_11                  ;# MAC type
set val(ifq)   Queue/DropTail/PriQueue     ;# interface queue type
set val(ll)    LL                          ;# link layer type
set val(ant)   Antenna/OmniAntenna         ;# antenna model
set val(ifqlen) 50   ;# max packet in ifq
set val(nn)     24   ;# number of mobilenodes
set val(rp)     AODV ;# routing protocol
set val(x)      1000 ;# X dimension of topography
set val(y)      1000 ;# Y dimension of topography
set val(stop)   160  ;# time of simulation end

set ns [new Simulator]

set tracefd [open arif_nur_listanto_manet_UTS.tr w]
set namtrace [open arif_nur_listanto_manet_UTS.nam w]

$ns trace-all $tracefd
$ns namtrace-all-wireless $namtrace $val(x) $val(y)


# set up topography object
set topo [new Topography]
$topo load_flatgrid $val(x) $val(y)

create-god $val(nn)


#configure the nodes
set chan1 [new $val(chan)]
$ns node-config -adhocRouting $val(rp) \
-llType $val(ll) \
-macType $val(mac) \
-ifqType $val(ifq) \
-ifqLen $val(ifqlen) \
-antType $val(ant) \
-propType $val(prop) \
-phyType $val(netif) \
-channel $chan1 \
-topoInstance $topo \
-agentTrace ON \
-routerTrace ON \
-macTrace OFF \
-movementTrace ON

for {set i 0} {$i < $val(nn) } { incr i } {
set n($i) [$ns node]
#$ns at 0.1 "$n($i) color blue"
}

#defining heads
$ns at 0.0 "$n(1) label Source"
$ns at 0.0 "$n(15) label Destination"
$ns at 0.0 "$n(14) label Source"
$ns at 0.0 "$n(9) label Destination"

# Provide initial location of mobilenodes

$n(0) set X_ 105.0
$n(0) set Y_ 206.0
$n(0) set Z_ 0.0

$n(1) set X_ 805.0
$n(1) set Y_ 742.0
$n(1) set Z_ 0.0

$n(2) set X_ 515.0
$n(2) set Y_ 606.0
$n(2) set Z_ 0.0

$n(3) set X_ 405.0
$n(3) set Y_ 342.0
$n(3) set Z_ 0.0

$n(4) set X_ 675.0
$n(4) set Y_ 156.0
$n(4) set Z_ 0.0

$n(5) set X_ 905.0
$n(5) set Y_ 549.0
$n(5) set Z_ 0.0

$n(6) set X_ 675.0
$n(6) set Y_ 336.0
$n(6) set Z_ 0.0

$n(7) set X_ 555.0
$n(7) set Y_ 762.0
$n(7) set Z_ 0.0

$n(8) set X_ 258.0
$n(8) set Y_ 646.0
$n(8) set Z_ 0.0

$n(9) set X_ 645.0
$n(9) set Y_ 522.0
$n(9) set Z_ 0.0

$n(10) set X_ 265.0
$n(10) set Y_ 376.0
$n(10) set Z_ 0.0

$n(11) set X_ 495.0
$n(11) set Y_ 502.0
$n(11) set Z_ 0.0

$n(12) set X_ 75.0
$n(12) set Y_ 426.0
$n(12) set Z_ 0.0

$n(13) set X_ 145.0
$n(13) set Y_ 119.0
$n(13) set Z_ 0.0

$n(14) set X_ 85.0
$n(14) set Y_ 702.0
$n(14) set Z_ 0.0

$n(15) set X_ 340.0
$n(15) set Y_ 36.0
$n(15) set Z_ 0.0

$n(16) set X_ 758.0
$n(16) set Y_ 602.0
$n(16) set Z_ 0.0

$n(17) set X_ 435.0
$n(17) set Y_ 186.0
$n(17) set Z_ 0.0

$n(18) set X_ 5.0
$n(18) set Y_ 2.0
$n(18) set Z_ 0.0

$n(19) set X_ 515.0
$n(19) set Y_ 366.0
$n(19) set Z_ 0.0

$n(20) set X_ 33.0
$n(20) set Y_ 111.0
$n(20) set Z_ 0.0

$n(21) set X_ 805.0
$n(21) set Y_ 100.0
$n(21) set Z_ 0.0

$n(22) set X_ 125.0
$n(22) set Y_ 10.0
$n(22) set Z_ 0.0

$n(23) set X_ 505.0
$n(23) set Y_ 90.0
$n(23) set Z_ 0.0

#new location after move
$ns at 0.0 "$n(0) setdest 130.0 208.0 5.0"
$ns at 0.0 "$n(1) setdest 485.0 128.0 5.0"
$ns at 1.0 "$n(2) setdest 615.0 340.0 5.0"
$ns at 1.0 "$n(3) setdest 680.0 458.0 5.0"
$ns at 3.0 "$n(4) setdest 580.0 368.0 5.0"
$ns at 3.0 "$n(5) setdest 785.0 228.0 5.0"
$ns at 2.0 "$n(6) setdest 750.0 638.0 5.0"
$ns at 1.0 "$n(7) setdest 185.0 120.0 5.0"
$ns at 0.0 "$n(8) setdest 335.0 700.0 5.0"
$ns at 2.0 "$n(9) setdest 425.0 590.0 5.0"
$ns at 2.0 "$n(10) setdest 105.0 620.0 5.0"
$ns at 0.0 "$n(11) setdest 565.0 420.0 5.0"
$ns at 1.0 "$n(12) setdest 700.0 20.0 5.0"
$ns at 1.0 "$n(13) setdest 115.0 85.0 5.0"
$ns at 1.0 "$n(14) setdest 195.0 185.0 5.0"
$ns at 1.0 "$n(15) setdest 387.0 590.0 5.0"
$ns at 2.0 "$n(16) setdest 165.0 620.0 5.0"
$ns at 0.0 "$n(17) setdest 765.0 320.0 5.0"
$ns at 1.0 "$n(18) setdest 109.0 20.0 5.0"
$ns at 1.0 "$n(19) setdest 175.0 185.0 5.0"
$ns at 2.0 "$n(20) setdest 200.0 225.0 5.0"
$ns at 1.0 "$n(21) setdest 765.0 100.0 5.0"
$ns at 1.0 "$n(22) setdest 109.0 100.0 5.0"
$ns at 0.0 "$n(23) setdest 800.0 800.0 5.0"

# Set a TCP connection between n(1) and n(15)
set tcp [new Agent/TCP]    ;#use tcp to connect to sender node1
#$tcp set class_ 2
set tcp_sink [new Agent/TCPSink]  ;#use tcp sink to attach to reciever node2
$ns attach-agent $n(1) $tcp
$ns attach-agent $n(15) $tcp_sink
$ns connect $tcp $tcp_sink     ;#connect tcp and tcp sink

# Set a TCP connection between n(14) and n(9)
set tcp_1 [new Agent/TCP]    ;#use tcp to connect to sender node1
#$tcp set class_ 2
set tcp_sink_1 [new Agent/TCPSink]  ;#use tcp sink to attach to reciever node2
$ns attach-agent $n(14) $tcp_1     ;#connect tcp and tcp sink
$ns attach-agent $n(9) $tcp_sink_1
$ns connect $tcp_1 $tcp_sink_1     ;#connect tcp and tcp sink

set cbr1 [new Application/FTP]
$cbr1 set packetSize_ 1000
$cbr1 set rate_ 200kb
$cbr1 set interval_ 0.02
$cbr1 attach-agent $tcp   ;#cbr object attached to tcp


$ns at 5.0 "$cbr1 start"

# ending nam and the simulation
$ns at 80 "$cbr1 stop"
#$ns at $val(stop) "$ns n_1
$ns at $val(stop) "stop"
$ns at 50.01 "puts \"end simulation\" ; #$ns halt"

set cbr1 [new Application/FTP]
$cbr1 set packetSize_ 1000
$cbr1 set rate_ 200kb
$cbr1 set interval_ 0.02
$cbr1 attach-agent $tcp_1   ;#cbr object attached to udp

$ns at 81.0 "$cbr1 start"

# ending nam and the simulation
$ns at 160 "$cbr1 stop"
#$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "stop"
$ns at 50.01 "puts \"end simulation\" ; #$ns halt"

# Define node initial position in nam
for {set i 0} {$i < $val(nn)} { incr i } {
#80 defines the node size for nam
$ns initial_node_pos $n($i) 80
}








proc stop {} {
global ns tracefd namtrace 
$ns flush-trace
close $tracefd
close $namtrace

                           
exec nam arif_nur_listanto_manet_UTS.nam &
puts "nam" 


#exec Xgraph thesis4.tr &
exit 0
}


$ns run
