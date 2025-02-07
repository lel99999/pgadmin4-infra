# Set path to postgres (only read when on a login shell) to build psycopg2
source /etc/profile.d/postgres.sh
#/usr/local/bin/virtualenv -p /opt/rh/rh-python36/root/usr/bin/python3 /tmp/env
[ -d /tmp/env ] || scl enable rh-python36 -- virtualenv /tmp/env
source /tmp/env/bin/activate
pip install --upgrade pip
pip install --no-cache-dir -r "$REPO/requirements.txt"
cp -f "$REPO/config_local.py" "/tmp/env/lib/python3.6/site-packages/pgadmin4/"
python "/tmp/env/lib/python3.6/site-packages/pgadmin4/setup.py"
uwsgi --http-socket ":$PORT" \
      --master \
      --processes 1 \
      --chdir "/tmp/env/lib/python3.6/site-packages/pgadmin4" \
      --wsgi-file "pgAdmin4.wsgi" \
      --stats "/tmp/pgadmin4_uwsgi.socket"\
      --home /tmp/env --threads 8 -b 32768
