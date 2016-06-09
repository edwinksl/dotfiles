#!/bin/bash

svn checkout svn://svn.code.sf.net/p/daetools/code/trunk daetools-code
virtualenv venv -p python3  # create virtualenv for Python 3
source venv/bin/activate  # activate virtualenv
pip install -U pip
pip install numpy scipy matplotlib
cd daetools-code
chmod +x install_dependencies_linux.sh compile_libraries_linux.sh compile_linux.sh
./install_dependencies_linux.sh
./compile_libraries_linux.sh --with-python-version 3.5 boost ref_blas_lapack umfpack idas superlu superlu_mt bonmin nlopt  # compile everything except Trilinos and deal.II
./compile_linux.sh --with-python-version 3.5 dae superlu superlu_mt ipopt bonmin nlopt  # compile everything except Trilinos and deal.II
cd daetools-package
python setup.py install
