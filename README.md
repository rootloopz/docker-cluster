Steps to run:

- Have docker & docker compose
- Run the following commads in the cloned directory:

Build the container
```
docker compose build
```
Spin up the cluster (and send to background with -d)
```
docker compose up -d
```
Now the containers are running we can exec into node1 and run a test:
```
docker exec -it mpi-node1 /bin/bash
```

