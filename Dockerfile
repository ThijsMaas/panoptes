##### BASE IMAGE #####
FROM python:3.6.6

##### METADATA #####
LABEL base.image="python:3.6.6"
LABEL version="1"
LABEL software="panoptes"
LABEL software.version="development"
LABEL software.description="Monitor computational workflows in real time"
LABEL software.website="https://github.com/panoptes-organization/panoptes"
LABEL software.documentation="https://github.com/panoptes-organization/panoptes/blob/develop/README.md"
LABEL software.license="https://github.com/panoptes-organization/panoptes/blob/develop/LICENSE.md"
LABEL software.tags="workflows,monitor,track"
LABEL maintainer="fgypas@gmail.com"
LABEL maintainer.organisation=""
LABEL maintainer.location=""
LABEL maintainer.license="MIT"

##### INSTALL #####
RUN apt-get update \
  && apt-get install -y git-core curl build-essential openssl libssl-dev

RUN curl -sL https://deb.nodesource.com/setup_13.x | /bin/bash - \
  && apt-get install -y nodejs

COPY . /panoptes

RUN cd panoptes && pip install -r requirements.txt \
  && cd server/static \
  && npm install \
  && cd ../../

CMD ["python3", "/panoptes/panoptes.py"]