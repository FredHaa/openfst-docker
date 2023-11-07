FROM ubuntu:22.04
RUN --mount=type=cache,target=/var/cache/apt apt-get update -y && \
    apt-get install -y \
    wget \
    build-essential

RUN wget https://www.openfst.org/twiki/pub/FST/FstDownload/openfst-1.8.2.tar.gz -O - | tar -xz \
    && cd openfst-1.8.2 \
    && ./configure --enable-far --enable-mpdt --enable-pdt \ 
    && make -j16 \
    && make install
