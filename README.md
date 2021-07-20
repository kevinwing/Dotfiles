# README

### Create a New Setup
```bash
git init --bare $HOME/.<repo>
alias config='/usr/bin/git --git-dir=$HOME/.<repo>/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.<repo>/ --work-tree=$HOME'" >> $HOME/.zshrc
```
### Local Usage
from here on anywhere the 'git' command is used, use 'config' instead. For example:
```bash
config add <file>
config commit -m <message>
```

### Add Remote Repo(GitHub)
```bash
config remote add origin git@github.com:<username>/<repo>.git
config branch -M master
config config push -u origin master
```

### Clone Existing Repo(from GitHub)
Make sure to add this to your .bashrc or .zshrc, replacing <repo> with the name of the folder:
```bash
alias config='/usr/bin/git --git-dir=$HOME/.<repo>/ --work-tree=$HOME'
```

Now ensure that your source repository ingores the folder where you will clone it too. If you don't do this you may
have some wieird recursion issues.
```bash
echo ".<repo>" >> .gitignore
```
Now clone the Dotfiles repo into a **bare**, *dot*(.) folder under your $HOME directory:
```bash
git clone --bare <repo-url> $HOME/.<repo

Define the alias to the current shell session:
```bash
alias config='/usr/bin/git --git-dir=$HOME/.<repo>/ --work-tree=$HOME'
```

Checkout the content to your $HOME directory:
```bash
config checkout
```

This may (most likely) fail with an error stating you are trying to overwrite some files.
If this happens, do the following:
```bash
mkdir -p .<repo>-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .<repo>-backup/{}
```

Re-run the checkout:
```bash
config checkout
```

If the above still fails, try this:
```bash
git clone --separate-git-dir=$HOME/.<repo> <url-to-repo> $HOME/<repo>-tmp
cp ~/<repo>-tmp/.gitmodules ~  # If you use Git submodules
rm -r ~/<repo>-tmp/
alias config='/usr/bin/git --git-dir=$HOME/.<repo>/ --work-tree=$HOME'
```

Set the flag to prevent showing untracked files:
```bash
config config --local status.showUntrackedFiles no
```

If the above still fails
