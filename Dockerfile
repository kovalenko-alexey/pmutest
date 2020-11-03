# build stage
FROM	ubuntu:20.04 as builder
RUN	apt-get update -qy && \
	apt-get upgrade -qy
RUN	apt-get install build-essential -qy
WORKDIR app
COPY	./test.c /app
RUN	gcc -o test -static test.c

# run stage
FROM 	    busybox:latest as app
WORKDIR     app
COPY	    --from=builder /app/test /app/test
ENTRYPOINT  ./test




