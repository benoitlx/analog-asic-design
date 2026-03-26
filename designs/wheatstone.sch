v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 150 100 150 140 {lab=#net1}
N 240 100 240 140 {lab=#net2}
N 150 200 150 210 {lab=#net3}
N 150 210 240 210 {lab=#net3}
N 240 200 240 210 {lab=#net3}
N 150 30 150 40 {lab=#net4}
N 150 30 240 30 {lab=#net4}
N 240 30 240 40 {lab=#net4}
N 240 120 310 120 {lab=#net2}
N 90 120 150 120 {lab=#net1}
N 90 10 90 120 {lab=#net1}
N 90 10 290 10 {lab=#net1}
N 290 10 290 60 {lab=#net1}
N 290 60 310 60 {lab=#net1}
N 430 90 520 90 {lab=#net5}
N 520 90 520 120 {lab=#net5}
N 520 180 520 230 {lab=#net3}
N 190 230 520 230 {lab=#net3}
N 190 210 190 230 {lab=#net3}
C {res.sym} 150 70 2 0 {name=R1
value=100
footprint=1206
device=resistor
m=1}
C {res.sym} 240 70 2 0 {name=R2
value=100
footprint=1206
device=resistor
m=1}
C {res.sym} 150 170 2 0 {name=R3
value=75
footprint=1206
device=resistor
m=1}
C {res.sym} 240 170 2 0 {name=R4
value=95
footprint=1206
device=resistor
m=1}
C {opamp_65nm.sym} 370 90 0 0 {name=x1}
C {res.sym} 520 150 2 0 {name=R5
value=100
footprint=1206
device=resistor
m=1}
