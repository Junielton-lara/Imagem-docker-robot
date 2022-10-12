FROM python:3.8

VOLUME [ "/data" ]
WORKDIR /data

# Setup the timezone to use, defaults to UTC
ENV TZ America/Sao_Paulo

# update the image
RUN pip3 install --upgrade pip

RUN apt-get update && apt-get -y install wget xvfb unzip gnupg build-essential libffi-dev wget

RUN apt-get install -y libglib2.0-0 \
    libnss3 \
    libgconf-2-4 \
    libfontconfig1

# install chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get -y update
RUN apt-get install -y google-chrome-stable


RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/$(curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE)/chromedriver_linux64.zip \
    && unzip /tmp/chromedriver.zip chromedriver -d /usr/bin/ \
    && rm /tmp/chromedriver.zip \
    && chmod ugo+rx /usr/bin/chromedriver

COPY ./runner.sh /

RUN mkdir /results

ENV PATH=/bin:/usr/bin:/data:$PATH

# docker run --rm -v D:\Codes\python\docker-images\test\robot:/data -e WORK_DIRECTORY=portal_1 041995455634/robotf robot -d ../results .
ENTRYPOINT [ "/runner.sh" ]