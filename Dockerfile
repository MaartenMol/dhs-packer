FROM centos:8

RUN dnf install -y git wget unzip

RUN wget https://releases.hashicorp.com/packer/1.5.4/packer_1.5.4_linux_amd64.zip && unzip packer_1.5.4_linux_amd64.zip && mv packer /usr/local/bin/packer && chmod +x /usr/local/bin/packer

RUN git clone https://github.com/MaartenMol/dhs-packer.git /dhs-packer

WORKDIR /dhs-packer
