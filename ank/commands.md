wget -q --show-progress --https-only --timestamping \
  "https://dl.k8s.io/v1.28.2/bin/linux/arm64/kube-apiserver" \
  "https://dl.k8s.io/v1.28.2/bin/linux/arm64/kube-controller-manager" \
  "https://dl.k8s.io/v1.28.2/bin/linux/arm64/kube-scheduler" \
  "https://dl.k8s.io/v1.28.2/bin/linux/arm64/kubectl"

wget -q --show-progress --https-only --timestamping \
  "https://dl.k8s.io/v1.28.2/bin/linux/arm64/kube-proxy" \
  "https://dl.k8s.io/v1.28.2/bin/linux/arm64/kubelet" \
  "https://dl.k8s.io/v1.28.2/bin/linux/arm64/kubectl"

  
{
  CONTAINERD_VERSION=1.7.7
  CNI_VERSION=1.3.0
  RUNC_VERSION=1.1.9
  ARCH=arm64

  wget -q --show-progress --https-only --timestamping \
    https://github.com/containerd/containerd/releases/download/v${CONTAINERD_VERSION}/containerd-${CONTAINERD_VERSION}-linux-${ARCH}.tar.gz \
    https://github.com/containernetworking/plugins/releases/download/v${CNI_VERSION}/cni-plugins-linux-${ARCH}-v${CNI_VERSION}.tgz \
    https://github.com/opencontainers/runc/releases/download/v${RUNC_VERSION}/runc.${ARCH}

  sudo mkdir -p /opt/cni/bin

  sudo chmod +x runc.${ARCH}
  sudo mv runc.${ARCH} /usr/local/bin/runc

  sudo tar -xzvf containerd-${CONTAINERD_VERSION}-linux-${ARCH}.tar.gz -C /usr/local
  sudo tar -xzvf cni-plugins-linux-${ARCH}-v${CNI_VERSION}.tgz -C /opt/cni/bin
}