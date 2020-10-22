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
        sh "waypoint init"
      }
    }

    stage("waypoint build") {
      steps {
        sh """
          waypoint build -workspace "${env.BRANCH_NAME}"
        """
      }
    }

    stage("waypoint deploy") {
      steps {
        echo "deploy"
        //sh "waypoint deploy"
      }
    }

    stage("waypoint release") {
      steps {
        echo "release"
        //sh "waypoint release"
      }
    }
  }
}