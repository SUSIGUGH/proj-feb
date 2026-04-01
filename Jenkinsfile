pipeline {
    agent any

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
                )]) {
                    sh '''
		    cd blog && sudo docker build -t blogimg01 .
		    sudo docker image tag blogimg01 amcnssstd/blogimg01:v1 
                    echo "$DOCKER_PASS" | sudo docker login -u "$DOCKER_USER" --password-stdin
		    sudo docker push amcnssstd/blogimg01:v1
		    sudo docker logout
                    '''
                }
            }
        }

    }
}
