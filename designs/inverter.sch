v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 0 170 390 410 {flags=graph
y1=0
y2=3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-1.9811578e-09
x2=2.0729948e-08
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="vout
"
color=7
dataset=-1
unitx=1
logx=0
logy=0
}
N 80 10 80 50 {lab=Vout}
N 40 -20 40 80 {lab=#net1}
N 80 30 160 30 {lab=Vout}
N 80 -80 80 -50 {lab=Vdd}
N -40 120 -40 140 {lab=0}
N -40 30 -40 60 {lab=#net1}
N -40 30 40 30 {lab=#net1}
N -130 120 -130 140 {lab=0}
N -130 30 -130 60 {lab=Vdd}
N 80 110 80 140 {lab=0}
N 80 110 90 110 {lab=0}
N 90 80 90 110 {lab=0}
N 80 80 90 80 {lab=0}
N 80 -50 90 -50 {lab=Vdd}
N 90 -50 90 -20 {lab=Vdd}
N 80 -20 90 -20 {lab=Vdd}
C {/foss/pdks/ihp-sg13g2/libs.tech/xschem/sg13g2_pr/sg13_lv_pmos.sym} 60 -20 0 0 {name=M1
l=0.45u
w=1.0u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {/foss/pdks/ihp-sg13g2/libs.tech/xschem/sg13g2_pr/sg13_lv_nmos.sym} 60 80 0 0 {name=M2
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {gnd.sym} -40 140 0 0 {name=l1 lab=0}
C {vsource.sym} -40 90 0 0 {name=V1 value="pulse(0 1.8 1ns 1ns 1ns 5ns 10ns)" savecurrent=false}
C {code_shown.sym} -250 -60 0 0 {name=include only_toplevel=false value=".lib cornerMOSlv.lib mos_tt"}
C {lab_pin.sym} 160 30 2 0 {name=p1 sig_type=std_logic lab=Vout}
C {gnd.sym} -130 140 0 0 {name=l2 lab=0}
C {vsource.sym} -130 90 0 0 {name=V2 value=3 savecurrent=false}
C {code_shown.sym} -260 170 0 0 {name=control only_toplevel=false value="
.control

tran 50p 20n
*op
save all
write inverter.raw

.endc
"}
C {gnd.sym} 80 140 0 0 {name=l3 lab=0}
C {lab_pin.sym} 80 -80 1 0 {name=p2 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} -130 30 1 0 {name=p3 sig_type=std_logic lab=Vdd}
