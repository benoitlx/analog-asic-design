import marimo

__generated_with = "0.23.1"
app = marimo.App(width="medium")


@app.cell
def _():
    import marimo as mo

    import gdsfactory as gf
    import ihp
    from ihp import PDK
    from ihp.cells import nmos, pmos
    from functools import partial

    gf.CONF
    gf.CONF.port_types = ['electrical']
    return PDK, gf, ihp, nmos, pmos


@app.cell
def _(PDK):
    PDK.activate()
    #LAYERS_VIEW = PDK.get_layer_views()
    #layers = LAYERS_VIEW.preview_layerset()
    #layers.plot(return_fig=True)

    layer_transitions = {  
        # ... existing transitions ...  
        ("Metal1pin", "TopMetal2drawing"): "via_stack_m1_m2",  # Your via component  
        ("TopMetal2drawing", "Metal1pin"): "via_stack_m2_m1",  # Reverse direction  
    }
    return


@app.cell
def _(nmos):
    c_bot = nmos(width=1.0, length=0.13)
    c_bot.plot(return_fig=True)
    return (c_bot,)


@app.cell
def _(pmos):
    c_top = pmos(width=1.0, length=0.13)
    c_top.plot(return_fig=True, show_labels=True)
    return (c_top,)


@app.cell
def _(gf):
    gf.get_active_pdk().routing_strategies
    return


@app.cell(disabled=True)
def _(gf):
    @gf.schematic_cell
    def schematic(x: float = 0.0, y: float = 10.0) -> gf.Schematic:
        """Returns a schematic of an inverter"""
        s = gf.Schematic()

        nmos = s.create_inst(name="nmos", component="nmos")
        nmos.place(x=0, y=0, orientation=0.0)

        pmos = s.create_inst(name="pmos", component="pmos")
        pmos.place(x=x, y=y, orientation=10.0)

        s.add_route(name="drain-drain", start_ports=[nmos.ports["D"]], end_ports=[pmos.ports["D"]], layer=(8, 2), route_width=0.01, routing_strategy="route_bundle", cross_section=None)

        s.flatten()

        return s

    inverter_schematic = schematic()
    #inverter_schematic.plot(return_fig=True, display_type="widget")

    #gv = gf.c.mzi()
    inverter_schematic.plot_netlist_graphviz()
    return


@app.cell
def _(c_bot, c_top, gf):
    c = gf.Component()
    print(c_top.ports["D"])
    print(c_bot.ports["D"])
    return


@app.cell
def _(gf, ihp, nmos, pmos):
    @gf.cell
    def inverter() -> gf.Component:
        c = gf.Component()
        c_top = c.add_ref(pmos(width=1.0, length=0.15))
        c_bot = c.add_ref(nmos(width=1.0, length=0.15))
        c_bot.move((10.0, 10.0))

        #input_port = c.add_port(name="in", port=c_bot.ports["G"])
        #c_top.ports["G"].connect(c_bot.ports["G"])
        #routes = ihp.routing_strategies["route_bundle_metal_corner"](c, ports1=[c_top.ports["D"]], ports2=[c_bot.ports["D"]], cross_section="metal_routing")

        #gf.routing.route_bundle_electrical(c, [c_top.ports["D"]], [c_bot.ports["D"]], layer=(8, 2), route_width=1.0)
        ihp.tech.metal1_routing(c, width=2.0, layer=(8, 2), port_names=("D", "D"))

        return c


    inv = inverter()
    inv.plot()
    return


@app.cell
def _():
    return


if __name__ == "__main__":
    app.run()
