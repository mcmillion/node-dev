FROM node:11.10-alpine

# ENV GLIBC_VERSION 2.28-r0
# ENV SELENIUM_VERSION 3.141.59
# ENV OPENJDK_VERSION 8.191.12-r0
# ENV CHROMIUM_VERSION 68.0.3440.75-r0
# ENV CHROMIUM_CHROMEDRIVER_VERSION 68.0.3440.75-r0

# # This section adds support for Pact's standalone runner (based on Ruby)
# # https://github.com/pact-foundation/pact-js/issues/154
# RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
# RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/$GLIBC_VERSION/glibc-$GLIBC_VERSION.apk
# RUN apk add --no-cache bash git openssh zip curl wget ca-certificates glibc-$GLIBC_VERSION.apk

# # Add libs and runtimes needs for Selenium and Chrome headless
# RUN apk add --no-cache \
#   openjdk8-jre=$OPENJDK_VERSION \
#   chromium=$CHROMIUM_VERSION \
#   chromium-chromedriver=$CHROMIUM_CHROMEDRIVER_VERSION

# RUN wget http://selenium-release.storage.googleapis.com/`echo $SELENIUM_VERSION | sed 's/\(.*\..*\)\..*/\1/g'`/selenium-server-standalone-$SELENIUM_VERSION.jar \
#   -O /usr/bin/selenium.jar

ENV PSQL_VERSION 10.6

RUN apk update
RUN apk upgrade
RUN apk add --no-cache \
      psql=$PSQL_VERSION
