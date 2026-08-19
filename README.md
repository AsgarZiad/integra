# Numerical Integration Calculator

A lightweight Flask application for an academic Numerical Methods course. It implements:

1. Trapezoidal Rule
2. Simpson's 1/3 Rule

The app includes step-by-step derivations, discretization tables, live formula formatting, and function graphs.

## Features

- Pure-Python numerical integration without NumPy, SciPy, SymPy, or mpmath.
- A restricted mathematical-expression evaluator supporting common functions and constants.
- Trapezoidal and Simpson's 1/3 rule calculations with input validation.
- Detailed coefficients, weighted values, intermediate steps, and final estimates.
- Backend-generated SVG graphs with no image or plotting dependency.
- A responsive interface with light and dark themes.
- An editable two-person About section for student project information.

## Supported Expressions

Expressions can use `x`, arithmetic operators, `sin`, `cos`, `tan`, `exp`, `log`, `sqrt`, `abs`, `pi`, and `e`. The evaluator also accepts common forms such as `x^2`, `3x`, and selected LaTeX-style input.

## Folder Structure

```text
numerical-integration-calculator/
|-- app.py
|-- integration.py
|-- templates/
|   `-- index.html
|-- static/
|   |-- style.css
|   `-- script.js
|-- requirements.txt
|-- vercel.json
`-- README.md
```

## Adding Team Information

The five team profiles are in the section with `id="about"` inside `templates/index.html`. Their local portraits are stored in `static/team/`.

## Run Locally

Requirements:

- Python 3.14+
- Flask

Install and run:

```bash
pip install -r requirements.txt
python app.py
```

Then open `http://localhost:3000`.
