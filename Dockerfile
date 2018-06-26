ARG CHAINER_VERSION
FROM chainer/chainer:v$CHAINER_VERSION

RUN apt-get update \
  && apt-get install -yq curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
# Need to declare `CHAINER_VERSION` in this build context again
ARG CHAINER_VERSION
RUN mkdir -p /opt/chainer
RUN curl -sSfL https://raw.githubusercontent.com/chainer/chainer/v${CHAINER_VERSION}/examples/mnist/train_mnist.py > /opt/chainer/train_mnist.py
