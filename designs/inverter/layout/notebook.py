import marimo

__generated_with = "0.22.0"
app = marimo.App(width="medium")


@app.cell
def _():
    import klayout.db as db

    return (db,)


@app.cell
def _(db):
    layout = db.Layout()
    layout.technology_name = "sg13g2"
    return


@app.cell
def _(db):
    lib = db.Library.library_by_name("SG13G2")
    return


@app.cell
def _(db):
    print([l for l in db.Library.library_names()])
    return


@app.cell
def _():
    return


if __name__ == "__main__":
    app.run()
