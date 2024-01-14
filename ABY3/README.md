# preparation

1. cmake dependencies

    Current (2024) ABY3 require cmake-3.18, and the source file is in `../packages`, making sure it includes it!

    You can use the following command to download the source file.

    ```
    wget -P ../packages/ https://cmake.org/files/v3.18/cmake-3.18.0.tar.gz
    ```

2. ssh keys

    For stable usage, all the ``git`` operations are done thorugh ``ssh``, making sure your ssh keys (`id_rsa`) are in ``./ssh_aby3`` folder. 