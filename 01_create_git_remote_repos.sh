#!/bin/bash
# Filenaam: 01_create_git_remote_repos.sh
# Functie: create centrale remote git repository van de commandline
# Opmerking: nieuwe style mbv GitHub API Token 
# Referentie: https://medium.com/better-programming/create-github-repos-remotely-25153a6e6890

## Instelling github Repository naam ##
NEW_REPO_NAME='cx1964ReposOTCSRestAPIs' # <<<<<<-------------------------------------------------------------



#
#
#
###########################################
### BEGIN constante deel van het script ###
###########################################
# GitHub User Name

# Store current working directory.
CURRENT_DIR=$PWD
# Project directory can be passed as second argument to setup-repo, or will default to current working directory.
PROJECT_DIR=${2:-$CURRENT_DIR}

# Maak de github repos aan
curl -u $GH_USER https://api.github.com/user/repos -d '{"name":"'$NEW_REPO_NAME'"}'

# ### 00 Eenmalig voor iedere nieuwe Github repository deployment key aanmaken ###  <<<<<<----------------------------------
# --------------------------------------------------------------------------------- 
# Om access tokens te kunnen gebruiken (zie hieronder bij "01 Instelling en aanmaken access token")
# moet men eerst eenmalig de deploy keys aanmaken
# zie procedure https://developer.github.com/v3/guides/managing-deploy-keys/#deploy-keys

# stap1: Run het command ssh-keygen op je werkstation
#        mbv het script 00_maak_pub_en_priv_keys.shgit -C $PROJECT_DIR remote add origin git@github.com:$GH_USER/$NEW_REPO_NAME.git
#        Geef als waarde mee de naam van de git repository (cx1964ReposOTCSRestAPIs)
#        Default wordt er onder Linux er 2 files aangemaakt in de current directory
#        - cx1964ReposOTCSRestAPIs
#        - cx1964ReposOTCSRestAPIs.pub
#
# Volg vanaf stap2a de overige 8 stappen van de Setup paragraaf van https://developer.github.com/v3/guides/managing-deploy-keys/#deploy-keys  

# Stap5
# zie https://github.com/cx1964/<respository naam>/settings/keys
# Dit wordt nu: https://github.com/cx1964/cx1964ReposOTCSRestAPIs/settings
#  5a: Kies uit option menu voor Deploy keys
#  5b: Kies <add deploy key>

# Stap6
# 6a: Gebruik de volledige inhoud van de file (uit stap1) cx1964ReposOTCSRestAPIs.pub
#     bij het aanmaken van een deployment key van een specifieke respository
# 6b: zet optie Allow write access aan
# 6c: Druk op <add key>
# 6d: verwijder of verplaats de files van stap1 uit current directory
#        - cx1964ReposOTCSRestAPIs
#        - cx1964ReposOTCSRestAPIs.pub

# Vervolgens moet voor iedere nieuwe repository stap2 t/m stap8 van het aanmaken van deploy keys doorlopen.
#

# Deployment key
GH_Deployment_key='7a:ea:6b:70:a3:f7:58:50:e3:24:18:5b:6d:73:f0:40' # <<<<<<-------------------------------------------------------------------------------

# Maak een local git repository aan
git init $PROJECT_DIR

# Markeer welke wijzigingen meegenomen moeten worden
git add *.sh
git add *.py
git add README.md
git add .gitignore

# Commit de local wijzigingen
git commit -m "Initiele files"

# koppel local aan remote repository
git -C $PROJECT_DIR remote add origin https://github.com/$GH_USER/$NEW_REPO_NAME.git

# Schrijf de wijzigingen weg naar de remote repository
git push -u origin master
