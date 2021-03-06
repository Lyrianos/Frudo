#!/bin/bash

rm db.sqlite3
rm -rf dcp/migrations
rm -rf dcp/__pycache__
python3 manage.py makemigrations
python3 manage.py migrate
echo "from django.contrib.auth.models import User; User.objects.create_superuser('${ADMIN_NAME:-admin}', '${ADMIN_MAIL:-admin@dcp.org}', '${ADMIN_PASSWORD:-hunter2}')" | python3 manage.py shell
