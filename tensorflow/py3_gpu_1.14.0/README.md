# docker image

tensorflow/tensorflow:1.14.0-gpu-py3 를 기반으로 다음 모듈을 추가한 이미지 입니다.

- tensorflow-gpu
- scipy
- numpy 
- scipy 
- pandas 
- sympy 
- nose 
- colored 
- scikit-learn
- matplotlib 
- jupyterlab



개발 중 필요한 모듈이 있다면 pip 를 통해 설치하실 바랍니다.


## 실행방법

```
docker run --runtime=nvidia -d --rm \
           --gpus '"device=${GPU}"' \ 
		   -v $(realpath ~/notebooks/${LOCATION}):/tf/notebooks \
		   -p ${PORT}:8888 \
		   --name ${CONTAINER_NAME} \
		   mytensorflow:base
```

## How to get jupyterlab access token
```
container_name=gpu-py3-jupyter
CONTAINER_ID=$(docker ps -aqf "name=${container_name}")

JS=$(docker exec -t ${CONTAINER_ID} jupyter notebook list --json)
TOKEN=$(echo $JS | jq -r .token)

JT_URL="http://ground:8888/?token=$TOKEN"

echo 'go to jupyter'
echo $JT_URL
```
