FROM golang:1.7.4-alpine

ENV  GOPATH /go
ENV APPPATH $GOPATH/src/github.com/DanielHeckrath/smartcentrix-notifications
COPY . $APPPATH
RUN cd $APPPATH && go build -o /smartcentrix-notifications && rm -rf $GOPATH

EXPOSE 8080
EXPOSE 8081
EXPOSE 8082

ENTRYPOINT ["/smartcentrix-notifications"]