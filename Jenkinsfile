pipeline {
  agent { label "linux" }
  environment {
    MAVEN_CUSTOM_GOALS="clean package"
    MAVEN_JAVA_OPTS="-Dquarkus.container-image.build=true"
    WAYPOINT_SERVER_TOKEN=credentials("waypoint-server-token")
    WAYPOINT_SERVER_ADDR=credentials("waypoint-server-addr")
    WAYPOINT_SERVER_TLS=credentials("waypoint-server-tls")
    WAYPOINT_SERVER_TLS_SKIP_VERIFY=credentials("waypoint-server-tls-skip-verify")
  }
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