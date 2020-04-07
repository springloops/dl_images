FROM mxnet/python:nightly_gpu_cu101_mkl_py3

RUN ln -s /usr/bin/python3 /usr/bin/python && \
    mkdir -p /mxnet/d2l-en && chmod -R a+rwx /mxnet/ && \
    apt-get install unzip

WORKDIR /mxnet/d2l-en

RUN wget https://d2l.ai/d2l-en.zip && unzip d2l-en.zip -d d2l-en

WORKDIR /mxnet
COPY README.md README.md

ENV SHELL=/bin/bash

RUN pip install jupyterlab matplotlib numpy scipy pandas sympy nose colored scikit-learn

# for jupyterlab
EXPOSE 8888

CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter lab --notebook-dir=/mxnet --ip 0.0.0.0 --no-browser --allow-root"]
