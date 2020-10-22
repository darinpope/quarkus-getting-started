pipeline {
  agent { label "linux" }
  stages {
    stage("build") {
      steps {
        sh """
          ./mvnw clean compile
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