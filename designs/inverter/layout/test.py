import klayout.db as db

# tech = db.Technology.technology_by_name("sg13g2")
# db.load_technology(tech)

layout = db.Layout()
layout.technology_name = "sg13g2"

lib = db.Library.library_by_name("SG13_dev")

print([l for l in db.Library.library_names()])
