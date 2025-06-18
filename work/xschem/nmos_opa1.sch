v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -310 -60 -310 50 {lab=V2}
N -310 -60 40 -60 {lab=V2}
N 40 -60 40 -20 {lab=V2}
N -200 -20 -150 -20 {lab=V2}
N -200 20 -150 20 {lab=GND}
N -200 20 -200 80 {lab=GND}
N 40 20 40 50 {lab=GND}
N -200 50 40 50 {lab=GND}
N -110 30 -110 70 {lab=vcm}
N -110 70 80 70 {lab=vcm}
N 80 30 80 70 {lab=vcm}
N -50 70 -50 110 {lab=vcm}
N -110 -90 -110 -30 {lab=vim}
N -110 -100 170 -100 {lab=vim}
N -110 -100 -110 -90 {lab=vim}
N -200 -60 -200 -20 {lab=V2}
N -200 80 -200 150 {lab=GND}
N -50 170 -50 240 {lab=GND}
N -200 240 -50 240 {lab=GND}
N -200 150 -200 240 {lab=GND}
N 80 -60 80 -30 {lab=vip}
N 80 -60 170 -60 {lab=vip}
N -310 110 -310 240 {lab=GND}
N -310 240 -200 240 {lab=GND}
N 210 -20 210 240 {lab=GND}
N -50 240 210 240 {lab=GND}
N 310 -80 460 -80 {lab=vout}
N 460 -80 460 110 {lab=vout}
N 460 170 460 240 {lab=GND}
N 210 240 460 240 {lab=GND}
N 210 240 210 290 {lab=GND}
N 100 290 210 290 {lab=GND}
N 240 -320 240 -130 {lab=AVDD}
N 140 -320 140 -290 {lab=AVDD}
N 140 -230 140 -190 {lab=GND}
N 140 -320 280 -320 {lab=AVDD}
N 280 -320 280 -240 {lab=AVDD}
N 260 -130 280 -130 {lab=#net1}
N 280 -180 280 -130 {lab=#net1}
C {vcvs.sym} -110 0 0 0 {name=E1 value=-0.5}
C {vcvs.sym} 80 0 0 0 {name=E2 value=0.5}
C {vsource.sym} -310 80 0 0 {name=V2 value="0 AC 1" savecurrent=false}
C {vsource.sym} -50 140 0 0 {name=vcm value=0.9 savecurrent=false}
C {vsource.sym} 140 -260 0 0 {name=vdd value=1.8 savecurrent=false}
C {isource.sym} 280 -210 0 0 {name=I0 value=5u}
C {capa.sym} 460 140 0 0 {name=C1
m=1
value=10f
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 100 290 0 0 {name=l1 lab=GND}
C {gnd.sym} 140 -190 0 0 {name=l2 lab=GND}
C {nmosopampmrr.sym} -40 40 0 0 {name=x1}
C {devices/code.sym} 480 -300 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {lab_pin.sym} -110 -90 0 0 {name=p1 sig_type=std_logic lab=vim}
C {lab_pin.sym} 80 -50 0 0 {name=p2 sig_type=std_logic lab=vip}
C {lab_pin.sym} -50 90 0 0 {name=p3 sig_type=std_logic lab=vcm}
C {lab_pin.sym} -310 10 0 0 {name=p4 sig_type=std_logic lab=V2}
C {lab_pin.sym} 240 -200 0 0 {name=p5 sig_type=std_logic lab=AVDD}
C {lab_pin.sym} 460 -30 0 0 {name=p7 sig_type=std_logic lab=vout}
C {simulator_commands_shown.sym} 700 -400 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.CONTROL

    save all

    save @m.x1.xm1.msky130_fd_pr__nfet_01v8[id]
    save @m.x1.xm1.msky130_fd_pr__nfet_01v8[gm]
    
    save @m.x1.xmim.msky130_fd_pr__nfet_01v8_lvt[id]
    save @m.x1.xmim.msky130_fd_pr__nfet_01v8_lvt[gm]
    
    save @m.x1.xmip.msky130_fd_pr__nfet_01v8_lvt[id]
    save @m.x1.xmip.msky130_fd_pr__nfet_01v8_lvt[gm]
    
    save @m.x1.xmpcmm.msky130_fd_pr__pfet_01v8_lvt[id]
    save @m.x1.xmpcmm.msky130_fd_pr__pfet_01v8_lvt[gm]
    
    save @m.x1.xmpcmp.msky130_fd_pr__pfet_01v8_lvt[id]
    save @m.x1.xmpcmp.msky130_fd_pr__pfet_01v8_lvt[gm]
    
    save @m.x1.xmtail.msky130_fd_pr__nfet_01v8[id]
    save @m.x1.xmtail.msky130_fd_pr__nfet_01v8[gm]
    
    OP
    write nmos_opa1.raw
    let im1=@m.x1.xm1.msky130_fd_pr__nfet_01v8[id]
    let imim=@m.x1.xmim.msky130_fd_pr__nfet_01v8_lvt[id]
    let imip=@m.x1.xmip.msky130_fd_pr__nfet_01v8_lvt[id]
    let impcmm=@m.x1.xmpcmm.msky130_fd_pr__pfet_01v8_lvt[id]
    let impcmp=@m.x1.xmpcmp.msky130_fd_pr__pfet_01v8_lvt[id]
    let imtail=@m.x1.xmtail.msky130_fd_pr__nfet_01v8[id]

    let gmm1=@m.x1.xm1.msky130_fd_pr__nfet_01v8[gm]
    let gmmim=@m.x1.xmim.msky130_fd_pr__nfet_01v8_lvt[gm]
    let gmmip=@m.x1.xmip.msky130_fd_pr__nfet_01v8_lvt[gm]
    let gmmpcmm=@m.x1.xmpcmm.msky130_fd_pr__pfet_01v8_lvt[gm]
    let gmmpcmp=@m.x1.xmpcmp.msky130_fd_pr__pfet_01v8_lvt[gm]
    let gmmtail=@m.x1.xmtail.msky130_fd_pr__nfet_01v8[gm]

 	let gmm1im1=gmm1/im1
	let gmmtailimtail=gmmtail/imtail
	let gmmimimim=gmmim/imim
	let gmmipimip=gmmip/imip
	let gmmpcmmimpcmm=gmmpcmm/impcmm
	let gmmpcmpimpcmp=gmmpcmp/impcmp
	
	print gmm1im1
	print gmmtailimtail
	print gmmimimim
	print gmmipimip
	print gmmpcmmimpcmm
	print gmmpcmpimpcmp

.ENDC

"}
