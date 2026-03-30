pipeline {
    agent any

    stages {
        stage('Clone Git') {
            steps {
                sh 'rm -Rf proj-feb'
                sh 'git clone https://github.com/SUSIGUGH/proj-feb.git'
                sh 'pwd'
                sh 'ls -ltr'
                sh 'echo "End of Stage Git"'
            }
        }
    }
post {
        success {
             sh 'echo "Build succeeded!"'
            sh 'echo "Build succeeded at `date`" >> susigugh-01.log'
        }
        failure {
                   sh 'echo "Build failed!"'
            sh 'echo "Build failed at `date`!" >> susigugh-01.log'
        }
}
}
