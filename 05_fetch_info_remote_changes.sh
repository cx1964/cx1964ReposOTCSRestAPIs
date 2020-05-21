# filenaam: 05_fetch_info_remote_changes.sh

# haal de wijzigingen op tov remote repos en deze local repos
echo "Do 'git fetch origin'"
git fetch origin

# toon de verschillen tussen remote en local repos
echo "Do 'git log --oneline master..origin/master'"
echo "De verschillen tussen remote en local zijn:"
git log --oneline master..origin/master

echo "To accept remote change"
echo "run 06_accept_remote_changes.sh"
