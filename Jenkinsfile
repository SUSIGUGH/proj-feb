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
              sh 'scp -o StrictHostKeyChecking=no -i proj-feb.pem terraform/*.tf ec2-user@18.141.202.90:/home/ec2-user/terraform'

            }
        }

        //End
        stage ("Run Terraform init and apply in Terraform Server as root user"){
            steps{
                echo "Creating Kubernetes Cluster please wait"
              sh 'ssh -o StrictHostKeyChecking=no -i proj-feb.pem ec2-user@18.141.202.90 "cd ~/terraform && sudo terraform init && sudo terraform apply -auto-approve"'

            }
        }





        
    }
}
