FROM alpine:3.15

RUN apk add --no-cache bash curl jq wget

RUN mkdir -p "$HOME/bin" && \
    cd "$HOME/bin" && \
    arch=$(uname -m) && \
    if [ "$arch" = "aarch64" ]; then \
        wget https://github.com/denisidoro/docpars/releases/download/v0.2.0/docpars-v0.2.0-aarch64-unknown-linux-gnu.tar.gz; \
        tar xvfz docpars-v0.2.0-aarch64-unknown-linux-gnu.tar.gz -C ./; \
    else \
        wget https://github.com/denisidoro/docpars/releases/download/v0.2.0/docpars-v0.2.0-x86_64-unknown-linux-musl.tar.gz; \
        tar xvfz docpars-v0.2.0-x86_64-unknown-linux-musl.tar.gz -C ./; \
    fi && \
    chmod +x docpars

ADD entrypoint.sh /entrypoint.sh
ADD src /src

ENTRYPOINT ["/entrypoint.sh"]
