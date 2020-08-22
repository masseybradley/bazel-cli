# bazel

[`bazel`](https://docs.bazel.build/versions/master/bazel-overview.html) build tool `docker` image.

Example usage:
```
git clone git@github.com:kubernetes/test-infra .
docker run --rm -it \
    -v ${PWD}:/workspace/source \
    -v ${HOME}/.kube:/root/.kube \
    -v ${HOME}/.config/gcloud:/root/.config/gcloud \
    -v ${HOME}/.cache/bazel:/root/.cache/bazel \
    -v ${HOME}/.cache/pip:/root/.cache/pip \
    -w /workspace/source \
    --entrypoint bazel \
    bazel run //prow/cmd/tackle
```
