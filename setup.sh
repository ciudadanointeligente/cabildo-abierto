#!/bin/bash
echo 'Legislative install script'
echo
echo

echo '... Updating your bundle in development environment ...'
bundle install --without production

echo '... Creating your database ...'
bundle exec rake db:create
bundle exec rake db:migrate

echo '... Creating default admin user ... '
bundle exec rake db:seed

echo '... Database created... '
echo
echo 'To start your server run: rails s'
echo
echo '... FINISH! ...'

