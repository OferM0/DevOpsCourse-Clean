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