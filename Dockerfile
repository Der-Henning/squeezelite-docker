from ubuntu:focal

RUN apt-get update
RUN apt-get install squeezelite -y
RUN apt-get install bluez -y
RUN apt-get install bluez-tools -y

#RUN apt-get install git -y

#RUN mkdir /src
#WORKDIR /src

#RUN git clone https://github.com/Arkq/bluez-alsa.git

#RUN apt-get install binutils make csh g++ sed gawk autoconf automake autotools-dev -y
#RUN apt-get install libtool -y
#RUN apt-get install pkg-config -y
#RUN apt-get install build-essential python-docutils -y
#RUN apt-get install libasound2-dev libbluetooth-dev libdbus-1-dev libglib2.0-dev libsbc-dev -y
#RUN apt-get install libopenaptx-dev -y

#WORKDIR /src/bluez-alsa

#RUN autoreconf --install --force

#RUN mkdir build 
#WORKDIR /src/bluez-alsa/build

##RUN ../configure --enable-aac --enable-ofono --enable-debug
#RUN ../configure --enable-ofono --enable-debug

COPY run-squeezelite.sh /run-squeezelite.sh
RUN chmod u+x /run-squeezelite.sh

RUN rm -rf /var/lib/apt/lists/*

ENV SQUEEZELITE_AUDIO_DEVICE default
ENV SQUEEZELITE_NAME SqueezeLite
ENV SQUEEZELITE_TIMEOUT 2
ENV SQUEEZELITE_DELAY 500

ENV STARTUP_DELAY_SEC 0

ENV SQUEEZELITE_SERVER_PORT ""

ENV SQUEEZELITE_RATES ""
ENV SQUEEZELITE_UPSAMPLING ""

ENTRYPOINT ["/run-squeezelite.sh"]
