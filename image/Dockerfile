FROM arne/baseimage

RUN curl https://raw.githubusercontent.com/wiki/rebar/rebar/rebar > /usr/local/bin/rebar
RUN chmod a+rx /usr/local/bin/rebar

ADD erlang-17.3.tar.gz /

RUN ln -s erlang-17.3 /opt/erlang
RUN ln -s /opt/erlang/bin/* /usr/local/bin/
