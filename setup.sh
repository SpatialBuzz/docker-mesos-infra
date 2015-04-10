vagrant up registry

pushd Docker/Nginx
docker build -t 192.168.1.119:5000/nginx .
docker push 192.168.1.119:5000/nginx
popd

pushd Docker/App  
docker build -t 192.168.1.119:5000/app .  
docker push 192.168.1.119:5000/app  
popd

vagrant up lb1 lb2
vagrant up mm1 mm2 mm3
vagrant up ms1
vagrant up ms2 ms3 ms4
vagrant status

pushd Docker/App  
APP_VERSION=latest APP_ENV=test ./deploy.sh  
popd

pushd Docker/App  
APP_VERSION=latest APP_ENV=production ./deploy.sh 
popd
