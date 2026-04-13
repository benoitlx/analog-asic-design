v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 70 0 70 40 {lab=GND}
N 120 -30 120 40 {lab=GND}
N 70 -30 120 -30 {lab=GND}
N -30 40 -30 60 {lab=GND}
N -30 -30 -30 -20 {lab=G}
N -30 -30 30 -30 {lab=G}
N 200 20 200 40 {lab=GND}
N 200 -70 200 -40 {lab=#net1}
N 70 -70 70 -60 {lab=D}
N 200 -90 200 -70 {lab=#net1}
N 170 -90 200 -90 {lab=#net1}
N 70 -90 110 -90 {lab=D}
N 70 -90 70 -70 {lab=D}
N -40 -60 -10 -60 {lab=G}
N -10 -60 -10 -30 {lab=G}
N 50 -100 70 -100 {lab=D}
N 70 -100 70 -90 {lab=D}
C {/foss/pdks/ihp-sg13g2/libs.tech/xschem/sg13g2_pr/sg13_lv_nmos.sym} 50 -30 0 0 {name=M1
w=0.15u
l=0.13u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {gnd.sym} 70 40 0 0 {name=l1 lab=GND}
C {vsource.sym} -30 10 0 0 {name=VGS value=3 savecurrent=false}
C {code_shown.sym} -380 -130 0 0 {name=include only_toplevel=false value=".lib cornerMOSlv.lib mos_tt"}
C {gnd.sym} 120 40 0 0 {name=l2 lab=GND}
C {gnd.sym} -30 60 0 0 {name=l3 lab=GND}
C {vsource.sym} 200 -10 0 0 {name=VDS value=3 savecurrent=false}
C {gnd.sym} 200 40 0 0 {name=l4 lab=GND}
C {code_shown.sym} -375 -60 0 0 {name=control only_toplevel=false value="
.control

dc VDS 0 1.5 0.01 VGS 0 1.5 0.1
save all
plot i(VD)

.endc
"}
C {ammeter.sym} 140 -90 1 0 {name=VD savecurrent=true spice_ignore=0}
C {iopin.sym} 50 -100 2 0 {name=p2 lab=D}
C {iopin.sym} -40 -60 2 0 {name=p1 lab=G}
