ARG GOCD_VERSION=v19.8.0
FROM gocd/gocd-agent-alpine-3.9:${GOCD_VERSION}

LABEL description="GoCD agent with helm and kubectl" \
      maintainer="Volodymyr Mykhailyk. <volodymyr.mykhailyk@gmail.com>"

#Install helm
ARG HELM_VERSION=v2.13.1
RUN curl -o /tmp/helm.tar.gz https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz && \
    tar -C /tmp -zxvf /tmp/helm.tar.gz && \
    mv /tmp/linux-amd64/helm /usr/local/bin/helm && \
    rm -rf /tmp/linux-amd64 /tmp/helm.tar.gz


#Install kubectl
ARG KUBECTL_VERSION=v1.14.1
RUN curl -o /tmp/kubectl https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    chmod +x /tmp/kubectl && \
    mv /tmp/kubectl /usr/local/bin/kubectl
