# chezmoi

## Import on a new computer

```sh
brew install chezmoi
chezmoi cd
git init
git remote add origin https://github.com/sunesimonsen/chezmoi.git
git checkout main 
git pull
```

# Backup

Before you apply the changes, run chezmoi diff to see if it will override anything. Create backups of those files.

Alternatively you can run chezmoi apply and you will be prompted.

# Apply changes from Github

```sh
chezmoi update
```

# Synchronize changes back to Github

```sh
chezmoi re-add
chezmoi cd
git add .
git ci -m "message"
git push
```
