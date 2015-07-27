FROM quay.io/redsift/baseos
MAINTAINER Rahul Powar email: rahul@redsift.io version: 1.0.102

RUN apt-get install curl

RUN curl -sL https://deb.nodesource.com/setup_dev | bash -

RUN apt-get update && apt-get install -y nodejs && \
	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*	
										
# Add bunyan for CLI
RUN npm install -g bunyan --quiet

# Version dump
RUN \
	echo "NodeJS" `nodejs -v` && \
	echo "NPM" `npm -v`

# Define working directory.
WORKDIR /