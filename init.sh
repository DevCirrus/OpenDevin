# Download and install Mamba (a faster version of conda) if not available yet.
if ! command -v mamba &> /dev/null; then
        curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
        bash Miniforge3-$(uname)-$(uname -m).sh
fi

# Install Python 3.11, nodejs, and poetry if not available yet.
if ! command -v python3.11 &> /dev/null; then
        mamba install python=3.11
fi

if ! command -v node &> /dev/null; then
        mamba install conda-forge::nodejs
fi

if ! command -v poetry &> /dev/null; then
        mamba install conda-forge::poetry
fi

make build

make setup-config

make run
