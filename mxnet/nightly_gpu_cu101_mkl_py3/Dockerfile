FROM mxnet/python:nightly_gpu_cu101_mkl_py3

RUN ln -s /usr/bin/python3 /usr/bin/python && \
    chmod -R a+rwx /mxnet/ && \
    mkdir /.local && chmod a+rwx /.local && \
    apt-get install -y --no-install-recommends unzip fonts-nanum

WORKDIR /mxnet

RUN wget https://d2l.ai/d2l-en.zip && unzip d2l-en.zip -d d2l-en && rm d2l-en.zip && \
    wget https://ko.d2l.ai/d2l-ko.zip && unzip d2l-ko.zip -d d2l-ko && rm d2l-ko.zip

COPY README.md README.md

ENV SHELL=/bin/bash

RUN pip install jupyterlab matplotlib scipy pandas sympy nose colored scikit-learn

# for jupyterlab
EXPOSE 8888

CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter lab --notebook-dir=/mxnet --ip 0.0.0.0 --no-browser --allow-root"]
