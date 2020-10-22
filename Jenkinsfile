pipeline {
  agent { label "linux" }
  stages {
    stage("pre") {
      steps {
        sh """
          env | sort
        """
      }
    }
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
    stage("waypoint init") {
      steps {
        sh """
          waypoint init -workspace=${env.BRANCH_NAME}
        """
      }
    }

    stage("waypoint build") {
      steps {
        sh """
          waypoint build -workspace=${env.BRANCH_NAME}
        """
      }
    }

    stage("waypoint deploy") {
      steps {
        sh """
          waypoint deploy -workspace=${env.BRANCH_NAME}
        """
      }
    }

    stage("waypoint release") {
      steps {
        sh """
          waypoint release -workspace=${env.BRANCH_NAME}
        """
      }
    }
  }
}