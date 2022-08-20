FROM n-flow

LABEL "com.github.actions.name"="ReleaseAsset"
LABEL "com.github.actions.description"="Upload artifacts when new releases are made"
LABEL "com.github.actions.icon"="save"
LABEL "com.github.actions.color"="gray-dark"

LABEL version="1.0.0"
LABEL repository="https://github.com/n-flow/ReleaseAsset"
LABEL homepage="https://github.com/n-flow/ReleaseAsset"
LABEL maintainer="n-flow"

RUN apt-get update && \
    apt-get install --yes ca-certificates curl jq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#COPY upload-script /usr/bin/upload-script
COPY upload-script /usr/bin/upload-script
RUN ["chmod", "+x", "/usr/bin/upload-script"]
ENTRYPOINT ["/usr/bin/upload-script"]