#!/usr/bin/env python

import os
import sys
from builtins import FileExistsError

try:
    venv = os.environ['VIRTUAL_ENV']
except KeyError:
    print('Virtual environment is not detected.')
    raise

python_venv_version = sys.version_info[:2]
site_version = str(python_venv_version[0]) + '.' + str(python_venv_version[1])
if python_venv_version in [(3, 5), (3, 6)]:
    dist_version = '3'
    sip = 'sip.cpython-35m-x86_64-linux-gnu.so'
elif python_venv_version in [(2, 7)]:
    dist_version = '2.7'
    sip = 'sip.x86_64-linux-gnu.so'
else:
    error_message = ' '.join(['Python', site_version, 'is not supported.'])
    sys.exit(error_message)

usr_lib = '/usr/lib'
site_packages_dir = os.path.join(venv, 'lib', 'python'+site_version, 'site-packages')
dist_packages_dir = os.path.join(usr_lib, 'python'+dist_version, 'dist-packages')

pyqt4 = 'PyQt4'
pyqt4_site = os.path.join(site_packages_dir, pyqt4)
sip_site = os.path.join(site_packages_dir, sip)
pyqt4_dist = os.path.join(dist_packages_dir, pyqt4)
sip_dist = os.path.join(dist_packages_dir, sip)

args = [[pyqt4_dist, pyqt4_site], [sip_dist, sip_site]]
for arg in args:
    try:
        os.symlink(*arg)
    except FileExistsError:
        continue
