import marimo

__generated_with = "0.23.1"
app = marimo.App(width="medium")


@app.cell
def _():
    import marimo as mo

    return


@app.cell
def _():
    print("ceci est un test")
    return


if __name__ == "__main__":
    app.run()
