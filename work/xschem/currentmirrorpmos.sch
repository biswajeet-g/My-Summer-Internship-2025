v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -210 -0 -210 70 {lab=GND}
N -210 70 -50 70 {lab=GND}
N -300 -30 -300 60 {lab=GND}
N -300 60 -300 70 {lab=GND}
N -300 70 -210 70 {lab=GND}
N -50 -30 30 -30 {lab=GND}
N 30 -30 30 70 {lab=GND}
N -50 60 -50 70 {lab=GND}
N -50 -0 -50 60 {lab=GND}
N -50 70 30 70 {lab=GND}
N -140 -110 -140 -30 {lab=#net1}
N -210 -110 -210 -60 {lab=#net1}
N -50 -110 -50 -60 {lab=#net2}
N -50 -110 170 -110 {lab=#net2}
N 170 -110 170 -40 {lab=#net2}
N 170 20 170 70 {lab=GND}
N 30 70 170 70 {lab=GND}
N -390 -110 -390 -40 {lab=#net1}
N -390 -110 -140 -110 {lab=#net1}
N -390 20 -390 70 {lab=GND}
N -390 70 -270 70 {lab=GND}
N -200 70 -200 100 {lab=GND}
N -300 -30 -250 -30 {lab=GND}
N -250 -30 -200 -30 {lab=GND}
N -210 -60 -200 -60 {lab=#net1}
N -160 -30 -90 -30 {lab=#net1}
N -210 -0 -200 -0 {lab=GND}
C {isource.sym} -390 -10 2 0 {name=Iin value=50u}
C {vsource.sym} 170 -10 0 0 {name=Vds value="1 AC 1" savecurrent=false}
C {gnd.sym} -200 100 0 0 {name=l1 lab=GND}
C {simulator_commands_shown.sym} -700 -270 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.CONTROL

op
write currentmirrorpmos.raw
set appendwrite
DC Vds 0 1.8 0.05
write currentmirrorpmos.raw
**
plot abs(Vds#branch)
AC dec 100 100 1000
plot '1/vm(Vds#branch)'

.ENDC

"}
C {devices/code.sym} -700 70 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -70 -30 0 0 {name=M10
L=1
W=4
nf=1 mult=1
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -180 -30 0 1 {name=M1
L=1
W=4
nf=1 mult=1
model=pfet_01v8_lvt
spiceprefix=X
}
