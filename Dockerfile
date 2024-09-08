FROM arm32v7/alpine

RUN apk update
RUN apk upgrade
RUN apk add curl
RUN rm -rf /var/cache/apk/*

RUN curl --silent --show-error --fail --location \
	--header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o /usr/bin/minio \
	"https://dl.minio.io/server/minio/release/linux-arm/minio" \
	 && chmod 0755 /usr/bin/minio

EXPOSE 9000
ENTRYPOINT ["minio"]
VOLUME ["/export"]
