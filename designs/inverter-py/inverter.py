import marimo

__generated_with = "0.23.1"
app = marimo.App(width="medium")


@app.cell
def _():
    from ihp.cells import nmos, pmos
    import ihp
    import gdsfactory as gf

    import marimo as mo

    return gf, ihp, mo, nmos, pmos


@app.cell
def _(ihp):
    ihp.PDK.activate()
    return


@app.cell
def _(gf, ihp):
    c = gf.Component()

    # List all methods/attributes
    methods = [m for m in dir(c) if not m.startswith('_')]
    print("Available methods:")
    for method in sorted(methods):
        print(f"  - {method}")

    c = gf.Component()
    print(type(c.routes))
    print(c.routes)

    print(ihp.cross_sections)
    return


@app.cell
def _(gf, ihp, nmos, pmos, x):
    @gf.cell(cache=False)
    def simple_cell(x=1.0) -> gf.Component:
        c = gf.Component()


        n = c << nmos()
        print("moving n")
        n.rotate(90)
        n.movey(x)

        p = c << pmos()
        print("rotating")
        p.rotate(90)

        c.add_port(name="IN", port=n.ports["G"])
        c.add_port(name="OUT", port=n.ports["D"])

        c.add_port(name="GND", port=n.ports["S"])
        c.add_port(name="VDD", port=p.ports["S"])

        #print(n.ports["G"])
        gf.routing.route_bundle(c, [n.ports["D"]], [p.ports["D"]], cross_section=ihp.tech.metal1_routing,     layer_transitions={
            (
                ihp.LAYER.Metal1pin,
                ihp.LAYER.Metal1drawing,
            ): gf.components.taper_electrical
        })
        #c.add_route(n.ports["G"], p.ports["G"])

        # p.connect("D", n.ports["D"])
        # p.connect("G", n.ports["G"])

        return c

    inverter = simple_cell(x.value)
    inverter.write("inverter.gds")
    inverter.plot(return_fig=True)
    return


@app.cell
def _(mo):
    x = mo.ui.slider(0.5, 6.0)
    x
    return (x,)


@app.cell
def _():
    return


if __name__ == "__main__":
    app.run()
