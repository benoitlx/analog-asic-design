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
  ),
  (
    key: "cmos",
    short: "CMOS",
    long: "Complementary Metal Oxyde Semiconductor",
    description: "Both NMOS and PMOS are fabricated on the same chip."
  ),
  (
    key: "bsim",
    short: "BSIM",
    long: "Berkeley Short-channel IGFET Model",
    description: "MOS model"
  ),
  (
    key: "psp",
    short: "PSP",
    long: "Philips Penn State",
    description: "MOS model"
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

In the rest of this paper we will use xschem for schematic capture.

== Simulation

- ngspice
- xyce
- QUCS-S

== Layout and layers geometry

- Magic
- KLayout
- gdsfactory -> Project seems young and the framework for ihp sg13g2 is a bit misleading (I will try to make my own abstraction of klayout scripting in python)

== Verification

- gds3d

= IC design elements

== Transistors

Structure:
- MOSFET (MOS)
- BJT
- IGBT

Material:
- germanium
- silicon
- gallium arsenide
- silicon carbide
- alloy silicon-germanium
- allotrop of carbon-graphene

Polarity
- NPN/PNP for BJT
- N-channel/P-channel for BJT

=== Models

==== Switch

==== Switch + current source

==== #gls("bsim")

==== #gls("psp")

== Simple inverter

=== Theory

==== Ideal Inverter

An inverter is a base circuit for most complex logic gates. It is composed of two transistors and his role is to invert the digital signal in entry. When the input is in high state, the output should be low and the inverse should be true when the input is low.

==== Resistor Inverter

==== MOS Inverter

=== Schematic

In xschem you can load the nmos and pmos components with right click add symbol and add the following components located in `/foss/pdks/ihp-sg13g2/libs.tech/xschem/sg13g2_pr/`

- sg13_lv_pmos
- sg13_lv_nmos

Add as well generic voltage sources for later simulation.
Use `w` to create and connect wires between components.
Don't forget to connect the bulk modulus of the nmos channel to the ground and the one of the pmos channel to `Vdd`.

You should obtain the following result:

#figure(image("assets/inverter/schematic.png", width: 60%), caption: [Schematic Entry of an Inverter in xschem])

=== Simulation

In simulation check `Use simulator/[schename] in schematic dir` in order to find simulation data more easily.

Code-shown symbols:

```
name=include only_toplevel=false value=".lib cornerMOSlv.lib mos_tt"
```

```
name=control only_toplevel=false value=" .control  tran 50p 20n *op save all write inverter-tr.raw  dc V1 0 1.8 1m let gain = -deriv(Vout)/12 save all write inverter-dc-sweep.raw  .endc "
```

Make sure the netlist format is `spice netlist` in `Options`, `Netlist Format / Symbol Format`.
Then generate the netlist by clicking of the netlist button (you can view the netlist content by pressing shift-A before clicking on netlist).

At this point ngspice will be able to read our netlist to compute the simulation.

Click the simulation button. An interactive prompt will be opened in a new window. You can interact with the computed simulation in this exact window. For example run a `plot vout` command. You should see a square wave in the ngspice viewer.

I find it usefull to see the result of the simulation directly in our xschem window, so we will add graphs there. `Simulation -> Graphs -> Add waveform graphs`. You can resize the graph by pressing ctrl plus selecting a corner of the graph then pressing m. Double click on the graph, check auto-load then go load the corresponding `.raw` file. You can load different signal by typing their name in the editor.

#figure(image("assets/inverter/final.png"), caption: [Final view of the inverter schematic with simulation results])

=== Layout

- J'ai essayé avec GDS Layout, mais trop d'erreur lors du routage plus les llms galèrent un peu avec cette librairie
- J'ai essayé avec les macros python de klayout, mais le routage doit être manuel et l'IA galère à faire des routages correct (ils n'ont pas conscience des DRC)

=> Design du layout à la main dans klayout

#figure(image("assets/inverter/layout.png", height: 50%), caption: [Layout of the inverter])

#figure(image("assets/inverter/3d.png", height: 40%), caption: [3D view of the inverter])

=== Post-Layout Checks

==== DRC

Il suffit de lancer le DRC et coriger erreur par erreur. Les différentes erreurs sont expliquées dans le pdf os_layout_rules du #gls("pdk").

#figure(image("assets/inverter/DRC rule example.png", height: 40%), caption: [Example of NWell rule])

==== LVS

Cette étape permet de comparer la netlist généré à partir de la saisie schématique et la netlist généré à partir du layout, pour vérifier que le layout correspond bien à la schématique saisie.

Dans xschem:
- top level is a .subckt
- disable spicefix attribute

générer la liste et remove les .include et éléments propre à la simulation.
s'assurer que le nom après le subckt colle avec le top level element dans klayout (c'est souvent TOP qu'il faut mettre).

Dans klayout LVS option:
- aller chercher la netlist
- cocher:
  - spice comments
  - top level pins
  - verbose




== Current Mirror

A current mirror allow the copy of a current in one active device to another. It will be usefull in other designs as it allows to keep the current constant independently of the load while making it controlable.

=== Schematic

#figure(image("assets/current_mirror/schematic.png", height: 40%), caption: [Schematic Entry for a simple current mirror])

=== Simulation

#figure(image("assets/current_mirror/simulation.png", height: 40%), caption: [Static simulation for the current mirror])

=== Layout

#figure(image("assets/current_mirror/layout.png", height: 40%), caption: [Layout of a current Mirror]) <curr_mir_lay>

#figure(image("assets/current_mirror/3d.png", height: 40%), caption: [3D view of the layout from @curr_mir_lay])

== Operationnal Amplifier

#figure(image("assets/opamp/schema.png", width: 90%), caption: [Example of an opamp schematic with BJT transistors])

== Howland pump

== Instrumentation Amplifier

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

= References

== Papers and books

- IHP SG13G2 Layout Rules rev 4.0
- Cécile Ghouila-Houri, J. Claudel, J.C. Gerbedoen, Q. Gallas, E. Garnier, et al.. High temperature gradient micro-sensor for wall shear stress and flow direction measurements. Applied Physics Letters, 2016, 109 (241905), 4 p. ￿10.1063/1.4972402￿. ￿hal-01432
- Cécile Ghouila-Houri, Abdelkrim Talbi, Romain Viard, Quentin Gallas, Eric Garnier, et al.. MEMS High Tem- perature Gradient Sensor for Skin-Friction Measurements in Highly Turbulent Flows. IEEE Sensors Journal, 2021, 21 (8), pp.9749-9755. ⟨10.1109/JSEN.2020.2991785⟩. ⟨hal-03229029⟩
- Analog (Integrated) Circuit Design - Harald Pretl Johannes Kepler University harald.pretl\@jku.at - Michael Koefinger - Simon Dorrer
- Analysis and design of Elementary MOS amplifier stages - Boris Murmann
- CMOS VLSI design A circuit and system perspective - Neil H. E. Weste - David Money Harris
- Sub-Miniature Hot-Wire Anemometry for High Reynolds Number Turbulent Flows - Milad Samie
- FOSS CAD/EDA Tools Supporting The European Open Access PDK Initiative - FOSSDEM 2024

== Github and links

- https://github.com/diegohernando/caravel_fulgor_opamp
- https://tinytapeout.com/chips/tt06/tt_um_dsatizabal_opamp
- https://github.com/TechBlueprint-V/Two-stage-Op-amp
- https://github.com/iic-jku/iic-osic-tools
- https://github.com/IHP-GmbH/IHP-Open-PDK
- https://europractice-ic.com/schedules-prices-2026/
