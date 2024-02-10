# Backup macOS

## `~/dev`

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

**Backup**

```sh
cd ~/
duplicacy init home smb://patwoz@syno.camel-yo.ts.net/Root/Backups/home
duplicacy backup -t first -stats -threads 10
```

**Restore**

TODO
