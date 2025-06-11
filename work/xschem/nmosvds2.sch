v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -90 -40 -90 10 {lab=vg}
N -90 -40 30 -40 {lab=vg}
N -90 70 -90 150 {lab=GND}
N -90 150 200 150 {lab=GND}
N 200 70 200 150 {lab=GND}
N 200 -140 200 10 {lab=vd}
N 70 -140 200 -140 {lab=vd}
N 70 -140 70 -70 {lab=vd}
N 70 -40 120 -40 {lab=GND}
N 120 -40 160 -40 {lab=GND}
N 160 -40 160 50 {lab=GND}
N 70 50 160 50 {lab=GND}
N 70 -10 70 50 {lab=GND}
N 70 50 70 150 {lab=GND}
N 60 150 70 150 {lab=GND}
N 60 150 60 180 {lab=GND}
C {vsource.sym} -90 40 0 0 {name=Vgs value=1 savecurrent=false}
C {vsource.sym} 200 40 0 0 {name=Vds value=0 savecurrent=false}
C {gnd.sym} 60 180 0 0 {name=l1 lab=GND}
C {simulator_commands_shown.sym} -450 -280 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.CONTROL

save all
OP
write nmosvds2.raw
set appendwrite
DC Vds 0 1.8 0.1 Vgs 0.4 1.0 0.1
write nmosvds2.raw
**
plot vds#branch
plot abs(vds#branch)
.ENDC
"}
C {lab_pin.sym} -40 -40 1 0 {name=p1 sig_type=std_logic lab=vg}
C {lab_pin.sym} 200 -50 2 0 {name=p2 sig_type=std_logic lab=vd}
C {devices/code.sym} -430 20 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {sky130_fd_pr/nfet_01v8.sym} 50 -40 0 0 {name=M2
L=1
W=4 
nf=1 mult=1
model=nfet_01v8
spiceprefix=X
}
