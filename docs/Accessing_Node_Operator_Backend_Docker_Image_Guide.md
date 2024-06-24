## Accessing the Node Operator Backend Docker Image from Google Cloud Artifact Registry

Here's a detailed guide on how to access and utilize the `node-operator-backend` Docker image from the Google Cloud Artifact Registry:

### Step 1: Install Google Cloud SDK
Ensure that the Google Cloud SDK (`gcloud`) is installed on your computer. If not, you can download and install it from the [Google Cloud SDK webpage](https://cloud.google.com/sdk/docs/install).

### Step 2: Authenticate with Google Cloud
Authenticate to Google Cloud to ensure you have the necessary permissions to access the Docker image.
```bash
gcloud auth login
```
Follow the on-screen prompts to complete the authentication process.

### Step 3: Configure Docker to Use `gcloud` as a Credential Helper
Configure Docker to use `gcloud` as a credential helper. This setup allows Docker to automatically authenticate to Google Cloud Artifact Registry when pulling images.
```bash
gcloud auth configure-docker
```

### Step 4: Pull the Node Operator Backend Docker Image
Pull the Docker image using the full path to the image. Replace `latest` with the specific tag you need if not using the latest version.
```bash
docker pull us-central1-docker.pkg.dev/charli3-mainnet/node-operator-backend/node-operator-backend:latest
```

### Step 5: Verify the Downloaded Image
Check that the Docker image is successfully downloaded to your local Docker environment.
```bash
docker images
```
Search for `node-operator-backend` in the list to confirm its presence.

### Step 6: Run the Docker Image
Start a container using the `node-operator-backend` image with the following command, adjusting it based on any specific configurations or environment variables your setup requires.
```bash
docker run -it us-central1-docker.pkg.dev/charli3-mainnet/node-operator-backend/node-operator-backend:latest
```

### Step 7: Check Container Logs (Optional)
If you need to troubleshoot or verify that the application is functioning as expected, view logs from the running container. First, identify your container ID with `docker ps` and then use `docker logs`.
```bash
docker ps
docker logs [CONTAINER_ID]
```

This guide provides a comprehensive approach to accessing and managing the `node-operator-backend` Docker image from Google Cloud Artifact Registry, ensuring you have the necessary tools and steps to integrate and troubleshoot as needed.
