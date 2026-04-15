pipeline {
    agent any
     options {
        buildDiscarder(logRotator(numToKeepStr: '5'))
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master',
                    url: 'https://github.com/susigugh/proj-feb.git',
                    credentialsId: 'git-01'
            }
        }
	stage('Check Files') {
	   steps {
	      sh 'ls -ltr'
	      sh 'sudo docker ps'
        }
	}

       stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'docker-01',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )])
		{
            sh 'echo $DOCKER_PASS | sudo docker login -u $DOCKER_USER --password-stdin'
        }
		}
		}
      
      stage('Build Image') {
      steps {
             sh 'cd blog && sudo docker build -t blogimg01 .'
	     }
	     }
stage('Tag the image') {
steps {
sh 'sudo docker image tag blogimg01 amcnssstd/blogimg01:v1'
}
}
stage('Push the iamge to Docker Hub') {
steps {
// sh 'echo "$DOCKER_PASS" | sudo docker login -u "$DOCKER_USER" --password-stdin'
sh 'sudo docker push amcnssstd/blogimg01:v1'
sh 'sudo docker logout'
}
}

stage('Copy deploy.yaml to Kubernetes Server') {
steps {
sh 'chmod 600 kube8s.pem'
sh 'scp -o StrictHostKeyChecking=no -i kube8s.pem *.yaml ec2-user@54.224.65.251:/home/ec2-user/'
}
}


stage('Deploy the deployment in Kubernetes Server') {
steps {
sh 'chmod 600 kube8s.pem'
sh 'ssh -o StrictHostKeyChecking=no -i kube8s.pem ec2-user@54.224.65.251 "cd /home/ec2-user/ && export KUBECONFIG=/home/ec2-user/admin.conf && kubectl create -f deploy.yaml"'
}
}

stage('Create the service in Kubernetes Server') {
steps {
sh 'chmod 600 kube8s.pem'
sh 'ssh -o StrictHostKeyChecking=no -i kube8s.pem ec2-user@54.224.65.251 "cd /home/ec2-user/ && export KUBECONFIG=/home/ec2-user/admin.conf && kubectl create -f service.yaml"'
}
}


}
}
