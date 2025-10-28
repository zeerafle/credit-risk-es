import marimo

__generated_with = "0.17.2"
app = marimo.App(width="medium")


@app.cell
def _():
    import kagglehub

    # Download latest version
    path = kagglehub.dataset_download("mubeenshehzadi/infant-wellness-and-risk-evaluation-dataset")

    print("Path to dataset files:", path)
    return (path,)


@app.cell
def _(path):
    import os

    DATA_PATH = os.path.join(path, os.listdir(path)[0])
    return (DATA_PATH,)


@app.cell
def _():
    import pandas as pd
    return (pd,)


@app.cell
def _(DATA_PATH, pd):
    df = pd.read_csv(DATA_PATH)
    df.head()
    return (df,)


@app.cell
def _(df):
    df.drop(columns=['baby_id', 'name', 'date', 'apgar_score'], inplace=True)
    return


@app.cell
def _(df):
    from prism_rules import PrismRules

    prism = PrismRules()
    _ = prism.get_prism_rules(df, 'risk_level')
    return


if __name__ == "__main__":
    app.run()
