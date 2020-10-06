pipeline {
    	
	agent { label 'master' }
	    
    options { timestamps()}

    stages {
        stage('Docker Login') {
            steps {
                echo " ====================== Docker Login ========================"
                withCredentials([usernamePassword(credentialsId: 'dockerhub_krasyak', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh """
                    docker login -u $USERNAME -p $PASSWORD
                    """
                        // available as an env variable, but will be masked if you try to print it out any which way
                        // note: single quotes prevent Groovy interpolation; expansion is by Bourne Shell, which is what you want
                    sh 'echo $PASSWORD'
                        // also available as a Groovy variable
                    echo USERNAME
                        // or inside double quotes for string interpolation
                    echo "username is $USERNAME"
                }
            }
        }
        stage("Create docker image") {
            steps {
                echo " ================== start buolding image =============="
                dir ('.'){
                    sh "bash start.sh"
                }
                
            }
        }
        stage('Docker Push') {
            steps {
               echo " ====================== Pushing Image ========================"
                sh """
                    docker push krasyak/uwsgi-nginx-flask:latest
                """
            }
        }
    }
}   