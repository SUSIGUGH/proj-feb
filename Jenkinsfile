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
        stage ("Build Kubernetes CLuster in AWS"){
            steps{
                echo "Creating Kubernetes Cluster please wait"
            }
        }
        
    }
}
