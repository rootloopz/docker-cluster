#!/bin/bash

mpirun --allow-run-as-root \
  -np 3 \
  -host mpi-node1,mpi-node2,mpi-node3 \
  --mca btl tcp,self \
  --mca btl_tcp_if_include eth0 \
  python $1
