# isucon8

## ssh config

ssh_configの中身を `~/.ssh/config` に書く。
ip addrとuserをうまいこと合わせよう。

## itamae

### add deploy key

```
if ! [ -e itamae/cookbooks/app/files/tmp/deploy.key ]; then
  ssh-keygen -t ecdsa -b 521 -C isucon8-deploy -f itamae/cookbooks/app/files/tmp/deploy.key
fi
cat itamae/cookbooks/app/files/tmp/deploy.key.pub
```

go https://github.com/nna774/isucon8-preliminary/settings/keys and add deploy key

### apply

```sh
cd itamae/

SUDO_PASSWORD= bundle exec hocho apply isucon1 --dry-run
SUDO_PASSWORD= bundle exec hocho apply isucon1
```
