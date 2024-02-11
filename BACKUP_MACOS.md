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
# TODO: "-r 1" required?
duplicacy restore -r 1 "*"
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
duplicacy init home smb://patwoz@syno.camel-yo.ts.net/Root/Backups/home
duplicacy backup -t first -stats -threads 10
```

**Restore**

```sh
cd ~/
# TODO: "-r 1" required?
duplicacy restore -r 1 "*"
```

## Debug

**Validate include/exclude filters**

```sh
cd ~/dev
duplicacy -d -log backup -enum-only > log.txt

# PATTERN_INCLUDE means the folder/file will be included
# PATTERN_EXCLUDE the opposite

```
