FROM eyeruleall/asterisk17

COPY conf/extensions.conf /etc/asterisk
COPY conf/ari.conf /etc/asterisk
COPY conf/http.conf /etc/asterisk
COPY conf/sip.conf /etc/asterisk