2.Demonstration of deadlock using point to point communication

#include <mpi.h>
#include <stdio.h>
int main(int argc, char *argv[]) {
MPI_Init(&argc, &argv);
int world_rank;
MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);
int number;
if (world_rank == 0) {
number = 0;
MPI_Ssend(&number, 1, MPI_INT, 1, 0, MPI_COMM_WORLD);
MPI_Recv(&number, 1, MPI_INT, 1, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
} else if (world_rank == 1) {
number = 1;
MPI_Ssend(&number, 1, MPI_INT, 0, 0, MPI_COMM_WORLD);
MPI_Recv(&number, 1, MPI_INT, 0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
}
MPI_Finalize();
return 0;
}
/*
mpicc 2.c -o 2
mpirun -n 2 2
This will create a deadlock situation.Hence, the process can not send and receive and
therefore, we don’t see any output */
