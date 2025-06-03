# Build docker container

```
docker build -t rmamba/gp2040-compile:2.1.1 .
```

# Compile inside container

First start a container that will link your source code into the compile environment.
```
docker start -it --name gp2040-compile -v "c:\GIT\github.com\rmamba\GP2040-CKE":/pico/GP2040 rmamba/gp2040-compile:2.1.1 /bin/sh
```

After that you can connect to the container and perform firmware compile
```
sudo docker run -it --entrypoint /bin/ash gp2040-compile
```



After this the firmware will be in the build folder on your dev machine you previously linked into docker container.

```
docker run -it --name gp2040-compile -v "c:\GIT\github.com\rmamba\GP2040-CKE":/pico/GP2040 --env GP2040_BOARDCONFIG=KeyboardController --env PICO_BOARD=waveshare_rp2040_zero rmamba/gp2040-compile:2.1.1 rm -r *
docker run -it --name gp2040-compile -v "c:\GIT\github.com\rmamba\GP2040-CKE":/pico/GP2040 --env GP2040_BOARDCONFIG=KeyboardController --env PICO_BOARD=waveshare_rp2040_zero rmamba/gp2040-compile:2.1.1 cmake ..
docker run -it --name gp2040-compile -v "c:\GIT\github.com\rmamba\GP2040-CKE":/pico/GP2040 --env GP2040_BOARDCONFIG=KeyboardController --env PICO_BOARD=waveshare_rp2040_zero rmamba/gp2040-compile:2.1.1 make

docker run -it --rm -v "c:\GIT\github.com\rmamba\GP2040-CKE":/pico/GP2040 --env GP2040_BOARDCONFIG=KeyboardController --env PICO_BOARD=waveshare_rp2040_zero rmamba/gp2040-compile:2.1.1 rm -r *
docker run -it --rm -v "c:\GIT\github.com\rmamba\GP2040-CKE":/pico/GP2040 --env GP2040_BOARDCONFIG=KeyboardController --env PICO_BOARD=waveshare_rp2040_zero rmamba/gp2040-compile:2.1.1 cmake ..
docker run -it --rm -v "c:\GIT\github.com\rmamba\GP2040-CKE":/pico/GP2040 --env GP2040_BOARDCONFIG=KeyboardController --env PICO_BOARD=waveshare_rp2040_zero rmamba/gp2040-compile:2.1.1 make

docker run -it --rm -v "c:\GIT\github.com\rmamba\GP2040-CKE":/pico/GP2040 --env GP2040_BOARDCONFIG=KeyboardController --env PICO_BOARD=waveshare_rp2040_zero --env SKIP_WEBBUILD=TRUE rmamba/gp2040-compile:2.1.1 make

docker run -it --rm -v "c:\GIT\github.com\rmamba\GP2040-CKE":/pico/GP2040 --env PICO_BOARD=waveshare_rp2040_zero rmamba/gp2040-compile:2.1.1 cmake ..
```
