v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -230 -410 -230 -360 {lab=vin}
N -230 -410 -210 -410 {lab=vin}
N -150 -410 -100 -410 {lab=#net1}
N -40 -410 40 -410 {lab=virt}
N 40 -410 40 -370 {lab=virt}
N -0 -510 80 -510 {lab=virt}
N -0 -510 -0 -410 {lab=virt}
N -0 -330 40 -330 {lab=vcm}
N -0 -330 -0 -290 {lab=vcm}
N -230 -300 -230 -210 {lab=#net2}
N -230 -210 100 -210 {lab=#net2}
N 100 -300 100 -210 {lab=#net2}
N -0 -230 -0 -170 {lab=GND}
N 180 -350 280 -350 {lab=vout}
N 140 -510 210 -510 {lab=vout}
N 210 -510 210 -350 {lab=vout}
C {opamp_model2.sym} -30 -180 0 0 {name=x1}
C {vsource.sym} -230 -330 0 0 {name=V1 value="0 AC 1" savecurrent=false}
C {res.sym} -70 -410 3 0 {name=R1
value=5k
footprint=1206
device=resistor
m=1}
C {capa.sym} -180 -410 3 0 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {res.sym} 110 -510 3 0 {name=R2
value=5k
footprint=1206
device=resistor
m=1}
C {vsource.sym} 0 -260 0 0 {name=V2 value=1.5 savecurrent=false}
C {gnd.sym} 0 -170 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -230 -390 0 0 {name=p1 sig_type=std_logic lab=vin}
C {lab_pin.sym} 0 -320 0 0 {name=p2 sig_type=std_logic lab=vcm}
C {lab_pin.sym} 0 -480 0 0 {name=p3 sig_type=std_logic lab=virt}
C {lab_pin.sym} 260 -350 1 0 {name=p4 sig_type=std_logic lab=vout}
C {simulator_commands_shown.sym} -820 -880 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.CONTROL

save all
op
write highpass_omp3.raw
set appendwrite
ac dec 100 0.1 10e6
write highpass_omp3.raw
**
meas ac gain_db MAX vdb(vout) FROM=0.1 TO=10e6
let vm3db=gain_db-3.0
print vm3db
meas ac fzero when vdb(vout)=vm3db RISE=1
meas ac fpole when vdb(vout)=vm3db FALL=1

**phase management
let phase_deg=cph(vout)*180/pi
meas AC phase_zero FIND phase_deg AT =fzero
meas AC phase_pole FIND phase_deg AT =fpole
meas ac phase_margin FIND phase_deg when vdb(vout)=0




.ENDC
"}
