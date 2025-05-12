node {
    def image
    // Define the Maven tool (ensure it's configured in Jenkins' Global Tool Configuration)
    def mvnHome = tool 'Maven3'

    // Checkout stage - Pull the latest code from the Git repository
    stage('Checkout') {
        checkout([
            $class: 'GitSCM',
            branches: [[name: '*/master']], 
            doGenerateSubmoduleConfigurations: false, 
            extensions: [],
            submoduleCfg: [],
            userRemoteConfigs: [
                [credentialsId: '9ffd4ee4-3647-4a7d-a357-5e8746463282', 
                 url: 'https://bitbucket.org/ananthkannan/myawesomeangularapprepo/']
            ]
        ])
    }

    // Build stage - Clean and build the project using Maven
    stage('Build') {
        // Use the defined Maven home and run the Maven build
        sh "'${mvnHome}/bin/mvn' -f MyAwesomeApp/pom.xml clean install"
    }

    // Docker Build stage - Build the Docker image
    stage('Docker Build') {
        withDockerServer([uri: "tcp://localhost:4243"]) {
            withDockerRegistry([credentialsId: "fa32f95a-2d3e-4c7b-8f34-11bcc0191d70", 
                                 url: "https://index.docker.io/v1/"]) {
                // Build and push Docker image
                image = docker.build("ananthkannan/mywebapp", "MyAwesomeApp")
                image.push()
            }
        }
    }

    // Docker Stop and Cleanup stage - Stop and remove the container if it's running
    stage('Docker Stop & Cleanup') {
        sh '''
            docker ps -f name=myContainer -q | xargs --no-run-if-empty docker container stop
            docker container ls -a -f name=myContainer -q | xargs -r docker container rm
        '''
    }

    // Docker Run stage - Run the Docker container
    stage('Docker Run') {
        image.run("-p 8085:8085 --rm --name myContainer")
    }
}
