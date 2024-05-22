# Asterisk stand-alone

FROM debian:stretch as builder
MAINTAINER C.A.Tucker "cartheur@pm.me"

# This container will use the 13-latest from telephony, check the link that the version indicated exists
ENV ASTERISK_VER 13.34.0

# Install requirements
RUN apt-get update && \
   apt-get install -y autoconf build-essential libjansson-dev libxml2-dev libncurses5-dev libspeex-dev libcurl4-openssl-dev libedit-dev libspeexdsp-dev libgsm1-dev libsrtp0-dev uuid-dev sqlite3 libsqlite3-dev libspandsp-dev pkg-config python-dev libssl-dev openssl libopus-dev liburiparser-dev xmlstarlet curl wget && \
   apt-get clean && \
   rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /tmp
RUN curl -o /tmp/asterisk.tar.gz http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-${ASTERISK_VER}.tar.gz && \
   tar xf /tmp/asterisk.tar.gz && rm asterisk.tar.gz && \
   cd /tmp/asterisk-${ASTERISK_VER}

# Make and install asterisk and the sample files, clean-up
RUN cd /tmp/asterisk-${ASTERISK_VER} &&\
   ./configure --with-pjproject-bundled --with-jansson-bundled --with-spandsp --with-opus && \
   make menuselect.makeopts && \
   menuselect/menuselect --disable CORE-SOUNDS-EN-GSM --enable CORE-SOUNDS-EN-ULAW --enable codec_opus --disable BUILD_NATIVE --disable chan_sip menuselect.makeopts && \
   make && \
   make install && \
   make samples && \
   rm -Rf /tmp/*

FROM debian:stretch
COPY --from=builder /usr/sbin/asterisk /usr/sbin/
COPY --from=builder /usr/sbin/safe_asterisk /usr/sbin/
COPY --from=builder /usr/lib/libasterisk* /usr/lib/
COPY --from=builder /usr/lib/asterisk/ /usr/lib/asterisk
COPY --from=builder /var/lib/asterisk/ /var/lib/asterisk
COPY --from=builder /var/spool/asterisk/ /var/spool/asterisk

# Add required runtime libraries, clean-up
RUN apt-get update && \
   apt-get install -y gnupg libjansson4 xml2 libncurses5 libspeex1 libcurl4-openssl-dev libedit2 libspeexdsp1 libgsm1 libsrtp0 uuid libsqlite3-0 libspandsp2 libssl1.1 libopus0 liburiparser1 xmlstarlet curl wget && \
   apt-get clean && \
   rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add sngrep, clean-up
COPY irontec.list /etc/apt/sources.list.d/irontec.list
RUN curl -L http://packages.irontec.com/public.key | apt-key add -
RUN apt-get update && \
   apt-get install -y sngrep && \
   rm -Rf /var/lib/apt/lists/ /tmp/* /var/tmp/*

# Expose ports and add volumes
EXPOSE 5060 5061

VOLUME /etc/asterisk /var/lib/asterisk /var/spool/asterisk

CMD ["asterisk", "-f"]