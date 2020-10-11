FROM fedora:32

WORKDIR /src/libpdl

RUN dnf install -y \
        autoconf \
        automake \
        libtool \
        g++ \
        make \
        flex \
        bison \
        diffutils \
    ; \
    dnf clean all;

COPY . /src/libpdl

RUN set -eux; \
    aclocal; \
    libtoolize; \
    automake --add-missing && ls -lah; \
    autoreconf; \
    ./configure; \
    make; \
    make check; \
    make install;
