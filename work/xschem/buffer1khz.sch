v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -30 -300 70 -300 {lab=#net1}
N 130 -300 210 -300 {lab=#net2}
N 210 -300 210 -260 {lab=#net2}
N -100 -190 -100 -150 {lab=GND}
N -100 -150 210 -150 {lab=GND}
N 210 -200 210 -150 {lab=GND}
N 210 -300 340 -300 {lab=#net2}
N 340 -290 340 -260 {lab=#net2}
N 210 -150 340 -150 {lab=GND}
N 340 -220 340 -150 {lab=GND}
N 380 -210 380 -170 {lab=vom}
N 410 -150 570 -150 {lab=vom}
N -170 -300 -170 -270 {lab=vinp}
N -310 -300 -170 -300 {lab=vinp}
N -170 -220 -170 -150 {lab=vinm}
N -310 -150 -170 -150 {lab=vinm}
N 210 -150 210 -100 {lab=GND}
N -170 -230 -170 -220 {lab=vinm}
N -100 -220 -100 -190 {lab=GND}
N -130 -220 -100 -220 {lab=GND}
N -130 -300 -130 -280 {lab=#net1}
N -130 -300 -30 -300 {lab=#net1}
N 340 -300 340 -290 {lab=#net2}
N 380 -300 480 -300 {lab=vop}
N 380 -300 380 -270 {lab=vop}
N 380 -150 410 -150 {lab=vom}
N 380 -170 380 -150 {lab=vom}
N 480 -300 550 -300 {lab=vop}
C {res.sym} 100 -300 3 0 {name=R1
value=15.9k
footprint=1206
device=resistor
m=1}
C {capa.sym} 210 -230 0 0 {name=C1
m=1
value=10n
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 210 -100 0 0 {name=l1 lab=GND}
C {vcvs.sym} -130 -250 0 0 {name=E1 value=1000}
C {vcvs.sym} 380 -240 0 0 {name=E2 value=1}
C {iopin.sym} 380 -290 0 0 {name=p1 lab=vop}
C {iopin.sym} 380 -180 0 0 {name=p2 lab=vom}
C {iopin.sym} -170 -290 2 0 {name=p3 lab=vinp}
C {iopin.sym} -170 -170 2 0 {name=p4 lab=vinm}
C {simulator_commands_shown.sym} -490 -510 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.CONTROL

save all
set appendfile
wrtie buffer1khz.raw

.ENDC
"}
