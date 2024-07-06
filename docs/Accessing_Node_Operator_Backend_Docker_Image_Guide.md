## Accessing the Node Operator Backend Docker Image from Google Cloud Artifact Registry

Here's a streamlined guide on how to directly access and utilize the `node-operator-backend` Docker image from the Google Cloud Artifact Registry using a base64-encoded service account key.

### Step 1: Decode and Authenticate Docker with Google Cloud Artifact Registry
Before pulling the Docker image, prepare the Docker client to authenticate using the base64-encoded service account key.

Decode the service account key file on-the-fly and use it to log in to the Docker:
```bash
base64 --decode ./secure_keys/encoded_key.txt | docker login -u _json_key --password-stdin https://us-central1-docker.pkg.dev
```
This command decodes the base64-encoded service account key stored in `./secure_keys/encoded_key.txt` and pipes it directly to the Docker login command.

### Step 2: Pull the Node Operator Backend Docker Image
Pull the Docker image using the full path to the image. Replace `latest` with the specific tag you need if not using the latest version.
```bash
docker pull us-central1-docker.pkg.dev/charli3-mainnet/node-operator-backend/node-operator-backend:latest
```

### Step 3: Verify the Downloaded Image
Check that the Docker image is successfully downloaded to your local Docker environment.
```bash
docker images
```
Search for `node-operator-backend` in the list to confirm its presence.

### Step 4: Run the Docker Image
Start a container using the `node-operator-backend` image with the following command, adjusting it based on any specific configurations or environment variables your setup requires.
```bash
docker run -it us-central1-docker.pkg.dev/charli3-mainnet/node-operator-backend/node-operator-backend:latest
```

### Step 5: Check Container Logs (Optional)
If you need to troubleshoot or verify that the application is functioning as expected, view logs from the running container. First, identify your container ID with `docker ps` and then use `docker logs`.
```bash
docker ps
docker logs [CONTAINER_ID]
```

This revised guide provides a straightforward approach to accessing and managing the `node-operator-backend` Docker image from Google Cloud Artifact Registry directly using Docker commands and a base64-encoded service account key, ensuring a quick and secure setup.
