v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -80 -110 20 -110 {lab=Vnmic}
N 80 -110 110 -110 {lab=vn1}
N 170 -110 200 -110 {lab=vn2}
N -80 -110 -80 -90 {lab=Vnmic}
N -80 -30 -80 10 {lab=GND}
N 280 -250 330 -250 {lab=#net1}
N 280 -250 280 -110 {lab=#net1}
N 280 -190 330 -190 {lab=#net1}
N 390 -250 460 -250 {lab=vout}
N 460 -250 460 -160 {lab=vout}
N 390 -190 460 -190 {lab=vout}
N 460 -100 460 -70 {lab=GND}
N 350 0 350 40 {lab=GND}
N 600 -180 600 -160 {lab=vout}
N 460 -180 600 -180 {lab=vout}
N 600 -100 600 -60 {lab=GND}
N 260 -110 420 -110 {lab=#net1}
N 350 -150 420 -150 {lab=vcm}
N 350 -150 350 -60 {lab=vcm}
N 350 40 350 50 {lab=GND}
C {vsource.sym} -80 -60 0 0 {name=Vmic value="0 AC 1" savecurrent=false}
C {res.sym} 50 -110 3 0 {name=R1
value=380

footprint=1206
device=resistor
m=1}
C {capa.sym} 140 -110 3 0 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -80 10 0 0 {name=l1 lab=GND}
C {res.sym} 230 -110 3 0 {name=R3
value=4.7k
footprint=1206
device=resistor
m=1}
C {vcvs.sym} 460 -130 0 0 {name=E1 value=1000}
C {gnd.sym} 460 -70 0 0 {name=l2 lab=GND}
C {capa.sym} 360 -250 3 0 {name=C2
m=1
value=27p
footprint=1206
device="ceramic capacitor"}
C {res.sym} 360 -190 3 0 {name=R2
value=300k
footprint=1206
device=resistor
m=1}
C {vsource.sym} 350 -30 0 0 {name=V2 value=1.5
 savecurrent=false}
C {gnd.sym} 350 50 0 0 {name=l3 lab=GND}
C {capa.sym} 600 -130 0 0 {name=C3
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 600 -60 0 0 {name=l4 lab=GND}
C {lab_pin.sym} -20 -110 1 0 {name=p1 sig_type=std_logic lab=Vnmic}
C {lab_pin.sym} 100 -110 1 0 {name=p2 sig_type=std_logic lab=vn1}
C {lab_pin.sym} 190 -110 1 0 {name=p3 sig_type=std_logic lab=vn2}
C {lab_pin.sym} 550 -180 1 0 {name=p4 sig_type=std_logic lab=vout}
C {lab_pin.sym} 350 -80 0 0 {name=p5 sig_type=std_logic lab=vcm
}
C {simulator_commands_shown.sym} -570 -580 0 0 {name=COMMANDS
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
