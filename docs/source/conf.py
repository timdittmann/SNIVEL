# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'GNSS Velocity Data Center'
copyright = '2024, University of Washington & Earthscope Consortium'
author = 'University of Washington & Earthscope Consortium'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    "sphinx.ext.napoleon",
    "sphinx.ext.autodoc",
    "sphinx.ext.githubpages",
    "sphinx.ext.viewcode",
    "sphinx.ext.coverage",
    "myst_parser",
]

templates_path = ['_templates']
exclude_patterns = []

language = 'Python'

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'furo'
html_static_path = ['_static']
#html_logo = "_static/uw-logo.png"
'''
html_theme_options = {
    'logo_only': True,
    'display_version': False,
}
'''
html_theme_options = {
    "light_logo": "logo-test.png",
    "dark_logo": "logo-test.png",
    #"image": "_static/logo-test.png",
    "source_repository": "https://github.com/timdittmann/SNIVEL",
    "source_branch": "main",
    "source_directory": "docs/",
}



html_title = "GNSS Velocity Data Center"