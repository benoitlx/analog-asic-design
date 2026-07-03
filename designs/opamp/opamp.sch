v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 90 410 100 410 {lab=Vp}
N -220 410 -210 410 {lab=Vn}
N 50 270 60 270 {lab=VDD}
N -170 440 -170 460 {lab=#net1}
N -170 460 50 460 {lab=#net1}
N 50 440 50 460 {lab=#net1}
N -60 460 -60 490 {lab=#net1}
N -170 440 -160 440 {lab=#net1}
N -160 410 -160 440 {lab=#net1}
N -170 410 -160 410 {lab=#net1}
N 40 440 50 440 {lab=#net1}
N 40 410 40 440 {lab=#net1}
N 40 410 50 410 {lab=#net1}
N -170 300 -170 380 {lab=#net2}
N 50 300 50 380 {lab=#net3}
N -130 270 10 270 {lab=#net2}
N -170 320 -110 320 {lab=#net2}
N -110 270 -110 320 {lab=#net2}
N -180 270 -170 270 {lab=VDD}
N -180 240 -180 270 {lab=VDD}
N -180 240 -170 240 {lab=VDD}
N 60 240 60 270 {lab=VDD}
N 50 240 60 240 {lab=VDD}
N -170 220 -170 240 {lab=VDD}
N -170 220 50 220 {lab=VDD}
N 50 220 50 240 {lab=VDD}
N -50 180 -50 220 {lab=VDD}
N -360 180 -50 180 {lab=VDD}
N -50 180 160 180 {lab=VDD}
N -60 550 -50 550 {lab=Vss}
N -50 520 -50 550 {lab=Vss}
N -60 520 -50 520 {lab=Vss}
N -300 550 -290 550 {lab=Vss}
N -300 520 -300 550 {lab=Vss}
N -300 520 -290 520 {lab=Vss}
N -250 520 -100 520 {lab=Vref}
N -290 550 -290 590 {lab=Vss}
N -290 590 160 590 {lab=Vss}
N -60 550 -60 590 {lab=Vss}
N -360 590 -340 590 {lab=Vss}
N -120 520 -120 570 {lab=Vref}
N -120 570 40 570 {lab=Vref}
N 40 520 40 570 {lab=Vref}
N 40 520 170 520 {lab=Vref}
N 160 590 210 590 {lab=Vss}
N 210 550 210 590 {lab=Vss}
N 210 550 220 550 {lab=Vss}
N 220 520 220 550 {lab=Vss}
N 210 520 220 520 {lab=Vss}
N 50 330 170 330 {lab=#net3}
N 210 330 220 330 {lab=VDD}
N 220 300 220 330 {lab=VDD}
N 210 300 220 300 {lab=VDD}
N 210 180 210 300 {lab=VDD}
N 160 180 210 180 {lab=VDD}
N 210 360 210 490 {lab=Vout}
N 210 420 250 420 {lab=Vout}
N 190 380 210 380 {lab=Vout}
N 110 380 130 380 {lab=#net3}
N 110 330 110 380 {lab=#net3}
N -340 590 -290 590 {lab=Vss}
N -360 400 -290 400 {lab=Vref}
N -290 400 -290 490 {lab=Vref}
N -290 460 -220 460 {lab=Vref}
N -220 460 -220 520 {lab=Vref}
C {code_shown.sym} -410 140 0 0 {name=include only_toplevel=false value=".lib cornerMOSlv.lib mos_tt"}
C {/foss/pdks/ihp-sg13g2/libs.tech/xschem/sg13g2_pr/sg13_lv_nmos.sym} -190 410 0 0 {name=M3
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {/foss/pdks/ihp-sg13g2/libs.tech/xschem/sg13g2_pr/sg13_lv_nmos.sym} 70 410 0 1 {name=M4
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {/foss/pdks/ihp-sg13g2/libs.tech/xschem/sg13g2_pr/sg13_lv_pmos.sym} -150 270 0 1 {name=M5
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {/foss/pdks/ihp-sg13g2/libs.tech/xschem/sg13g2_pr/sg13_lv_pmos.sym} 30 270 0 0 {name=M6
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {/foss/pdks/ihp-sg13g2/libs.tech/xschem/sg13g2_pr/sg13_lv_nmos.sym} -80 520 0 0 {name=M7
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {/foss/pdks/ihp-sg13g2/libs.tech/xschem/sg13g2_pr/sg13_lv_nmos.sym} 190 520 0 0 {name=M8
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {/foss/pdks/ihp-sg13g2/libs.tech/xschem/sg13g2_pr/sg13_lv_nmos.sym} -270 520 0 1 {name=M9
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {/foss/pdks/ihp-sg13g2/libs.tech/xschem/sg13g2_pr/sg13_lv_pmos.sym} 190 330 0 0 {name=M10
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {ipin.sym} -220 410 0 0 {name=p1 lab=Vn}
C {ipin.sym} 100 410 0 1 {name=p3 lab=Vp}
C {opin.sym} 250 420 0 0 {name=p5 lab=Vout}
C {iopin.sym} -360 180 0 1 {name=p7 lab=VDD}
C {iopin.sym} -360 400 0 1 {name=p2 lab=Vref}
C {iopin.sym} -360 590 0 1 {name=p4 lab=Vss}
C {capa.sym} 160 380 1 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
