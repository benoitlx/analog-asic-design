import klayout.db as db

# ---------------------------
# Setup
# ---------------------------
layout = db.Layout()
layout.dbu = 0.001

top = layout.create_cell("INV")

# Load library
lib = db.Library.library_by_name("SG13_dev")
if lib is None:
    raise RuntimeError("SG13G2 library not loaded")

# Layers (REPLACE with real SG13G2 mapping!)
L_MET1 = layout.layer(68, 20)
L_VIA1 = layout.layer(67, 44)
L_POLY = layout.layer(30, 0)

# ---------------------------
# Helper: place device
# ---------------------------
def place_device(name, params, x, y):
    cell = layout.create_cell(name, lib, params)
    trans = db.Trans(x, y)
    inst = db.CellInstArray(cell.cell_index(), trans)
    top.insert(inst)
    return inst

# ---------------------------
# Devices
# ---------------------------
nmos = place_device("nmos", {"w":1.0, "l":0.13, "nf":2}, 0, 0)
pmos = place_device("pmos", {"w":2.0, "l":0.13, "nf":2}, 0, 6000)

# ---------------------------
# Simple routing helpers
# ---------------------------
def metal_rect(x1, y1, x2, y2):
    top.shapes(L_MET1).insert(db.Box(x1, y1, x2, y2))

def via(x, y):
    top.shapes(L_VIA1).insert(db.Box(x-100, y-100, x+100, y+100))

# ---------------------------
# Coordinates (approximate!)
# In real case: extract from PCell pins
# ---------------------------

# NMOS
n_gate = (1000, 1000)
n_drain = (2000, 2000)
n_source = (0, 0)

# PMOS
p_gate = (1000, 7000)
p_drain = (2000, 6000)
p_source = (0, 8000)

# ---------------------------
# Connections
# ---------------------------

# INPUT (connect both gates)
metal_rect(800, 1000, 1200, 7000)

# OUTPUT (connect drains)
metal_rect(2000, 2000, 2000, 6000)

# VDD rail
metal_rect(-1000, 8000, 3000, 8300)

# GND rail
metal_rect(-1000, -500, 3000, -200)

# Connect PMOS source to VDD
metal_rect(0, 8000, 0, 8200)

# Connect NMOS source to GND
metal_rect(0, 0, 0, -200)

# Add vias at key junctions
via(1000, 1000)
via(1000, 7000)
via(2000, 2000)
via(2000, 6000)

# ---------------------------
# Save
# ---------------------------
layout.write("klayout_inv.gds")
