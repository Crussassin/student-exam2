pipeline {

	environment {
    registry = "crussassin/point_8"
    registryCredential = 'bfff7ae1-4d76-4c29-81ea-0d4f96fa87e2'
  }
    agent any
    stages {
        stage('python test') {
            steps {
                
                sh '''
					rm -rf student-exam2					
                    git clone https://github.com/Crussassin/student-exam2.git
					cd student-exam2
					pip install -e '.[test]'
					coverage run -m pytest
					coverage report					
                    mv dockerfile ./..
					cd ..
					
                '''
					
				}
			}
			
						
		stage('Build Docker image'){
            steps{
                script{
                    dockerImage = docker.build registry + ":app"
                }
            }
        }
		
		stage('Push Docker image'){
            steps{
                script{
                    docker.withRegistry('', registryCredential){
                        dockerImage.push()
                    }
                }
            }
        }
		}
	}
