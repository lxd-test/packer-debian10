

# rbenv

On MacOS:
```
brew install rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
rbenv init
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
```

On Linux:
> Note:
> On Graphical environments, when you open a shell, sometimes `~/.bash_profile` doesn't get loaded
> You may need to `source ~/.bash_profile` manually or use `~/.bashrc`

```
apt update
apt install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev
wget -q https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer -O- | bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
rbenv init
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
```

# pre-req

```
rbenv install 2.3.1
rbenv local 2.3.1
rbenv versions
gem install bundler
bundle install
```

# build

```
make
```

# how to test

```
bundle exec kitchen converge
bundle exec kitchen verify
bundle exec kitchen destroy
```

# how to test all automated

```
bundle exec kitchen test
```
