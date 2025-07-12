# DevOps Course — Exercise 2, Manual deployment to VM

## 🚀 Deployment Steps

## 1. Deploy a VM

- Create a VM instance in Google Cloud.
- Choose Ubuntu 22.04 LTS as the OS.
- Generate SSH to connect.

## 2. Establish Connection with VM via SSH

I used

- Google Cloud Console “SSH” button
- Local machine with SSH

```bash
ssh ofermordehai0@<VM_EXTERNAL_IP>
✅ Screenshot:

3. Install Docker on VM
Update packages and install Docker:

bash
sudo apt update
sudo apt install -y docker.io
✅ Screenshot:

4. Enable Docker Service
Enable Docker to start automatically:

bash
sudo systemctl enable docker

Check Docker version:

bash
docker --version
✅ Screenshot:

5. Open Firewall on Google Cloud
Allow TCP ports needed for your app (80, 5000, 3000) so services are accessible publicly.

✅ Screenshot:

6. Pull Images from Docker Hub
Pull backend and frontend images onto the VM:

bash
sudo docker pull ofermo/devopscourse-backend:latest
sudo docker pull ofermo/devopscourse-frontend:latest
✅ Screenshot:

7. Run Containers on VM
Option A — Run Standalone
(Requires adjusting nginx.conf in frontend to point to external backend IP)

bash
sudo docker run -d -p 5000:5000 --name backend ofermo/devopscourse-backend:latest
sudo docker run -d -p 3000:80 --name frontend ofermo/devopscourse-frontend:latest
✅ Screenshot:

Option B — Run in Same Docker Network
Create a Docker network so that frontend can reach backend via hostname backend.

Steps:

bash
sudo docker rm -f frontend backend
sudo docker network create devops-network
sudo docker run -d --name backend --network devops-network -p 5000:5000 ofermo/devopscourse-backend:latest
sudo docker run -d --name frontend --network devops-network -p 3000:80 ofermo/devopscourse-frontend:latest
✅ Screenshot:

8. Verify Backend Works
Check backend directly:

bash
curl http://localhost:5000/api/notes
✅ Screenshot (Terminal):

✅ Screenshot (Browser):

9. Verify Frontend Works
Navigate in browser: http://35.184.209.216:3000/
✅ Screenshot (Terminal):
```
