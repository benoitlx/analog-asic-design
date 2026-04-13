import marimo

__generated_with = "0.23.1"
app = marimo.App(width="medium")


@app.cell
def _():
    import marimo as mo
    from ihp.cells import nmos
    from ihp import PDK

    PDK.activate()
    return mo, nmos


@app.cell
def _(mo):
    w_slider = mo.ui.slider(start=0.15, stop=10.0, label="Width", value=0.15, step=0.1)
    l_slider = mo.ui.slider(start=0.1, stop=2.0, label="Length", value=0.13, step=0.1)
    v_drain = mo.ui.slider(start=0.0, stop=1.8, label="VDrain", step=0.1)
    v_gate = mo.ui.slider(start=0.0, stop=1.8, label="VGate", step=0.1)
    mo.hstack([w_slider, l_slider, v_drain, v_gate])
    return l_slider, w_slider


@app.cell
def _(l_slider, nmos, w_slider):
    n = nmos(width=w_slider.value, length=l_slider.value)
    n.plot(return_fig=True)
    return


@app.cell
def _():
    return


if __name__ == "__main__":
    app.run()
