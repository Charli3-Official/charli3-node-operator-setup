# Accessing the Node Operator Backend Docker Image from GitHub Container Registry

This guide provides instructions on how to access and utilize the `node-operator-backend` Docker image from the GitHub Container Registry (ghcr.io).

## Step 1: Pull the Node Operator Backend Docker Image

Since the image is public, you can pull it directly without any authentication:

```bash
docker pull ghcr.io/charli3-official/charli3-node-operator-backend:latest
```

Replace `latest` with a specific tag if you need a particular version.

## Step 2: Verify the Downloaded Image

Check that the Docker image is successfully downloaded to your local Docker environment:

```bash
docker images
```

Look for `ghcr.io/charli3-official/charli3-node-operator-backend` in the list to confirm its presence.

## Step 3: Run the Docker Image

Start a container using the `node-operator-backend` image with the following command, adjusting it based on any specific configurations or environment variables your setup requires:

```bash
docker run -it ghcr.io/charli3-official/charli3-node-operator-backend:latest
```

## Step 4: Check Container Logs (Optional)

If you need to troubleshoot or verify that the application is functioning as expected, view logs from the running container. First, identify your container ID with `docker ps` and then use `docker logs`:

```bash
docker ps
docker logs [CONTAINER_ID]
```


This guide provides a straightforward approach to accessing and managing the `node-operator-backend` Docker image from GitHub Container Registry using Docker commands, ensuring a quick and easy setup for all users.