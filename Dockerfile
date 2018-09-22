FROM node:10.9.0-alpine

# This section adds support for Pact's standalone runner (based on Ruby)
# https://github.com/pact-foundation/pact-js/issues/154
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.27-r0/glibc-2.27-r0.apk
RUN apk add --no-cache bash git openssh zip curl wget ca-certificates glibc-2.27-r0.apk

# Add libs and runtimes needs for Selenium and Chrome headless
ENV SELENIUM_VERSION 3.14.0
ENV OPENJDK_VERSION 8.171.11-r0
ENV CHROMIUM_VERSION 68.0.3440.75-r0
ENV CHROMIUM_CHROMEDRIVER_VERSION 68.0.3440.75-r0
RUN apk add --no-cache \
  wget \
  openjdk8-jre=$OPENJDK_VERSION \
  chromium=$CHROMIUM_VERSION \
  chromium-chromedriver=$CHROMIUM_CHROMEDRIVER_VERSION

RUN wget http://selenium-release.storage.googleapis.com/`echo $SELENIUM_VERSION | sed 's/\(.*\..*\)\..*/\1/g'`/selenium-server-standalone-$SELENIUM_VERSION.jar \
  -O /usr/bin/selenium.jar
