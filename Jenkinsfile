pipeline {
  agent { label "linux" }
  stages {
    stage("build") {
      steps {
        sh """
          ./mvnw clean build
        """
      }
    }
    stage("test") {
      steps {
        sh """
          ./mvnw test
        """
      }
    }
  }
}