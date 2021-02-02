ARG TF_AZ_CLI_VERSION=release-5.1_terraform-0.12.29_azcli-2.15.1
FROM zenika/terraform-azure-cli:${TF_AZ_CLI_VERSION} AS build

RUN apt-get update && apt-get install git python3-pip -y
RUN pip3 install gitpython python-terraform pyhcl

FROM build as final
WORKDIR /workspace
RUN groupadd --gid 1001 nonroot \
    # user needs a home folder to store azure credentials
    && useradd --gid nonroot --create-home --uid 1001 nonroot \
    && chown nonroot:nonroot /workspace
USER nonroot
CMD [ "bash" ]
