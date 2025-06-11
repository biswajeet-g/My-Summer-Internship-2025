v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -110 -130 -110 -60 {lab=#net1}
N -230 -30 -150 -30 {lab=#net1}
N -230 -130 -230 -30 {lab=#net1}
N -230 -130 20 -130 {lab=#net1}
N 20 -130 20 -50 {lab=#net1}
N 20 10 20 80 {lab=GND}
N -110 -30 -30 -30 {lab=GND}
N -30 -30 -30 80 {lab=GND}
N -110 -0 -110 20 {lab=#net2}
N -110 80 -110 110 {lab=GND}
N -30 80 -30 110 {lab=GND}
N 20 80 20 110 {lab=GND}
N -110 110 20 110 {lab=GND}
N -40 110 -40 140 {lab=GND}
C {vsource.sym} 20 -20 0 0 {name=Vds value=1 savecurrent=false}
C {vsource.sym} -110 50 0 0 {name=Vsb value=0 savecurrent=false}
C {gnd.sym} -40 140 0 0 {name=l1 lab=GND}
C {simulator_commands_shown.sym} -570 -230 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.CONTROL

save all
op
write nmos_extract3_native.raw
set appendwrite
DC Vds 0 1.8 0.05 Vsb 0 0.5 0.1
write nmos_extract3_native.raw
**
plot sqrt(2*abs(Vds#branch))
plot Vds#branch

.ENDC
"}
C {devices/code.sym} -550 80 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {sky130_fd_pr/nfet_03v3_nvt.sym} -130 -30 0 0 {name=M3
L=1
W=4
nf=1 mult=1
model=nfet_03v3_nvt
spiceprefix=X
}
