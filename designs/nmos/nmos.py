# /// script
# requires-python = ">=3.13"
# dependencies = [
#     "marimo>=0.23.1",
# ]
# ///

import marimo

__generated_with = "0.23.1"
app = marimo.App(width="medium")


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    # NMOS model

    With this notebook, you can simulate the basic behavior of an nmos.
    """)
    return


@app.cell
def _():
    import marimo as mo

    return (mo,)


@app.cell
def _():
    from ihp.cells import nmos
    from ihp import PDK

    PDK.activate()
    return (nmos,)


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    Use the sliders bellow to change the geometry of the nmos gate.
    """)
    return


@app.cell
def _(mo):
    w_slider = mo.ui.slider(start=0.15, stop=10.0, label="Width", value=0.15, step=0.1)
    l_slider = mo.ui.slider(start=0.1, stop=2.0, label="Length", value=0.13, step=0.1)

    mo.hstack([w_slider, l_slider])
    return l_slider, w_slider


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## Parametric nmos cell
    """)
    return


@app.cell
def _(l_slider, nmos, w_slider):
    n = nmos(width=w_slider.value, length=l_slider.value)
    n.plot(return_fig=True)
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    For the simulation, we admit that the substrate as well as the source are connected to the ground.
    The output of the simulation is the current between the drain and the source as the voltage of the drain and the gate variates.
    """)
    return


@app.cell
def _(mo):
    v_drain = mo.ui.slider(start=0.0, stop=1.8, label="VDrain", step=0.1)
    v_gate = mo.ui.slider(start=0.0, stop=1.8, label="VGate", step=0.1)
    mo.hstack([v_drain, v_gate])
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    TODO model
    """)
    return


@app.cell
def _():
    return


if __name__ == "__main__":
    app.run()
