v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 80 -100 80 -70 {lab=vop}
N 80 -100 170 -100 {lab=vop}
N 80 -10 80 30 {lab=vom}
N 80 30 170 30 {lab=vom}
N -20 -60 40 -60 {lab=vip}
N -20 -20 40 -20 {lab=vim}
C {vcvs.sym} 80 -40 0 0 {name=E1 value=1000
}
C {iopin.sym} 170 -100 0 0 {name=p1 lab=vop}
C {iopin.sym} 170 30 0 0 {name=p2 lab=vom}
C {iopin.sym} -20 -20 2 0 {name=p3 lab=vim}
C {iopin.sym} -20 -60 2 0 {name=p4 lab=vip}
