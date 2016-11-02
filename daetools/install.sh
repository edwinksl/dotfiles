#!/bin/bash

cd ~/svn
svn checkout svn://svn.code.sf.net/p/daetools/code/trunk daetools-code
cd daetools-code
# chmod +x install_dependencies_linux.sh compile_libraries_linux.sh compile_linux.sh
chmod +x compile_libraries_linux.sh compile_linux.sh
# ./install_dependencies_linux.sh
# ./compile_libraries_linux.sh --with-python-version 3.5 boost ref_blas_lapack umfpack idas superlu superlu_mt bonmin nlopt  # compile everything except Trilinos and deal.II
# ./compile_linux.sh --with-python-version 3.5 dae superlu superlu_mt ipopt bonmin nlopt  # compile everything except Trilinos and deal.II
# ./compile_libraries_linux.sh --with-python-version 3.5 boost ref_blas_lapack umfpack idas superlu superlu_mt bonmin nlopt trilinos  # compile everything except deal.II
# ./compile_linux.sh --with-python-version 3.5 dae superlu superlu_mt trilinos ipopt bonmin nlopt  # compile everything except deal.II
./compile_libraries_linux.sh --with-python-version 3.5 boost ref_blas_lapack umfpack idas superlu superlu_mt bonmin nlopt deal.ii  # compile everything except trilinos
./compile_linux.sh --with-python-version 3.5 dae superlu superlu_mt ipopt bonmin nlopt deal.ii  # compile everything except trilinos
# ./compile_libraries_linux.sh --with-python-version 3.5 boost ref_blas_lapack umfpack idas superlu superlu_mt bonmin nlopt trilinos deal.ii  # compile everything
# ./compile_linux.sh --with-python-version 3.5 dae superlu superlu_mt trilinos ipopt bonmin nlopt deal.ii  # compile everything
