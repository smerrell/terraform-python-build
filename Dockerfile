FROM zenika/terraform-azure-cli:latest AS build

RUN apt-get update && apt-get install make git python3-pip -y
RUN pip3 install gitpython

FROM build as final
WORKDIR /workspace
CMD [ "bash" ]
