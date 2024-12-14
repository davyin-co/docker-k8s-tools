FROM alpine/ansible
ENV HELM_VERSION=3.9.4
ADD entrypoint.sh /entrypoint.sh
RUN apk add --update --no-cache curl ca-certificates bash git openssl curl jq py3-configobj py3-pip py3-setuptools python3 python3-dev && \
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 &&\
    chmod +x get_helm.sh && ./get_helm.sh && \
    python3 -m venv /venv && \
    . /venv/bin/activate && \
    pip install --upgrade pip && \
    pip3 install kubernetes kubernetes-validate && \
    ansible-galaxy collection install kubernetes.core && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]