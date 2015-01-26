#! /bin/bash

#####
# nginx setup with provided template
#####
j2 /srv/config/nginx.j2 > /etc/nginx/sites-enabled/default

#####
# Django setup
#####
python /srv/django/${DJANGO_PROJECT_NAME}/manage.py syncdb --noinput
# python /srv/django/${DJANGO_PROJECT_NAME}/manage.py collectstatic --noinput

#####
# Let's go!
#####
supervisord -n