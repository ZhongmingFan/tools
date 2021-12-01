#TODO: 暂以x86 centos7为主  增加其他架构和操作系统
echo "准备K3S安装环境........"
mkdir -p /var/lib/rancher/k3s/agent/images/
cp -Rf ./files/k3s-airgap-images-amd64.tar /var/lib/rancher/k3s/agent/images/
cp -Rf ./files/k3s /usr/local/bin/
chmod -Rf 777 /usr/local/bin/k3s

mkdir -p /home/data/k3s
mkdir -p /root/.kube/

echo "安装K3S依赖包........"
yum localinstall ./OS/x86/Centos7/packages/*.rpm

echo "安装K3S........"
cd /OS/x86/Centos7
INSTALL_K3S_EXEC="--docker --data-dir /home/data/k3s --default-local-storage-path /home/data/local-storage --write-kubeconfig /root/.kube/config --kube-apiserver-arg service-node-port-range=1-65535 feature-gates=TTLAfterFinished=true --kube-controller-manager-arg feature-gates=TTLAfterFinished=true --kube-scheduler-arg feature-gates=TTLAfterFinished=true  --cluster-init" INSTALL_K3S_SKIP_DOWNLOAD=true K3S_TOKEN=fzmxxq sh ./files/install.sh

echo "等待K3S启动........"
sleep 10

echo "source /etc/profile.d/bash_completion.sh" >> /etc/profile
echo "source <(kubectl completion bash)" >> /etc/profile
source /etc/profile

