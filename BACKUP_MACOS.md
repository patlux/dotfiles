# Backup macOS

Splitted into several backups, because some parts take longer than others.

## `~/dev`

Filters to include/exclude files/folders are in `~/dev/.duplicacy/filters`

**Backup**

```sh
cd ~/dev
duplicacy init dev smb://patwoz@syno.camel-yo.ts.net/Root/Backups/dev
duplicacy backup -t first -stats -threads 10
```

**Restore**

```sh
cd ~/dev
# get latest revision
duplicacy list
# check whats missing
duplicacy diff

# get everything
duplicacy restore -r <revision> ""

# get only Personal folder
duplicacy restore -r <revision> "Personal/*"

# or other
duplicacy restore -r <revision> "piparo.tech/*"
```

## Miscellaneous

Important files

```
~/.zshrc_secret
```

Filters to include/exclude files/folders are in `~/.duplicacy/filters`

**Backup**

```sh
cd ~/
duplicacy init -e home smb://patwoz@syno.camel-yo.ts.net/Root/Backups/home
# enter encryption password
duplicacy backup -t first -stats -threads 10
```

**Restore**

```sh
cd ~/
# get latest revision
duplicacy list
# check whats missing
duplicacy diff

# get everything
duplicacy restore -r <revision> ""

# get only .ssh/
duplicacy restore -r <revision> ".ssh/*"
```

## Debug

**Validate include/exclude filters**

```sh
cd ~/dev
# or
cd ~/

duplicacy -d -log backup -enum-only > log.txt

# PATTERN_INCLUDE means the folder/file will be included
# PATTERN_EXCLUDE the opposite

```
