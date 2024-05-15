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
        stage ("Build Kubernetes Cluster in AWS using terraform"){
            steps{
                echo "Creating Kubernetes Cluster please wait"
              sh 'chmod 600 proj.pem'
              sh 'scp -i proj-feb.pem terraform/*.tf ec2-user@13.250.105.234:/home/ec2-user/terraform'

            }
        }
        
    }
}
