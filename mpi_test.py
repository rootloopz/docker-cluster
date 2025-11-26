from mpi4py import MPI
import platform

comm = MPI.COMM_WORLD
rank = comm.Get_rank()
size = comm.Get_size()
node_name = platform.node()

print(f"Hello from process {rank} out of {size} on node {node_name}")

