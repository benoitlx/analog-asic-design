#import "@local/iemn-paper:0.1.3" /* From 0.1.0 */: project
#import "@preview/glossarium:0.5.10": make-glossary, register-glossary, print-glossary, gls, glspl
#import "@preview/dashy-todo:0.1.3": todo
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import fletcher.shapes: house, hexagon

#show: make-glossary

#let gloss = (
  (
    key: "pdk",
    short: "PDK",
    long: "Process Design Kit",
  ),
  (
    key: "ic",
    short: "IC",
    long: "Integrated Circuit",
  ),
  (
    key: "nda",
    short: "NDA",
    long: "Non Disclosure Agreement",
  ),
  (
    key: "eda",
    short: "EDA",
    long: "Electronic Design Automation",
  ),
  (
    key: "fpga",
    short: "FPGA",
    long: "Field Programmable Gate Array",
  ),
  (
    key: "asic",
    short: "ASIC",
    long: "Application Specific Integrated Circuit"
  )
)
#register-glossary(gloss)


#show: project.with(title: [Design of an analogic #gls("asic") with open source tools],
  authors: ((name: "Benoit Leroux", mail: "benoit.leroux@centrale.centralelille.fr"),),
  date: datetime.today(),
)


#let blob(pos, label, tint: white, ..args) = node(
	pos, align(center, label),
	width: 28mm,
	fill: tint.lighten(60%),
	stroke: 1pt + tint.darken(20%),
	corner-radius: 5pt,
	..args,
)

= Introduction

#gls("ic") design in industry is built around tightly controlled, highly optimized flows that prioritize yield, manufacturability, speed to market, and protection of intellectual property. Those priorities shape toolchains, #gls("pdk"), collaboration practices, and business/legal arrangements. While this model is efficient for commercial fabs and large design houses, it creates multiple practical and cultural barriers for academic groups and small laboratories. 

The industry model requires signing #gls("nda") to access foundry #gls("pdk"), which keep device models, layout rules, and parasitic data confidential; this restriction undermines reproducibility and prevents open licensing of designs and layout artifacts. Commercial #gls("eda") tools and #gls("pdk") licenses are expensive—often costing thousands of dollars per month for a single tool #todo[link to cadence website], placing them out of reach for many university groups and small labs. Production toolchains are complex and heavyweight, demanding intensive training and dedicated engineering support that most students and small research teams cannot sustain. Foundry design constraints and rigorous process rules limit flexibility, making exploratory or unconventional research difficult to pursue within a commercial process.

#gls("fpga") can mitigate some access and cost issues, but they only address digital designs and do not substitute for analog, mixed-signal, or process-level device experiments that require actual silicon.

The goal of this paper is to present an opinionated, end-to-end design flow that allows an individual to go from idea to fabrication using only tools released under open-source licenses, and to provide additional automation within the chosen toolchain to streamline design, verification, and tapeout for academic and small-lab use.


= Typical Design Flow

#let layout_flow = diagram(blob((0,0), [test]))

#diagram(
  	spacing: 8pt,
  	cell-size: (8mm, 10mm),
  	edge-stroke: 1pt,
  	edge-corner-radius: 5pt,
  	mark-scale: 70%,

  	blob((0,0), [Schematic Entry]),
    edge("->"),
    blob((2,0), [Simulation]),
    edge("->"),
    blob((4,0), [Layout Drawing], name: <A>),
    edge("->"),
    blob((4,1), [DRC], name: <B>),
    edge("->"),
    blob((4,2), [LVS], name: <C>),

    node([test], enclose: (<A>, <B>, <C>), stroke: teal)
)

= Open Source Process Design Kit

- gf180 (US)
- sky130 (US)
- sg13g2 (DE)
- ICPS (JP)

= Toolset diving

== Schematic

- xschem
- kicad / eSim
- https://github.com/thesourcerer8/xschem2kicad

The schematic editor we will use for #gls("asic") design

== Simulation

- ngspice
- xyce
- QUCS-S

== Layout and layers geometry

- Magic
- KLayout

== Verification

- gds3d

= IC design building block

== Current Mirror

== Operationnal Amplifier

= #gls("asic") for a High Temperature Gradient Sensor

== Sensor Presentation

The sensor is composed of 4 resistors. A heating resistance, a feedback resistance and two measurement resitances. The heating resistance is driven by a closed loop with the feedback resistance to achieve the desired temperature.

== Circuit Overview

The circuit can be decomposed into 3 parts:
- The heating closed loop
- The multiplexer and amplification stage for measurement
- A current generator

=== Heating Circuit

=== Current Generator

=== Measurements stage

= Low Cost Manufacturing Model

- multi project wafer

- efabless
- tinytapeout

= Conclusion

= Glossary

#print-glossary(gloss, show-all: true)
