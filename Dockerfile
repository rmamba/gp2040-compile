FROM jitesoft/node-yarn:lts-slim

RUN apk add --no-cache git cmake gcc-arm-none-eabi g++-arm-none-eabi newlib-arm-none-eabi bsd-compat-headers linux-headers build-base python3

RUN mkdir -p /pico/GP2040/build

WORKDIR /pico
RUN git clone --depth 1 --branch 2.0.0 https://github.com/raspberrypi/pico-sdk.git
RUN cd pico-sdk && git submodule update --init

ENV PICO_SDK_PATH=/pico/pico-sdk
ENV PICOTOOL_FETCH_FROM_GIT_PATH=/pico/picotool
WORKDIR /pico/GP2040/build
