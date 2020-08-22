FROM python:3.7-slim-buster

ARG BAZEL_VERSION
ENV BAZEL_VERSION=${BAZEL_VERSION:-"3.4.1"}

ARG KUBECTL_VERSION
ENV KUBECTL_VERSION=${KUBECTL_VERSION:-"1.18.0"}

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="$PATH:/root/google-cloud-sdk/bin"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        curl \
        gcc \
        git \
        gnupg \
        g++ \
        patch \
        python=2.7.16-1 \
        software-properties-common

RUN curl -Lo /usr/local/bin/bazel https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-linux-x86_64 && \
    chmod 755 /usr/local/bin/bazel

RUN curl -Lo /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    chmod 755 /usr/local/bin/kubectl

RUN curl -sSL https://sdk.cloud.google.com | bash

ENTRYPOINT ["bazel"]
