# packer-debian10#

## thanks

based on the repo of geerlingguy

https://github.com/geerlingguy/packer-boxes/tree/master/debian10

## build

```shell
packer build template.json
```

## test

### pre-req

- rbenv
- ruby >=2.4

```shell
rbenv install -l
rbenv install 2.6.6
rbenv local 2.6.6
```

### kitchen-test

```shell
bundle install --path vendor/bundle
```

### test

```shell
bundle exec kitchen list
bundle exec kitchen converge
bundle exec kitchen verify
bundle exec kitchen destroy
```

all in one 

```shell
bundle exec kitchen test
```

## publish box

```shell
vagrant cloud auth login
vagrant cloud box create lxd-test/debian10
vagrant cloud publish --box-version `date +%y.%m.%d` \
  --force --no-private --release lxd-test/debian10   \
  `date +%y.%m.%d` virtualbox builds/virtualbox-debian10.box
```

