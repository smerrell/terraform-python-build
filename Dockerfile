FROM zenika/terraform-azure-cli:latest AS build

RUN apt-get update && apt-get install make git python3-pip -y
RUN pip3 install gitpython python-terraform pyhcl

RUN wget https://golang.org/dl/go1.15.4.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.15.4.linux-amd64.tar.gz && \
    export PATH=$PATH:/usr/local/go/bin

RUN git clone --depth=1 -b master https://github.com/cloudposse/tfmask.git && \
    cd tfmask && \
    go build
    
FROM build as final
WORKDIR /workspace
CMD [ "bash" ]
