ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-37}"

FROM registry.fedoraproject.org/fedora-toolbox:${FEDORA_MAJOR_VERSION}

# Install Openshift tools -- oc, opm, kubectl, operator-sdk, odo, helm, crc
RUN curl -SL https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/latest/opm-linux.tar.gz | tar xvzf - -C /usr/bin
RUN curl -SL https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/operator-sdk/latest/operator-sdk-linux-x86_64.tar.gz | tar xvzf - --strip-components 2 -C /usr/bin
RUN curl -SL https://mirror.openshift.com/pub/openshift-v4/clients/oc/latest/linux/oc.tar.gz | tar xvzf - -C /usr/bin
RUN curl -SL https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/helm/latest/helm-linux-amd64 -o /usr/bin/helm && chmod +x /usr/bin/helm
RUN curl -SL https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/odo/latest/odo-linux-amd64 -o /usr/bin/odo && chmod +x /usr/bin/odo
RUN curl -SL https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/crc/latest/crc-linux-amd64.tar.xz | tar xfJ - --strip-components 1 -C /usr/bin

# Install awscli
RUN curl -SL https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip && unzip awscliv2.zip && ./aws/install --bin-dir /usr/bin --install-dir /usr/bin

RUN rm -f get_helm.sh && \
    rm -rf aws && \
    rm -f awscliv2.zip && \
    rm -f /usr/bin/README.md && \
    rm -f /usr/bin/LICENSE
