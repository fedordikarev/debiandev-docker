FROM ownyourbits/debiandev:latest

LABEL description="Debian package development environment"
MAINTAINER Fedor Dikarev <fedor.dikarev@gmail.com>

RUN sudo apt-get update;\
    DEBIAN_FRONTEND=noninteractive sudo apt-get install --no-install-recommends -y tzdata;\
    sudo apt-get autoremove -y; sudo apt-get clean; sudo rm /var/lib/apt/lists/*; \
    sudo rm /var/log/alternatives.log /var/log/apt/*; sudo rm /var/log/* -r;

RUN sudo mkdir -p /build/src;\
    sudo chown -R builder:builder /build;\
    echo 'cd /build/src' >> /home/builder/.bashrc

