Devops Task

- Run the app:
    
    * Requires Docker and Docker compose. Works on Windows, Linux, macOS.
    * Clone the repository. Run these commands below in order: 
        * `git clone https://github.com/nafbiddut/devops-task.git`. 
        * `cd devops-task`.
        * `docker-compose up --build`.
    * Then open http://localhost:8080 in a browser. The output will be a json response.
    * Stop the app with CTRL+c and run `docker-compose down`.
    
    OR
    * Run it directly from Docker Hub. Requires Docker.
        * `docker run --rm -p 8080:8080 nafislam/devops-task`



- Run the health script
    
    * On Windows, run this script:
    `docker run --rm -v "${PWD}:/work" -w /work ubuntu:24.04 bash -c "apt-get update -qq && apt-get install -y -qq procps >/dev/null && bash system_health.sh && cat health_log.txt`
    * On Linux/macOS/WSL, eun this script:
    `chmod +x system_health.sh`
    `./system_health.sh`
    `cat health_log.txt`
    * Each run will write the log in "health_log.txt". If the disk space crosses 80%, it will print a WARNING message. 



- On every push to main, Github Actions lints the code, builds the Docker image and pushes it to the DockerHub. This need two repository secrets: "DOCKERHUB_USERNAME" and "DOCKERHUB_TOKEN".




## "How would you deploy this container to AWS (e.g.,EC2 or any other VPS)?"
- Launch a VPS, install Docker, and open port 80 in the security group (SSH only from my IP).
- Run `docker run -d -p 80:8080 --restart unless-stopped <dockerhub-user>/devops-task:latest`.
- Optionally let GitHub Actions SSH in to pull and restart the container after each push, and add HTTPS with Nginx or Caddy.

