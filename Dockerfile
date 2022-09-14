# syntax=docker/dockerfile:1

# derived https://github.com/chrishah/samtools-docker

FROM ubuntu:18.04

COPY . .

RUN apt-get update && apt-get -y upgrade && \
	apt-get install -y build-essential wget \
		libncurses5-dev zlib1g-dev libbz2-dev liblzma-dev libcurl3-dev && \
	apt-get clean && apt-get purge && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /usr/src

#Samtools
RUN wget https://github.com/samtools/samtools/releases/download/1.16/samtools-1.16.tar.bz2 && \
	tar jxf samtools-1.16.tar.bz2 && \
	rm samtools-1.16.tar.bz2 && \
	cd samtools-1.16 && \
	./configure --prefix $(pwd) && \
	make

ENV PATH=${PATH}:/usr/src/samtools-1.16



#FROM ubuntu:18.04
#FROM broadinstitute/gatk:4.2.6.1
#COPY . .

#RUN wget https://packages.cloud.google.com/apt/doc/apt-key.gpg \
#    && apt-key add apt-key.gpg

# install apt-get packages for samtools update
# https://www.biostars.org/p/328831/
# for details see https://github.com/samtools/htslib/issues/1261

#RUN  apt-get update && apt-get install -y \
#  autoconf \
#  automake \
#  gcc \
#  make \
#  perl \
#  libbz2-dev \
#  zlib1g-dev \
#  libncurses5-dev \
#  libncursesw5-dev \
#  liblzma-dev \
#  libcurl4-gnutls-dev \
#  libssl-dev


#RUN  cd /usr/bin \
#  && wget https://github.com/samtools/htslib/releases/download/1.16/htslib-1.16.tar.bz2 \
#  && tar -vxjf htslib-1.16.tar.bz2 \
#  && cd htslib-1.16 \
#  && make

#RUN cd /usr/bin \
#  && wget https://github.com/samtools/samtools/releases/download/1.16/samtools-1.16.tar.bz2 \
#  && tar -vxjf samtools-1.16.tar.bz2 \
#  && cd samtools-1.16 \
#  && make

#ENV PATH="${PATH}:/usr/bin/samtools-1.16"

## documentation
# EXPOSE 5000 - not used
### copied from gatk Dockerfile
# CMD ["bash", "--init-file", "/gatk/gatkenv.rc"] #

# ENV FLASK_APP=app.py
# ENV FLASK_RUN_HOST=0.0.0.0
# RUN apk add --no-cache gcc musl-dev linux-headers
# COPY requirements.txt requirements.txt
# RUN pip install -r requirements.txt
