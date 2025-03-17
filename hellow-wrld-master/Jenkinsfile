pipeline {
    agent {
        node {
            label 'maven-agent'
        }
    }

environment {
    
    PATH = "/opt/apache-maven-3.9.6/bin:$PATH"
}
    stages {
        stage('clone') {
            steps {
                git 'https://github.com/viswkum/hellow-wrld.git'
            }
        }
        stage('build') {
            steps {
                sh 'mvn clean install'
            }
        }
    }
}
