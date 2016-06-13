#!/bin/bash

cd ~/svn
svn checkout svn://svn.code.sf.net/p/daetools/code/trunk daetools-code
cd daetools-code
chmod +x install_dependencies_linux.sh compile_libraries_linux.sh compile_linux.sh
./install_dependencies_linux.sh
./compile_libraries_linux.sh --with-python-version 3.5 boost ref_blas_lapack umfpack idas superlu superlu_mt bonmin nlopt  # compile everything except Trilinos and deal.II
./compile_linux.sh --with-python-version 3.5 dae superlu superlu_mt ipopt bonmin nlopt  # compile everything except Trilinos and deal.II
cd daetools-package/daetools/solibs/Linux_x86_64
rm libboost_python-daetools-py35.so
mv libboost_python-daetools-py35.so.1.52.0 libboost_python3-daetools-py35.so.1.52.0
ln -s libboost_python3-daetools-py35.so.1.52.0 libboost_python3-daetools-py35.so
