.TITLE Diode Experiment

.MODEL diode1 D (bv=50 is=1e-13 n=1.05)

D1	vin	vout	diode1
R1	vout	GND	1k
**C1	vout 	GND	1p

vsin 	vin	GND	0 sin(0 1 1e3 0 0 0)

.OP
.TRAN 1u 4e-3

.END

