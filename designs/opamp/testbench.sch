v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 730 170 730 190 {lab=0}
N 730 80 730 110 {lab=Vdd}
N 810 170 810 190 {lab=0}
N 810 80 810 110 {lab=Vn}
N 880 170 880 190 {lab=0}
N 880 80 880 110 {lab=Vp}
N 320 130 320 150 {lab=Vdd}
N 320 150 330 150 {lab=Vdd}
N 650 170 650 190 {lab=0}
N 650 90 650 110 {lab=Vout}
N 530 110 580 110 {lab=Vout}
N 480 10 480 80 {lab=Vdd}
N 480 140 480 200 {lab=0}
N 390 150 420 150 {lab=#net1}
C {code_shown.sym} -20 -20 0 0 {name=include only_toplevel=false value=".lib cornerMOSlv.lib mos_tt"}
C {code_shown.sym} -20 40 0 0 {name=control only_toplevel=false value="
.control

ac dec 100 1 1G
let diff_in = v(Vp) - v(Vn)
let diff_gain = v(Vout)/diff_in
let psrr_plus = v(Vout)/v(Vdd)

plot db(diff_gain)
plot db(psrr_plus)

.endc
"}
C {gnd.sym} 730 190 0 0 {name=l2 lab=0}
C {vsource.sym} 730 140 0 0 {name=V2 value=1.8 savecurrent=false}
C {lab_pin.sym} 730 80 1 0 {name=p3 sig_type=std_logic lab=Vdd}
C {gnd.sym} 810 190 0 0 {name=l1 lab=0}
C {vsource.sym} 810 140 0 0 {name=V1 value=0.905 savecurrent=false}
C {lab_pin.sym} 810 80 1 0 {name=p1 sig_type=std_logic lab=Vn}
C {gnd.sym} 880 190 0 0 {name=l3 lab=0}
C {vsource.sym} 880 140 0 0 {name=V3 value=0.895 savecurrent=false}
C {lab_pin.sym} 880 80 1 0 {name=p2 sig_type=std_logic lab=Vp}
C {lab_pin.sym} 480 10 1 0 {name=p4 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} 420 90 0 0 {name=p5 sig_type=std_logic lab=Vn}
C {lab_pin.sym} 420 130 0 0 {name=p6 sig_type=std_logic lab=Vp}
C {gnd.sym} 480 200 0 0 {name=l4 lab=0}
C {isource.sym} 360 150 3 0 {name=I0 value=10u}
C {lab_pin.sym} 320 130 1 0 {name=p7 sig_type=std_logic lab=Vdd}
C {capa.sym} 650 140 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 650 190 0 0 {name=l5 lab=0}
C {lab_pin.sym} 580 110 2 0 {name=p8 sig_type=std_logic lab=Vout}
C {lab_pin.sym} 650 90 1 0 {name=p9 sig_type=std_logic lab=Vout}
C {/var/home/bleroux/Documents/stage_IEMN/analog-asic-design/designs/opamp/opamp.sym} 470 110 0 0 {name=x1}
