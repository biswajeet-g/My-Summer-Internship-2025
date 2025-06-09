Title : transient experiment: rise, fall, delay, period, etc.

**RC Network
R1	vin 	vout	1k
C1	vout	GND	1p

**stimuli 
vsin	vin	GND	0 PULSE(0 5 1n 1p 1p 10n 20n)

.MEASURE TRAN tr1090 TRIG v(vout) VAL=0.5 RISE=1 TARG v(vout) VAL=4.5 RISE=1
.MEASURE TRAN tf9010 TRIG v(vout) VAL=4.5 FALL=1 TARG v(vout) VAL=0.5 FALL=1

.MEASURE TRAN tr1090 TRIG v(vout) VAL=1.0 RISE=1 TARG v(vout) VAL=4.0 RISE=1
.MEASURE TRAN tf9010 TRIG v(vout) VAL=4.0 FALL=1 TARG v(vout) VAL=1.0 FALL=1

.MEASURE TRAN tr1090 TRIG v(vout) VAL=2.5 RISE=1 TARG v(vin) VAL=2.5 RISE=1
.MEASURE TRAN tf9010 TRIG v(vout) VAL=2.5 FALL=1 TARG v(vout) VAL=2.5 FALL=1

.CONTROL
 OP
 TRAN 10p 40n

.ENDC

.GLOBAL GND
.END
