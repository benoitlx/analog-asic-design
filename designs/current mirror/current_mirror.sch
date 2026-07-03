v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 0 30 0 50 {lab=0}
N 0 -60 0 -30 {lab=Vdd}
N 170 -70 170 -30 {lab=#net1}
N 210 -0 270 0 {lab=#net1}
N 170 -50 240 -50 {lab=#net1}
N 240 -50 240 -0 {lab=#net1}
N 170 30 170 50 {lab=0}
N 310 30 310 50 {lab=0}
N 170 -150 170 -130 {lab=Vdd}
N 310 -50 310 -30 {lab=#net2}
N 160 30 170 30 {lab=0}
N 160 0 160 30 {lab=0}
N 160 0 170 -0 {lab=0}
N 310 30 320 30 {lab=0}
N 320 0 320 30 {lab=0}
N 310 -0 320 0 {lab=0}
N 310 -70 310 -50 {lab=#net2}
N 310 -150 310 -130 {lab=Vdd}
C {gnd.sym} 0 50 0 0 {name=l2 lab=0}
C {vsource.sym} 0 0 0 0 {name=V2 value=1.8 savecurrent=false}
C {lab_pin.sym} 0 -60 1 0 {name=p3 sig_type=std_logic lab=Vdd}
C {/foss/pdks/ihp-sg13g2/libs.tech/xschem/sg13g2_pr/sg13_lv_nmos.sym} 290 0 0 0 {name=M2
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {/foss/pdks/ihp-sg13g2/libs.tech/xschem/sg13g2_pr/sg13_lv_nmos.sym} 190 0 0 1 {name=M1
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {gnd.sym} 170 50 0 0 {name=l1 lab=0}
C {gnd.sym} 310 50 0 0 {name=l3 lab=0}
C {lab_pin.sym} 170 -150 1 0 {name=p1 sig_type=std_logic lab=Vdd}
C {code_shown.sym} -160 -240 0 0 {name=include only_toplevel=false value=".lib cornerMOSlv.lib mos_tt"}
C {code_shown.sym} -160 -180 0 0 {name=control only_toplevel=false value="
.control

op
print @R1[i]
print @R2[i]

alter R2=2k
op
print @R1[i]
print @R2[i]

alter R2=50k
op
print @R1[i]
print @R2[i]

.endc
"}
C {res.sym} 170 -100 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} 310 -100 0 0 {name=R2
value=1k
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 310 -150 1 0 {name=p2 sig_type=std_logic lab=Vdd}
