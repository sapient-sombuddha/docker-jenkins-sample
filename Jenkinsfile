node {

    withMaven(maven:'maven3') {
        stage('Build') {
            sh 'mvn clean install'

            def pom = readMavenPom file:'pom.xml'
            print pom.version
            env.version = pom.version
        }

        stage('Image') {
             def app = docker.build "localhost:5000/Micro1:${env.version}"
             app.push()
        }

        stage ('Run') {
            docker.image("localhost:5000/Micro1:${env.version}").run('-p 8761:8761 -h micro1 --name micro1')
        }

        stage ('Final') {
            build job: 'Docker-Pipeline', wait: false
        }

    }

}