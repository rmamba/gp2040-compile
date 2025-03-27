# GP2040 Firmware compiler

This is a alpine linux docker container with everything you need to compile your own firmware.

## GP2040 project Links

[Downloads](https://gp2040-ce.info/downloads) | [Installation](https://gp2040-ce.info/installation) | [Wiring](https://gp2040-ce.info/controller-build/wiring) | [Usage](https://gp2040-ce.info/usage) | [FAQ](https://gp2040-ce.info/faq/faq-general) | [GitHub](https://github.com/OpenStickCommunity/GP2040-CE)

Full documentation can be found at [https://gp2040-ce.info](https://gp2040-ce.info)

## GP2040 Firmaware Features

- Select from 13 input modes including X-Input, Nintendo Switch, Playstation 4/5, Xbox One, D-Input, and Keyboard
- Input latency average of 0.76ms in Xinput and 0.91ms for Playstation 5.
- Multiple SOCD cleaning modes - Up Priority (a.k.a. Stickless), Neutral, and Second Input Priority.
- Left and Right stick emulation via D-pad inputs as well as dedicated toggle switches.
- Dual direction via D-pad + LS/RS.
- Reversed input via a button.
- [Turbo and Turbo LED](https://gp2040-ce.info/add-ons/turbo) with selectable speed
- Per-button RGB LED support.
- PWM Player indicator LED support (XInput only).
- Multiple LED profiles support.
- Support for 128x64 monochrome I2C displays - SSD1306, SH1106, and SH1107 compatible.
- Custom startup splash screen and easy image upload via web configuration.
- Support for passive buzzer speaker (3v or 5v).
- [Built-in, embedded web configuration](https://gp2040-ce.info/web-configurator) - No download required!

Visit the [GP2040-CE Usage](https://gp2040-ce.info/usage) page for more details.

# Compile GP2040 using docker

This assumes you already have GP2040 code locally (if not look at the GP2040 project links for instructions).
Create `build` folder in the firmware folder before compiling. It is where the firmware will end up after successful compile.
You need to run `cmake ..` command only once or when you delete `build` content folder and want to compile for a different board.

First start a container that will link your source code into the compile environment.
```
docker start -it --name gp2040-compile -v "c:\PATH_TO\GP2040-CE":/pico/GP2040 rmamba/gp2040-compile:2.1.1 /bin/sh
```

After that you can connect to the container and perform firmware compile
```
sudo docker run -it --entrypoint /bin/ash gp2040-compile
```

Once inside the shell of the docker container you can compile the firmare.
Optionaly you can specify what firmware you want to compile with setting evironment variables first.
If no options are provided the default `Pico` firmware will be compiled.
```
#export GP2040_BOARDCONFIG=KeyboardController
#export PICO_BOARD=waveshare_rp2040_zero
cmake ..
mmake
```
