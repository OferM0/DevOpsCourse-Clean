# DevOps Course — Exercise 1, Docker locally

## ✅ Backend

### Dockerfile

Located at: `backend/Dockerfile`

---

## ✅ Frontend

### Dockerfile

Located at: `frontend/Dockerfile`

### Nginx Config

Located at: `frontend/nginx.conf`

---

## ✅ Build and Run Individually

```bash
# Build backend
docker build -t devopscourse-backend ./backend

# Run backend
docker run -d -p 5000:5000 --name devopscourse-backend devopscourse-backend

# Test backend
curl http://localhost:5000/api/notes

# Build frontend
docker build -t devopscourse-frontend ./frontend

# Run frontend
docker run -d -p 3000:80 --name devopscourse-frontend devopscourse-frontend

# Access frontend
http://localhost:3000
```

---

## ✅ Docker Compose

### docker-compose.yml

Located in project root.

Run all services:

```bash
docker compose up -d
```

Stop services:

```bash
docker compose down
```

Check running containers:

```bash
docker compose ps
```

## ✅ Push Images to Docker Hub

Replace `username` with your Docker Hub username.

```bash
docker login

docker tag devopscourse-backend username/devopscourse-backend:latest
docker tag devopscourse-frontend username/devopscourse-frontend:latest

docker push username/devopscourse-backend:latest
docker push username/devopscourse-frontend:latest
```

---

## ✅ Pull Images from Docker Hub

Remove local images:

```bash
docker rmi username/devopscourse-backend:latest
docker rmi username/devopscourse-frontend:latest
```

Pull images:

```bash
docker pull username/devopscourse-backend:latest
docker pull username/devopscourse-frontend:latest
```

Run pulled images:

```bash
docker run -d -p 5000:5000 --name pulled-backend username/devopscourse-backend:latest
docker run -d -p 3000:80 --name pulled-frontend username/devopscourse-frontend:latest
```

---

## ✅ Optional: Push Script

**`push-images.bat`**

```bat
@echo off
set USERNAME='...'
set BACKEND_NAME=devopscourse-backend
set FRONTEND_NAME=devopscourse-frontend
set TAG=latest

docker login
docker build -t %BACKEND_NAME% ./backend
docker build -t %FRONTEND_NAME% ./frontend
docker tag %BACKEND_NAME% %USERNAME%/%BACKEND_NAME%:%TAG%
docker tag %FRONTEND_NAME% %USERNAME%/%FRONTEND_NAME%:%TAG%
docker push %USERNAME%/%BACKEND_NAME%:%TAG%
docker push %USERNAME%/%FRONTEND_NAME%:%TAG%
echo Done!
```
