Title : Simple HighPass Filter

**High Pass Element
Cbyp	Vin	n1	4.7u
Rhp	n1	Vcm	5k

**Stimuli
Vsin	Vin 	0	0 AC 1
Vscm	Vcm	0 	0.5

.OP
.CONTROL
save all
AC DEC 100 1 10e6
plot vdb(n1)
plot v(n1)
meas ac gain MAX vmag(n1) FROM=1 TO = 10e6
LET gain_db=20*log10(gain)
LET f3db=gain/sqrt(2)
print gain_db 
print f3db
MEAS AC fzero WHEN vmag(n1)=f3db RISE=1

.ENDC
.END



