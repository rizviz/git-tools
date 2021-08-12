#!/bin/bash
# Pre-Reqs : Added
# Automate creation of a new git repo using github API tokens
# Date: 02-08-2020
# Ver : 0.4
# Auth: Zee Rizvi @ irsols

if [ -z "$1" ]
     then
       echo
       echo " No gitrepo name provided to be created, check syntax"
       echo " Usage : newgitrepo.sh <repo-name> "
       exit
   fi

reponame=$1
export GITHUB_API_TOKEN=<Your GitHub API Toekn>
export GITHUB_USERNAME=<Your Github userid>
function new-git() {
  curl -X POST https://api.github.com/user/repos -u $GITHUB_USERNAME:$GITHUB_API_TOKEN -d '{"name":"'$1'"}'
}
# create repo through API token defined in .zshrc
new-git $reponame
if [ ! -d $PWD/$reponame ]; then
    mkdir -p $PWD/$reponame;
fi
cd $reponame
echo "# Readme for $reponame repo" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/$GITHUB_USERNAME/$reponame.git
git push -u origin main
