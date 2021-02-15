# packer-debian10#

## thanks

based on the repo of geerlingguy

https://github.com/geerlingguy/packer-boxes/tree/master/debian10

## build

```
packer build template.json
```

## test

### pre-req

- rbenv
- ruby >=2.4

```
rbenv install -l
rbenv install 2.6.6
rbenv local 2.6.6
```

### kitchen-test

```
bundle install --path vendor/bundle
```

### test

```
bundle exec kitchen list
bundle exec kitchen converge
bundle exec kitchen verify
bundle exec kitchen destroy
```

all in one 

```
bundle exec kitchen test
```

## publish box

### login

If you have 2FA enabled, then generate a [token](https://app.vagrantup.com/settings/security) in app.vagrantup.com and use `ATLAS_TOKEN` environment variable.

If you don't have 2FA enabled, you can generate a token directly from `vagrant` cli:

```shell
vagrant cloud auth login
```

### upload the box

On this example

```
vagrant cloud box create lxd-test/debian10
vagrant cloud publish --box-version `date +%y.%m.%d` \
  --force --no-private --release lxd-test/debian10   \
  `date +%y.%m.%d` virtualbox build/virtualbox-debian10.box
```

For your own org

```
vagrant cloud box create <org>/<box>
vagrant cloud publish --box-version <version> \
  --force --no-private --release <org>/<box>   \
  <version>  virtualbox <file.box>
```

