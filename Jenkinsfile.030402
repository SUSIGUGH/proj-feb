pipeline {
    agent any

    stages {
        stage('Retry Test') {
            steps {
                retry(3) {
                    echo "Running retry test..."
                    sh '''
                    set -e
                    echo "This will fail"
                    exit 1
                    '''
                }
            }
        }
    }
}
