v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -120 -70 -120 -40 {lab=vin}
N -120 -70 -60 -70 {lab=vin}
N 0 -70 90 -70 {lab=vout}
N 90 -70 90 -40 {lab=vout}
N -120 20 -120 80 {lab=GND}
N 90 20 90 80 {lab=GND}
N -120 80 90 80 {lab=GND}
N 90 80 90 100 {lab=GND}
C {vsource.sym} -120 -10 0 0 {name=V1 value="0 AC 1" savecurrent=false}
C {capa.sym} -30 -70 3 0 {name=C1
m=1
value=613f
footprint=1206
device="ceramic capacitor"}
C {res.sym} 90 -10 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {gnd.sym} 90 100 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -120 -60 0 0 {name=p1 sig_type=std_logic lab=vin
}
C {lab_pin.sym} 90 -60 2 0 {name=p2 sig_type=std_logic lab=vout}
C {simulator_commands_shown.sym} -370 -130 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.CONTROL

save all
op 
write rectifierhw.raw
set appendwrite
ac dec 10 1 10e6
write rectifierhw.raw

"}
