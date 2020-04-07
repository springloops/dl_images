FROM tensorflow/tensorflow:1.14.0-gpu-py3

RUN pip install jupyterlab matplotlib numpy scipy pandas sympy nose colored scikit-learn

RUN mkdir -p /tf/tensorflow-tutorials && chmod -R a+rwx /tf/ && \
    mkdir /.local && chmod a+rwx /.local && \
    apt-get install -y --no-install-recommends wget fonts-nanum
WORKDIR /tf/tensorflow-tutorials
RUN wget https://raw.githubusercontent.com/tensorflow/docs/master/site/en/tutorials/keras/classification.ipynb \ 
https://raw.githubusercontent.com/tensorflow/docs/master/site/en/tutorials/keras/overfit_and_underfit.ipynb \
https://raw.githubusercontent.com/tensorflow/docs/master/site/en/tutorials/keras/regression.ipynb \
https://raw.githubusercontent.com/tensorflow/docs/master/site/en/tutorials/keras/save_and_load.ipynb \ 
https://raw.githubusercontent.com/tensorflow/docs/master/site/en/tutorials/keras/text_classification.ipynb \
https://raw.githubusercontent.com/tensorflow/docs/master/site/en/tutorials/keras/text_classification_with_hub.ipynb
RUN apt-get autoremove -y && apt-get remove -y wget curl && rm -rf /var/lib/apt/lists/*

WORKDIR /tf
COPY README.md README.md

ENV SHELL=/bin/bash


# for jupyter lab
EXPOSE 8888
# for tensorboard
EXPOSE 6006

CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter lab --notebook-dir=/tf --ip 0.0.0.0 --no-browser --allow-root"]
