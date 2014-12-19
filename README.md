
Docker for KeyBox
======
Docker runing KeyBox ssh manager.

**To run:**
```sh
$ docker run -d -p <external_port>:8443 --name keybox dceschmidt/keybox

Example:
$ docker run -d -p 8443:8443 --name keybox dceschmidt/keybox
```

Acknowledgments
------
+ [KeyBox](https://github.com/skavanagh/KeyBox) by [Sean Kavanagh](https://github.com/skavanagh)

Author
------
**Diego Schmidt**

+ dceschmidt@gmail.com
