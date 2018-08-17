# Short Links

This application is a url shortener. It makes a few naive assumptions about how to shorten urls, and specifically what a valid URI is.

Regardless, it works, and is Not Too Shabby (TM)

## How to set it up

1. install postgres
  This might mean download an installer, run homebrew, apt-get, dnf, or some other package manager, or just set up the service
2. `git clone` this repo
3. `gem install bundler`
4. `bundle`
5. run `rake db:setup`
6. Confirm everything is working by running the tests: `rspec`
