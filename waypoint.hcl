project = "quarkus-getting-started"

app "quarkus-getting-started" {
  labels = {
    "service" = "quarkus-getting-started",
    "env" = "dev"
  }

  build {
    use "pack" {}
  }

  deploy { 
    use "docker" {}
  }
  
}