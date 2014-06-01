#!/usr/bin/python
import os, sys

os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'
sys.path.append(os.environ['OPENSHIFT_REPO_DIR'])

virtenv = os.environ['OPENSHIFT_PYTHON_DIR'] + '/virtenv/'
virtualenv = os.path.join(virtenv, 'bin/activate_this.py')
try:execfile(virtualenv, dict(__file__=virtualenv))
except IOError:pass

from django.core.handlers import wsgi
application = wsgi.WSGIHandler()