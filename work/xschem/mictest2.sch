v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -430 -70 -350 -70 {lab=#net1}
N -430 -70 -430 -0 {lab=#net1}
N -430 120 -430 140 {lab=GND}
N -430 60 -430 110 {lab=GND}
N -430 110 -430 120 {lab=GND}
N -290 -70 -240 -70 {lab=#net2}
N -180 -70 -100 -70 {lab=#net3}
N -40 -70 60 -70 {lab=#net4}
N 20 -110 20 10 {lab=#net5}
N -20 -250 60 -250 {lab=#net4}
N -20 -250 -20 -70 {lab=#net4}
N -20 -180 60 -180 {lab=#net4}
N 120 -180 220 -180 {lab=#net6}
N 220 -180 220 -120 {lab=#net6}
N 120 -250 220 -250 {lab=#net6}
N 220 -250 220 -180 {lab=#net6}
N 30 -110 180 -110 {lab=#net5}
N 20 -110 30 -110 {lab=#net5}
N 60 -70 180 -70 {lab=#net4}
N 220 -180 370 -180 {lab=#net6}
N 370 -180 370 -130 {lab=#net6}
N 20 70 20 140 {lab=GND}
N 20 140 20 160 {lab=GND}
N 370 -70 370 -20 {lab=GND}
C {vcvs.sym} 220 -90 0 0 {name=E1 value=3}
C {res.sym} -70 -70 3 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {capa.sym} -210 -70 3 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} 20 40 0 0 {name=V2 value=3 savecurrent=false}
C {res.sym} 90 -180 3 0 {name=R2
value=1k
footprint=1206
device=resistor
m=1}
C {capa.sym} 90 -250 3 0 {name=C2
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 370 -100 0 0 {name=C3
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {res.sym} -320 -70 3 0 {name=R3
value=1k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -430 30 0 0 {name=V3 value=3 savecurrent=false}
C {gnd.sym} -430 140 0 0 {name=l1 lab=GND}
C {gnd.sym} 20 160 0 0 {name=l2 lab=GND}
C {gnd.sym} 370 -20 0 0 {name=l3 lab=GND}
C {simulator_commands_shown.sym} 530 -420 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.CONTROL

save all
op
write mictest1.raw
set appendwrite
ac dec 100 0.1 10e6
write mictest1.raw
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
