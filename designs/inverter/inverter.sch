v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 -450 230 -60 470 {flags=graph,unlocked
y1=-5.5511151e-17
y2=1.8
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-0.13392238
x2=1.9797982
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="vout
net1
gain"
color="7 8 5"
dataset=-1
unitx=1
logx=0
logy=0
rawfile=$netlist_dir/inverter-dc-sweep.raw
linewidth_mult=3
sim_type=dc
autoload=1
hilight_wave=0}
B 2 -30 230 370 470 {flags=graph
y1=0
y2=1.8
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-2.4137277e-08
x2=-1.0592188e-09
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="vout
net1"
color="4 5"
dataset=-1
unitx=1
logx=0
logy=0
rawfile=$netlist_dir/inverter-tr.raw
sim_type=tran
autoload=1
linewidth_mult=3
hilight_wave=0}
N 170 10 170 50 {lab=Vout}
N 130 -20 130 80 {lab=#net1}
N 170 30 250 30 {lab=Vout}
N 170 -80 170 -50 {lab=Vdd}
N 50 120 50 140 {lab=0}
N 50 30 50 60 {lab=#net1}
N 50 30 130 30 {lab=#net1}
N -40 120 -40 140 {lab=0}
N -40 30 -40 60 {lab=Vdd}
N 170 110 170 140 {lab=0}
N 170 110 180 110 {lab=0}
N 180 80 180 110 {lab=0}
N 170 80 180 80 {lab=0}
N 170 -50 180 -50 {lab=Vdd}
N 180 -50 180 -20 {lab=Vdd}
N 170 -20 180 -20 {lab=Vdd}
C {/foss/pdks/ihp-sg13g2/libs.tech/xschem/sg13g2_pr/sg13_lv_pmos.sym} 150 -20 0 0 {name=M1
l=0.45u
w=1.0u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {/foss/pdks/ihp-sg13g2/libs.tech/xschem/sg13g2_pr/sg13_lv_nmos.sym} 150 80 0 0 {name=M2
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {gnd.sym} 50 140 0 0 {name=l1 lab=0}
C {vsource.sym} 50 90 0 0 {name=V1 value="pulse(0 1.8 1ns 1ns 1ns 5ns 10ns)" savecurrent=false}
C {code_shown.sym} -460 -90 0 0 {name=include only_toplevel=false value=".lib cornerMOSlv.lib mos_tt"}
C {lab_pin.sym} 250 30 2 0 {name=p1 sig_type=std_logic lab=Vout}
C {gnd.sym} -40 140 0 0 {name=l2 lab=0}
C {vsource.sym} -40 90 0 0 {name=V2 value=1.8 savecurrent=false}
C {code_shown.sym} -460 -30 0 0 {name=control only_toplevel=false value="
.control

tran 50p 20n
*op
save all
write inverter-tr.raw

dc V1 0 1.8 1m
let gain = -deriv(Vout)/12
save all
write inverter-dc-sweep.raw

.endc
"}
C {gnd.sym} 170 140 0 0 {name=l3 lab=0}
C {lab_pin.sym} 170 -80 1 0 {name=p2 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} -40 30 1 0 {name=p3 sig_type=std_logic lab=Vdd}
C {launcher.sym} -390 490 0 0 {name=h5
descr="DC Sweep"
tclcommand="xschem raw_read $netlist_dir/inverter-dc-sweep.raw tran"
}
C {launcher.sym} 30 490 0 0 {name=h1
descr="Transient"
tclcommand="xschem raw_read $netlist_dir/inverter-tr.raw tran"
}
