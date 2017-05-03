FROM golang:1.8.1-alpine

ENV APP_HOME /go/src/github.com/yejiancong/goshop

RUN mkdir -p $APP_HOME

WORKDIR $APP_HOME

ADD . $APP_HOME

RUN apk add -U git \
    && go get github.com/astaxie/beego \
	&& go get github.com/beego/bee \
	&& apk del git \
    && rm -rf /var/cache/apk/* /tmp/*

CMD bee run