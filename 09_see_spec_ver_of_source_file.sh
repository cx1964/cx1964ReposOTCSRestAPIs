# See git version of 10_train.py of 4 commits ago
git show HEAD~4:./10_train.py

# Show version 80e2348b550fbf92aa82d03b161f6584f23fe609 of 10_train.py
# See github website for version hashes
git show 80e2348b550fbf92aa82d03b161f6584f23fe609:./10_train.py

# Show hashes of git changes
git log --oneline

# git show <hash> shows change info + file which has changed
# git log --oneline gives hash 80e2348
# git show 80e2348 gives filename 10_train.py
# command below gives changes of ./10_train.py for revision with hash 80e2348
git show 80e2348:./10_train.py

# see verisonnhistory of a file with a gui
gitk ./10_train.py