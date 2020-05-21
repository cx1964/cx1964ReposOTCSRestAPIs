# File: install_python_env.sh
# Functie: installatie tbv opzetten van een python3 omgeving
# opmerking: Uitgangspunt python3 software is al geinstalleerd onder Windows10/Linux

# maak virtuele python environment voor python libraries
# Uitvoeren in linux shell of in mingw64 shell op een Windows machine
python3 -m venv env_python3_otcsRestAPIs

# Activeren virtuele env tbv Windows machine met mingw64
source /c/tmp/cx1964ReposOTCSRestAPIs/env_python3_graphics/Scripts/activate
# Activeren virtuele env tbv Linux shell 
source ./env_python3_otcsRestAPIs/bin/activate
