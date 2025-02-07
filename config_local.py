import logging
import os

DEBUG=False
LOG_FILE = '/tmp/pgadmin4.log'
SQLITE_PATH = os.environ.get('MESOS_SANDBOX') + '/data/pgadmin4/pgadmin4.db'
SESSION_DB_PATH = os.environ.get('MESOS_SANDBOX') + '/data/pgadmin4/sessions'
STORAGE_DIR = os.environ.get('MESOS_SANDBOX') + '/data/pgadmin4/storage'
CONSOLE_LOG_LEVEL = logging.INFO
FILE_LOG_LEVEL = logging.INFO
