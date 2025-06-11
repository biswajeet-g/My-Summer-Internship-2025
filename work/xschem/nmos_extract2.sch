v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -40 0 -40 50 {lab=#net1}
N -40 -30 50 -30 {lab=GND}
N 50 -30 50 210 {lab=GND}
N -180 -30 -80 -30 {lab=#net2}
N -180 -130 -180 -30 {lab=#net2}
N -180 -130 100 -130 {lab=#net2}
N 100 -130 100 -0 {lab=#net2}
N 100 60 100 210 {lab=GND}
N -40 210 100 210 {lab=GND}
N -40 200 -40 210 {lab=GND}
N -40 110 -40 200 {lab=GND}
N 40 210 40 230 {lab=GND}
C {simulator_commands_shown.sym} -570 -230 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.CONTROL

save all
op
write nmos_extract2.raw
set appendwrite
DC Vds 0 1.8 0.05 Vsb 0 0.5 0.1
write nmos_extract2.raw
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
C {sky130_fd_pr/nfet_01v8.sym} -60 -30 0 0 {name=M2
L=0.5
W=1 
nf=1 mult=1
model=nfet_01v8
spiceprefix=X
}
C {vsource.sym} -40 80 0 0 {name=Vsb value=0 savecurrent=false}
C {vsource.sym} 100 30 0 0 {name=Vds value=1 savecurrent=false}
C {gnd.sym} 40 230 0 0 {name=l1 lab=GND}
