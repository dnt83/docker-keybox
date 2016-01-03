
Docker for KeyBox
======
Docker runing KeyBox ssh manager.

**To run:**
```sh
$ docker run -d -p <external_port>:8443 --name keybox dceschmidt/keybox

Example:
$ docker run -d -p 8443:8443 --name keybox dceschmidt/keybox
```

**To run the LATEST Keybox version:**
```sh
$ docker run -d -e EDGE=1 -p <external_port>:8443 --name keybox dceschmidt/keybox

Example:
$ docker run -d -e EDGE=1 -p 8443:8443 --name keybox dceschmidt/keybox
```

**Building the docker image**
```sh
$ docker build -t <image_name> <path_to_dockerfile>

Example:
$ docker build -t dceschmidt/keybox .
```

Obs
------
If you are using MacOSX, you need to also foward the port from boot2docker (VirtualBox) to host computer.
```sh
$ VBoxManage controlvm default natpf1 "keybox-port,tcp,127.0.0.1,8443,,8443"
```

Acknowledgments
------
+ [KeyBox](https://github.com/skavanagh/KeyBox) by [Sean Kavanagh](https://github.com/skavanagh)

Author
------
**Diego Schmidt**

+ dceschmidt@gmail.com
