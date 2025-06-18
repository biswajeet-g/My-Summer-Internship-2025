v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 1160 -490 1300 -490 {lab=vout}
N 740 -250 810 -250 {lab=AVSS}
N 740 -250 740 -160 {lab=AVSS}
N 740 -160 1060 -160 {lab=AVSS}
N 1060 -250 1060 -160 {lab=AVSS}
N 980 -250 1060 -250 {lab=AVSS}
N 810 -220 810 -160 {lab=AVSS}
N 980 -220 980 -160 {lab=AVSS}
N 620 -160 740 -160 {lab=AVSS}
N 810 -340 810 -280 {lab=ib5u}
N 850 -250 940 -250 {lab=ib5u}
N 620 -340 810 -340 {lab=ib5u}
N 810 -340 890 -340 {lab=ib5u}
N 890 -340 890 -250 {lab=ib5u}
N 950 -400 950 -340 {lab=#net1}
N 1160 -400 1160 -340 {lab=#net1}
N 950 -340 1160 -340 {lab=#net1}
N 980 -310 980 -280 {lab=#net1}
N 980 -310 1060 -310 {lab=#net1}
N 1060 -340 1060 -310 {lab=#net1}
N 990 -550 1110 -550 {lab=#net2}
N 950 -520 950 -460 {lab=#net3}
N 1160 -520 1160 -460 {lab=vout}
N 950 -620 950 -580 {lab=AVDD}
N 950 -620 1160 -620 {lab=AVDD}
N 1160 -620 1160 -580 {lab=AVDD}
N 740 -480 830 -480 {lab=vip}
N 740 -420 830 -420 {lab=vim}
N 850 -620 950 -620 {lab=AVDD}
N 890 -550 950 -550 {lab=AVDD}
N 890 -620 890 -550 {lab=AVDD}
N 1160 -550 1240 -550 {lab=AVDD}
N 1240 -620 1240 -550 {lab=AVDD}
N 1160 -620 1240 -620 {lab=AVDD}
C {iopin.sym} 620 -340 2 0 {name=p2 lab=ib5u}
C {iopin.sym} 740 -480 2 0 {name=p3 lab=vip}
C {iopin.sym} 740 -420 2 0 {name=p4 lab=vim}
C {simulator_commands_shown.sym} 370 -610 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.CONTROL

save all
set appendfile
wrtie nmosopamp.raw

.ENDC
"}
C {iopin.sym} 850 -620 2 0 {name=p5 lab=AVDD}
C {iopin.sym} 620 -160 2 0 {name=p6 lab=AVSS}
C {sky130_fd_pr/nfet_01v8.sym} 960 -250 0 0 {name=M2
L=1
W=5
nf=1 mult=2
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 830 -250 2 0 {name=M1
L=1
W=5
nf=1 mult=1
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 930 -430 0 0 {name=M3
L=2
W=5
nf=1 mult=4
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 970 -550 2 0 {name=M11
L=2
W=5
nf=1 mult=2
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 1140 -550 0 0 {name=M5
L=2
W=5
nf=1 mult=2
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 1180 -430 2 0 {name=M4
L=2
W=5
nf=1 mult=2
model=nfet_01v8_lvt
spiceprefix=X
}
C {iopin.sym} 1300 -490 0 0 {name=p7 lab=vout}
