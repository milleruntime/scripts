echo "git remote prune origin"
git remote prune origin

echo "git remote prune upstream"
git remote prune upstream
CMD=`git branch -vv | grep gone | awk '{print $1}'`
read -p "Delete these branches: $CMD? " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi
git branch -vv | grep gone | awk '{print $1}' | xargs git branch -D
