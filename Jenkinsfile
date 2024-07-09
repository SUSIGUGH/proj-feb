pipeline{
    agent any
    stages{
        stage('Stage1'){
            steps{
                echo 'Hello Welcome'
                sh 'ls -ltrah'
                sh 'pwd'
                sh 'rm -Rf proj-feb'
                sh 'git clone https://github.com/SUSIGUGH/proj-feb.git'
                sh 'cd proj-feb && ls -ltr'
            }
        }
    }
}
