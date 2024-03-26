# preparation

1. dependencies

1.1 cmake

    Current (2024) ABY3 require cmake-3.18, and the source file is in `../packages`, making sure it includes it!

    You can use the following command to download the source file.

    ```
    wget -P ./packages/ https://cmake.org/files/v3.18/cmake-3.18.5.tar.gz
    ```

1.2 MPI3.2

    For parallel computation, ABY3 require MPI3.2, and the source file is in `../packages`, making sure it includes it!

    You can use the following command to download the source file.

    ```
    wget -P ./packages/ https://www.mpich.org/static/downloads/3.2/mpich-3.2.tar.gz
    ```

2. ssh keys

    For stable usage, all the ``git`` operations are done thorugh ``ssh``, making sure your ssh keys (`id_rsa`) are in ``./ssh_aby3`` folder. 

3. As the buidling of docker must be within the current path, therefore `cp` the `ssh_aby3` and the `packages` into the current path `./ABY3`.