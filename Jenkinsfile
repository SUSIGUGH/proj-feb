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
	}
	}
    }
}
