# Inherit from a common base image
FROM buildpack-deps:focal-scm

ENV CONDA_DIR /opt/conda

# Setup Timezone to where our users mostly are
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Set up common 
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
ENV NB_USER jovyan
ENV NB_UID 1000

RUN adduser --disabled-password --gecos "Default Jupyter user" ${NB_USER}

RUN apt-get -qq update --yes && \
    apt-get -qq install --yes \
            tar \
            vim \
            micro \
            mc \
            tini \
            build-essential \
            gfortran \
            gdb \
            make \
            wget \
            python3 \
            curl \
            bc \
            git \
            pip \
            libsuitesparse-dev \
            locales > /dev/null

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

# for nbconvert
# texlive-plain-generic is new name of texlive-generic-recommended
RUN apt-get update > /dev/null && \
    apt-get -qq install --yes \
            pandoc \
            texlive-xetex \
            texlive-fonts-recommended \
            texlive-plain-generic > /dev/null

RUN python3 -m pip install --upgrade pip

# INSTALL SNIVEL
WORKDIR /opt/SNIVEL
COPY . .

## Install TDCPGO
# TODO

USER root
ENV PATH ${CONDA_DIR}/bin:$INSTALL_DIR:$PATH
RUN chmod -R a+rwX ./output

# Install mambaforge as root
COPY install-mambaforge.bash /tmp/install-mambaforge.bash
RUN chmod +x /tmp/install-mambaforge.bash
RUN /tmp/install-mambaforge.bash

USER ${NB_USER}

COPY environment.yml /tmp/environment.yml

# keep getting timeout error when building locally?
ENV MAMBA_NO_LOW_SPEED_LIMIT=1
RUN mamba env update -p ${CONDA_DIR} -f /tmp/environment.yml 

EXPOSE 8888

ENTRYPOINT ["tini", "--"]



