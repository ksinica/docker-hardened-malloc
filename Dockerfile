ARG ALPINE_VERSION=3.18.3

FROM alpine:${ALPINE_VERSION} as builder

ARG HARDENED_MALLOC_VERSION=12

WORKDIR /usr/src/hardened_malloc

RUN apk --no-cache add build-base git \
 && git clone --depth 1 --branch ${HARDENED_MALLOC_VERSION} https://github.com/GrapheneOS/hardened_malloc . \
 && make \
 && make VARIANT=light

FROM alpine:${ALPINE_VERSION}

COPY --from=builder /usr/src/hardened_malloc/out/libhardened_malloc.so /usr/local/lib/
COPY --from=builder /usr/src/hardened_malloc/out-light/libhardened_malloc-light.so /usr/local/lib/

ENV LD_PRELOAD="/usr/local/lib/libhardened_malloc.so"
