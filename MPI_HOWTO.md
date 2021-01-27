## To launch a docker container with GPUs 0, 4, 5
```
sh mpi_launch_docker.sh 0,4,5
```

## Check if the docker container is ready
```
./dockerps
```
The container should be named as `sxhu045`.

## Now login
```
sh mpi_login_docker.sh sxhu045
```

## Now you're inside, configure the container with pytorch stuffs
```
cd /mnt/qb/bethge/sxhu/docker_stuffs
sh mpi_config.sh
source ~/.bashrc
```
