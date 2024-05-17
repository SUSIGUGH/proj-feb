resource "aws_instance" "kub-master" {
  ami = var.kub-ami
  instance_type = "t2.medium"
  #subnet_id = aws_subnet.sub-us-east-1a.id
  vpc_security_group_ids = [aws_security_group.kub-sg01.id]
 tags = {
    Name = "master"
  }
 key_name = "proj-feb"
 user_data = <<-EOF
   #!/bin/bash
   yum install docker -y
   systemctl enable docker
   systemctl restart docker
   cat <<EOF1 > /etc/yum.repos.d/kubernetes.repo
   [kubernetes]
   name=Kubernetes
   baseurl=https://pkgs.k8s.io/core:/stable:/v1.28/rpm/
   enabled=1
   gpgcheck=1
   gpgkey=https://pkgs.k8s.io/core:/stable:/v1.28/rpm/repodata/repomd.xml.key
   exclude=kubelet kubeadm kubectl
   EOF1
   yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
   systemctl enable kubelet
   systemctl start kubelet
   kubeadm init --ignore-preflight-errors=all > /tmp/kubeadm.log
   mkdir -p ~/.kube
   cp -i /etc/kubernetes/admin.conf ~/.kube/config
   sleep 120
   curl https://raw.githubusercontent.com/projectcalico/calico/v3.27.0/manifests/calico.yaml -O
   kubectl apply -f calico.yaml
   tail -2 /tmp/kubeadm.log > /tmp/kubejoin.sh
 EOF
}
