pipeline {
    agent any 
    tools {
        // Specify the Docker tool to use
        docker
    }
    stages {
        stage('Build pulling from github') {
            steps {
                // Pull the code from the repository
                echo 'Building the application..'
                sh "git pull origin main"
            }
        }
        
        stage('Build image') {
            steps {
                // Build and push Docker image
                echo 'Building the docker image..'
                withCredentials([usernamePassword(credentialsId: 'docker-hub-repo', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                    sh "docker build -t $USER/jenkins-pipe:v-1.0 ."
                    sh "echo $PASS | docker login -u $USER --password-stdin"
                    sh "docker push $USER/jenkins-pipe:v-1.0"
                }
            }
        }

         stage('Run image') {
            steps {
                // Run Docker image
                echo 'Running the Docker image...'
                sh "docker run -d -p 5000:5000 mukeshkr1234/jenkins-pipe"
            }
        }
        stage('Deploy') {
            steps {
                // Deployment steps (if any)
                echo 'Deploying the application....'
                // Add deployment commands here
            }
        }
    }
}
