# activate python env
# Tbv Windows machine met mingw64
source /c/tmp/cx1964ReposOTCSRestAPIs/env_python3_otcsRestAPIs/Scripts/activate

# Linux 
source ./env_python3_otcsRestAPIs/bin/activate


# upgrade pip uitvoeren in Linux shell of Windows machine met mingw64
python -m pip install --upgrade pip

# install benodigde python libraries
# uitvoeren in Linux shell of Windows machine met mingw64
pip install requests
pip install json
pip install yaml


# toon geinstalleerde python libraries
pip list

# remove a package
# pip uninstall pyside