pipeline {
    agent any

    stages {
#        stage('Connect to GitHub') {
 #           steps {
  #              sh 'rm -Rf proj-feb'
   #             sh 'git clone https://github.com/SUSIGUGH/proj-feb.git'
    #            sh 'pwd'
     #           sh 'whoami'
      #          sh 'ls -ltr'
       #         
        #    }
        #}
        stage('Create Docker Image') {
            steps {
                sh 'cd proj-feb/blog && sudo docker build -t blog .'
            }
        }
        
        stage('Tag Docker Image') {
            steps {
                sh 'sudo docker image tag blog susigugh/blog:17-Jul'
            }
        }
        
        stage('Push Docker Image to Docker Hub') {
            steps {
                
                sh 'sudo docker login -u "susigugh" -p "Thailand@2528" && sudo docker push susigugh/blog:17-Jul'
            }
        }
        
        stage('Deploy to Kubernetes') {
            steps {
                sh 'cd proj-feb && chmod 600 minikube02.pem'
                sh 'scp -o StrictHostKeyChecking=no -i proj-feb/minikube02.pem proj-feb/*.yaml ec2-user@54.178.116.132:/home/ec2-user/'
                sh 'ssh -o StrictHostKeyChecking=no -i proj-feb/minikube02.pem ec2-user@54.178.116.132 "cd /home/ec2-user && kubectl create -f deploy.yaml && kubectl create -f service.yaml"'
            }
        }
        
        stage('Expose Service') {
            steps {
               sh 'ssh -o StrictHostKeyChecking=no -i proj-feb/minikube02.pem ec2-user@54.178.116.132 "nohup kubectl port-forward --address 0.0.0.0 svc/srv-blog 30080:8080 -n dev &"'
            }
        } 
        
        
    }
}

