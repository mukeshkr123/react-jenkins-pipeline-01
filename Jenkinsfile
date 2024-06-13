@Library('jenkins-shared-library-01') _

pipeline {
    agent any
    
    environment {
        // Define any environment variables here if needed
        // Example: SOME_ENV_VAR = 'some_value'
    }
    
    stages {
        stage("Test") {
            steps {
                echo "Testing the application..."
                echo "Testing the application for ${env.BRANCH_NAME} ..."
            }
        }

        stage('Pull from GitHub') {
            steps {
                script {
                    githubPull()
                }
            }
        }
        
        stage('Build Image') {
            steps {
                script {
                    buildImage()
                }
            }
        }

        stage('Deploy') {
            when {
                branch 'main'
            }
            steps {
                echo 'Deploying the application...'
                // Add deployment commands here
                // Example: sh 'deploy.sh'
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Please check the logs.'
        }
    }
}
