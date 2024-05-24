pipeline{
    agent any
    stages{
        //Start
        stage ("Get Files from GitHub") {
            steps{
	       sh 'pwd'
               sh 'ls -ltr terraform'
            }
        }
        //End
        stage ("Push terraform files to Terraform Server"){
            steps{
                echo "Copying files please wait"
              sh 'chmod 600 proj-feb.pem'
              sh 'scp -o StrictHostKeyChecking=no -i proj-feb.pem terraform/*.tf ec2-user@172.31.23.36:/home/ec2-user/terraform'
              sh 'scp -o StrictHostKeyChecking=no -i proj-feb.pem  proj-feb.pem ec2-user@172.31.23.36:/home/ec2-user/'

            }
        }

        //End
        stage ("Run Terraform init and apply in Terraform Server as root user"){
            steps{
                echo "Creating Kubernetes Cluster please wait"
              sh 'ssh -o StrictHostKeyChecking=no -i proj-feb.pem ec2-user@172.31.23.36 "cd ~/terraform && sudo terraform init && sudo terraform apply -auto-approve"'
             sh 'sleep 30'
             sh 'ssh -o StrictHostKeyChecking=no -i proj-feb.pem ec2-user@172.31.23.36 "cd ~/terraform && sudo terraform output | grep worker | cut -d"=" -f2 > /tmp/wip.txt"'

            }
        }

    }
}
