#!groovy
pipeline {
    options { buildDiscarder(logRotator(numToKeepStr: '10')) }

    parameters {
        string(name: "APP_NAME", defaultValue: "openvpn", description: "Unblockr's OpenVPN server")
    }

    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script { 
                    docker.withRegistry("https://registry-1.docker.io/v2/", "8dfd9d09-a7b9-47f9-9116-642f69486da9") {
                        docker.build("seaspray/${params.APP_NAME}:${BRANCH_NAME}-${BUILD_ID}", ".").push()
                    }
                }
            }
        }
        stage('Build Tagged docker image') {
            when {
                buildingTag()
            }
            steps {
                script { 
                    docker.withRegistry("https://registry-1.docker.io/v2/", "8dfd9d09-a7b9-47f9-9116-642f69486da9") {
                        docker.build("seaspray/${params.APP_NAME}:${TAG_NAME}-${BUILD_ID}", ".").push()
                    }
                }
            }            
        }
    }
}
