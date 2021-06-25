ARG TF_AZ_CLI_VERSION=release-5.1_terraform-0.12.29_azcli-2.15.1
FROM zenika/terraform-azure-cli:${TF_AZ_CLI_VERSION} AS build

RUN apt-get update && \
    apt-get install --no-install-recommends git=1:2.20.1-2+deb10u3 python3-pip=18.1-5 -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
RUN pip3 install gitpython==3.1.12 python-terraform==0.10.1 pyhcl==0.4.4

RUN wget https://golang.org/dl/go1.15.4.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.15.4.linux-amd64.tar.gz && \
    export PATH=$PATH:/usr/local/go/bin

RUN git clone --depth=1 -b master https://github.com/cloudposse/tfmask.git && \
    cd tfmask && \
    go build
    
FROM build as final
WORKDIR /workspace
RUN groupadd --gid 1001 nonroot \
    # user needs a home folder to store azure credentials
    && useradd --gid nonroot --create-home --uid 1001 nonroot \
    && chown nonroot:nonroot /workspace
USER nonroot
CMD [ "bash" ]
