v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -560 -120 -560 10 {lab=vin}
N -560 -120 -470 -120 {lab=vin}
N -560 70 -560 90 {lab=GND}
N -560 90 -250 90 {lab=GND}
N -250 40 -250 90 {lab=GND}
N -250 90 -130 90 {lab=GND}
N -130 -30 -130 90 {lab=GND}
N -260 -90 -180 -90 {lab=virt}
N -260 -120 -260 -90 {lab=virt}
N -250 -120 -250 -20 {lab=vcm}
N -250 -120 -180 -120 {lab=vcm}
N -260 -230 -260 -120 {lab=virt}
N -260 -230 -100 -230 {lab=virt}
N -40 -230 20 -230 {lab=vout}
N 20 -230 20 -80 {lab=vout}
N -30 -80 80 -80 {lab=vout}
N -260 120 -250 120 {lab=GND}
N -250 90 -250 120 {lab=GND}
N -410 -120 -350 -120 {lab=#net1}
N -290 -120 -260 -120 {lab=virt}
C {buffer1khz.sym} -290 120 0 0 {name=x1}
C {res.sym} -320 -120 3 0 {name=R1
value=5k
footprint=1206
device=resistor
m=1}
C {capa.sym} -440 -120 3 0 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {res.sym} -70 -230 3 0 {name=R2
value=5k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -560 40 0 0 {name=V1 value="0 AC 1" savecurrent=false}
C {vsource.sym} -250 10 0 0 {name=V2 value=1.5 savecurrent=false}
C {gnd.sym} -260 120 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -560 -30 0 0 {name=p1 sig_type=std_logic lab=vin}
C {lab_pin.sym} 70 -80 1 0 {name=p2 sig_type=std_logic lab=vout}
C {lab_pin.sym} -250 -40 2 0 {name=p3 sig_type=std_logic lab=vcm}
C {simulator_commands_shown.sym} -1120 -580 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.CONTROL

save all
op
write highpass_omp2.raw
set appendwrite
ac dec 100 0.1 10e6
write highpass_omp2.raw
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
C {lab_pin.sym} -260 -190 0 0 {name=p4 sig_type=std_logic lab=virt}
