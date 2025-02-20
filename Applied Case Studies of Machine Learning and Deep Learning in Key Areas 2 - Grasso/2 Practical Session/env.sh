#!/bin/bash
# Exit immediately if a command exits with a non-zero status.
set -e
conda=PATH/TO/CONDA

$conda init
# Name of the conda environment
ENV_NAME="ACSML"

# Create the conda environment with Python and install packages available on conda.
# Note: Some packages (like rdkit) require specific channels.
$conda create -n "$ENV_NAME" -y -c conda-forge -c rdkit -c defaults python=3.9 \
    jupyter==1.0.0 \
    jupyterlab==3.6.6 \
    matplotlib==3.4.3 \
    numpy==1.25.2 \
    pandas==2.1.1 \
    scipy==1.11.3 \
    scikit-learn==1.3.1 \
    statsmodels==0.14.0 \
    lightgbm==4.1.0 \
    tqdm==4.66.1 \
    shap==0.42.1 \
    dtreeviz==2.2.2 \
    pywavelets==1.5.0 \
    seaborn==0.13.2 \
    rdkit==2023.3.3 \
    biopython==1.81

# Activate the new environment
source "$($conda info --base)/etc/profile.d/conda.sh"
$conda activate "$ENV_NAME"

# Install packages not available (or not reliably available) via conda using pip.
pip install jupyterlab_nvdashboard==0.9.0 peptides==0.3.2 mols2grid DeepPurpose iFeatureOmegaCLI==1.0.2

echo "Environment '$ENV_NAME' has been created and configured."

