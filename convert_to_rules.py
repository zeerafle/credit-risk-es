import marimo

__generated_with = "0.17.6"
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
    df
    return


@app.cell
def _(df):
    df.describe()
    return


@app.cell
def _(df):
    from prism_rules import PrismRules

    prism = PrismRules()
    _ = prism.get_prism_rules(df, 'risk_level')
    return (prism,)


@app.cell
def _(prism):
    prism.bin_ranges
    return


@app.cell
def _(prism):
    import pickle

    with open("infant_wellness_es/rules/prism_object.pkl", 'wb') as f:
        pickle.dump(prism, f)
    return


@app.cell
def _(mo):
    mo.md(r"""
    # Parse to CLP File
    """)
    return


app._unparsable_cell(
    r"""
    _df = mo.sql(
        f\"\"\"
        import re

        def parse_rules_to_clips(input_file, output_file):
            \\"\"\"
            Parse rules from rules.txt and convert them to CLIPS syntax.
            \\"\"\"
            with open(input_file, 'r') as f:
                content = f.read()

            # Split by target sections
            sections = re.split(r'\.{70,}\nTarget: (At Risk|Healthy)\n\.{70,}', content)

            clips_rules = []
            rule_counter = {}

            for i in range(1, len(sections), 2):
                target = sections[i]
                rules_text = sections[i + 1]

                # Split individual rules
                rule_blocks = re.split(r'\n(?=[a-z_]+ = )', rules_text.strip())

                for rule_block in rule_blocks:
                    if not rule_block.strip():
                        continue

                    # Extract conditions from the first line
                    lines = rule_block.strip().split('\n')
                    conditions_line = lines[0]

                    # Parse conditions
                    conditions = [c.strip() for c in conditions_line.split(' AND ')]

                    # Generate rule name
                    target_prefix = target.lower().replace(' ', '_')
                    if target_prefix not in rule_counter:
                        rule_counter[target_prefix] = 0
                    rule_counter[target_prefix] += 1

                    # Create condition parts for rule name
                    condition_parts = []
                    for condition in conditions:
                        match = re.match(r'(\w+)\s*=\s*(.+)', condition)
                        if match:
                            attr = match.group(1)
                            value = match.group(2).lower().replace(' ', '_')
                            condition_parts.append(f\"{attr}_{value}\")

                    rule_name = f\"{target_prefix}_{'_'.join(condition_parts)}\"

                    # Build CLIPS rule
                    clips_rule = f\"(defrule {rule_name}\n\"
                    clips_rule += f\"  ?c <- (case (id ?id)\n\"

                    for condition in conditions:
                        match = re.match(r'(\w+)\s*=\s*(.+)', condition)
                        if match:
                            attr = match.group(1)
                            value = match.group(2)
                            clips_rule += f\"              ({attr} {value})\n\"

                    clips_rule = clips_rule.rstrip('\n') + \")\n\"
                    clips_rule += f\"  =>\n\"
                    clips_rule += f\"  (assert (conclusion (id ?c:id)\n\"
                    clips_rule += f\"                      (target {target})\n\"
                    clips_rule += f\"                      (rule {rule_name}) ))\n\"
                    clips_rule += \")\n\"

                    clips_rules.append(clips_rule)

            # Write to output file
            with open(output_file, 'w') as f:
                f.write(\"; Auto-generated CLIPS rules\n\n\")
                for rule in clips_rules:
                    f.write(rule + \"\n\")

            print(f\"Generated {len(clips_rules)} rules and saved to {output_file}\")

        parse_rules_to_clips(\"rules/rules.txt\", \"rules/generated_rules.CLP\")
        \"\"\"
    )
    """,
    name="_"
)


@app.cell
def _(mo):
    _df = mo.sql(
        f"""

        """
    )
    return


if __name__ == "__main__":
    app.run()
