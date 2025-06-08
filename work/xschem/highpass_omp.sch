v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -416700 30450 -416660 30450 {lab=vin}
N -416430 30270 -416360 30270 {lab=#net1}
N -416300 30270 -416210 30270 {lab=vout}
N -416210 30270 -416210 30480 {lab=vout}
N -416240 30480 -416180 30480 {lab=vout}
N -416700 30650 -416700 30670 {lab=#net2}
N -416700 30670 -416310 30670 {lab=#net2}
N -416310 30530 -416310 30670 {lab=#net2}
N -416420 30680 -416420 30710 {lab=GND}
N -416420 30650 -416420 30680 {lab=GND}
N -416700 30580 -416700 30650 {lab=#net2}
N -416700 30450 -416700 30520 {lab=vin}
N -416470 30500 -416380 30500 {lab=#net1}
N -416420 30450 -416380 30450 {lab=vcm}
N -416420 30450 -416420 30590 {lab=vcm}
N -416450 30270 -416430 30270 {lab=#net1}
N -416600 30450 -416570 30450 {lab=#net3}
N -416510 30450 -416470 30450 {lab=#net1}
N -416470 30270 -416450 30270 {lab=#net1}
N -416470 30270 -416470 30500 {lab=#net1}
N -416380 30490 -416380 30500 {lab=#net1}
N -416320 30530 -416310 30530 {lab=#net2}
N -416320 30520 -416320 30530 {lab=#net2}
N -416240 30470 -416240 30480 {lab=vout}
C {vsource.sym} -416700 30550 0 0 {name=V1 value="0 AC 1" savecurrent=false}
C {res.sym} -416540 30450 3 0 {name=R1
value=5k
footprint=1206
device=resistor
m=1}
C {capa.sym} -416630 30450 3 0 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} -416420 30620 0 0 {name=V2 value=1.5 savecurrent=false}
C {res.sym} -416330 30270 3 0 {name=R2
value=5k
footprint=1206
device=resistor
m=1}
C {gnd.sym} -416420 30710 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -416700 30490 0 0 {name=p1 sig_type=std_logic lab=vin}
C {lab_pin.sym} -416190 30480 2 0 {name=p2 sig_type=std_logic lab=vout
}
C {lab_pin.sym} -416420 30550 0 0 {name=p3 sig_type=std_logic lab=vcm}
C {simulator_commands_shown.sym} -417350 30160 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.CONTROL

save all
op
write highpass_omp.raw
set appendwrite
ac dec 100 0.1 10e6
write highpass_omp.raw
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
C {opamp_model2.sym} -416450 30640 0 0 {name=x1}
