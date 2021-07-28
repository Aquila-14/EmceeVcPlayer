FROM debian:latest

RUN apt update && apt upgrade -y
RUN apt install git curl python3-pip ffmpeg -y
RUN pip3 install -U pip
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g npm
RUN git clone https://github.com/Aquila-14/EmceeVcPlayer.git /root/Aquila-14/
WORKDIR /root/Aquila-14
COPY requirements.txt /deploy/
RUN pip3 install -U -r requirements.txt
RUN pip3 install py-tgcalls==0.5.4 -U
RUN pip3 install aiohttp==3.7.4 -U
CMD python3 -m DaisyXMusic
