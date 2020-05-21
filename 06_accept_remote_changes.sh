# filenaam: 06_accept_remote_changes.sh
# functie: accepteren remote changes uit master branch

git checkout master
echo "Druk op q om log af te breken en wijzigingen door te voeren"
git log origin/master

git merge origin/master
