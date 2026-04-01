pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/susigugh/proj-feb.git',
                    credentialsId: 'git-01'
            }
        }
	stage('Check Files') {
	steps {
	sh 'ls -ltr'
	}
	}
    }
}
