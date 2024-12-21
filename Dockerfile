FROM debian:bullseye-slim

WORKDIR /dfu
RUN apt update && apt install -y --no-install-recommends dfu-util wget usbutils
RUN wget  --no-check-certificate \
  https://github.com/google-coral/libedgetpu/raw/master/driver/usb/apex_latest_single_ep.bin \
  -O /dfu/apex_latest_single_ep.bin
RUN apt clean

CMD dfu-util -D /dfu/apex_latest_single_ep.bin -d "1a6e:089a" -R
