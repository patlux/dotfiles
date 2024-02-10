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

TODO


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

TODO
