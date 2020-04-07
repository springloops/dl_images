# docker image

mxnet/python:nightly_gpu_cu101_mkl_py3 를 기반으로 다음 모듈을 추가한 이미지 입니다.

- jupyterlab
- matplotlib
- numpy
- scipy
- pandas
- sympy
- nose
- colored
- scikit-learn


교재 Dive into Deep Learning의 jupyter notebook 이`/mxnet/d2l-en` 에  포함되어 있습니다.


개발 중 필요한 모듈이 있다면 pip 를 통해 설치하실 바랍니다.


## 실행방법

```
docker run --runtime=nvidia -d --rm \
           --gpus '"device=${GPU}"' \ 
		   -v $(realpath ${LOCATION}):/mxnet/d2l-en \
		   -p ${PORT}:8888 \
		   springloops:mxnet
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
