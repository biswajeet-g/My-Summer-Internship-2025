v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -30 -70 50 -70 {lab=vip}
N -30 -30 50 -30 {lab=vim}
N 90 -110 90 -80 {lab=vop}
N 90 -110 180 -110 {lab=vop}
N 90 -20 90 20 {lab=vom}
N 90 20 180 20 {lab=vom}
C {vcvs.sym} 90 -50 0 0 {name=E1 value=1000
}
C {iopin.sym} -30 -70 2 0 {name=p1 lab=vip}
C {iopin.sym} -30 -30 2 0 {name=p2 lab=vim}
C {iopin.sym} 180 -110 0 0 {name=p3 lab=vop}
C {iopin.sym} 180 20 0 0 {name=p4 lab=vom}
