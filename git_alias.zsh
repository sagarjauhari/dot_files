#################################################
#                 Git Aliases                   #
#################################################

# Git
alias g='git'

# Branch (b)
alias gb='git branch --sort=-committerdate'
## List the last 5 unmerged branches ordered by commit date
alias gbl='git for-each-ref --sort=-committerdate --format="%(refname:short)" refs/heads/ --no-merged develop --count 5 | grep -v "master"'
alias gbla='git branch -v'

# Delete merged branches
alias gbd='git branch --merged | egrep -v "(^\*|master|release)" | xargs git branch -d'

# Commit (c)
alias ,,='git add . && git commit --message "This is it. The Transmuters :rocket: "'
alias gcm='git commit --message'
alias gco='git checkout'
alias gcod='git checkout develop'
alias gcom='git checkout master'
alias gcf='git commit --amend --reuse-message HEAD'
alias gcp='git cherry-pick --ff'
alias gcP='git cherry-pick --no-commit'


# Fetch (f)
alias gfm='git pull'

# Log (l)
alias gl='git --no-pager log --pretty=format:"%Cred%h%Creset %Cblue%an%Creset %Cgreen%ar%Creset: %s %Cred%d%Creset" --graph -10'
alias gla='git log --oneline --pretty=format:"%Cred%h%Creset %C(bold blue)%an%Creset %Cgreen%ar%Creset: %s" --graph'


# Push (p)
alias gp='git push'
alias gpf='git push --force'


# Rebase (r)
alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gri='git rebase --interactive'
# Rebase current branch over Develop
alias grd='git rebase develop'
alias grud='git checkout develop; git pull; git checkout -; git rebase develop'
# Rebase current branch over Master
alias grm='git rebase master'
alias grum='git checkout master; git pull; git checkout -; git rebase master'


# Stash (s)
alias gs='git stash'
alias gsp='git stash pop'


# Index (i)
alias ga='git add .'
alias gid='git diff --no-ext-diff --cached'
alias gir='git reset'


# Working Copy (w)
# alias gws='git status --ignore-submodules=${_git_status_ignore_submodules} --short'
alias gws='git status --short'
alias gwS='git status --ignore-submodules=${_git_status_ignore_submodules}'
alias gwd='git diff --no-ext-diff'
alias gwr='git reset --soft'
alias gwR='git reset --hard'
