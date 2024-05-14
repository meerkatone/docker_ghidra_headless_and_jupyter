FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/London

RUN apt-get update && apt-get -y dist-upgrade
RUN apt-get install -y git python3-pip python3-venv wget openjdk-21-jdk binwalk ent zsh zip unzip

ENV VIRTUAL_ENV=/opt/headless
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip3 install \
jupyterlab \
numpy \
matplotlib \
pandas \
pwntools \
angr \
z3-solver \
seaborn \
plotly \
scikit-learn \
bokeh==2.4.3 \
statsmodels \
scipy \
ropper \
keystone-engine \
ghidra_jupyter \
ipywidgets \
requests \
pandas_bokeh \
monkeyhex \
pyvex \
bingraphvis \
angr-utils \
cfg-explorer \
jupyter-black \
--no-cache

WORKDIR /opt/src
RUN wget https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_11.0.3_build/ghidra_11.0.3_PUBLIC_20240410.zip
RUN unzip ./ghidra_11.0.3_PUBLIC_20240410.zip
COPY Docker_Ghidra_Headless_Final_1.0.ipynb .
COPY Capa.ipynb .
RUN pip3 install --upgrade pip
RUN git clone https://github.com/mandiant/capa.git
WORKDIR /opt/src/capa
RUN git submodule update --init --recursive
RUN pip3 install -e .

WORKDIR /local
EXPOSE 8888
ENTRYPOINT ["jupyter-lab", "--ip=0.0.0.0","--allow-root"]
