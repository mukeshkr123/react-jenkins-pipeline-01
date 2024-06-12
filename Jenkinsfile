pipeline {
    agent any 
    stages {
        stage ("test"){
            steps {
                echo "Testing the application..."
                echo "Testing the application for $BRANCH_NAME ..."
            }
        }
        stage('Build pulling from GitHub') {
            steps {
                // Pull the code from the repository
                echo 'Building the application...'
                sh "git pull origin $BRANCH_NAME"
            }
        }
        
        stage('Build image') {
            when {
                expression {
                    BRANCH_NAME == 'main'
                }
            }
            steps {
                // Build and push Docker image
                echo 'Building the Docker image...'
                withCredentials([usernamePassword(credentialsId: 'docker-hup-repo', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                    sh "docker build -t $USER/jenkins-pipe:v-1.0 ."
                    sh "echo $PASS | docker login -u $USER --password-stdin"
                    sh "docker push $USER/jenkins-pipe:v-1.0"
                }
            }
        }

        stage('Deploy') {
             when {
                expression {
                    BRANCH_NAME == 'main'
                }
            }
            steps {
                // Deployment steps (if any)
                echo 'Deploying the application...'
                // Add deployment commands here
            }
        }
    }
}
