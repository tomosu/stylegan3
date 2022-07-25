dataset:
	docker run --gpus all -it --rm --user $(id -u):$(id -g) \
		-v `pwd`:/scratch --workdir /scratch -e HOME=/scratch \
		stylegan3 \
		python dataset_tool.py --source datasets/jpeg --dest datasets/prints.zip --resolution 1024x1024

train:
	docker run --gpus all -it --rm --user $(id -u):$(id -g) \
		-v `pwd`:/scratch --workdir /scratch -e HOME=/scratch --shm-size 50G\
		stylegan3 \
		python train.py --outdir=results --cfg=stylegan2 --data=datasets/prints.zip \
			--gpus=1 --batch=4 --gamma=10 --mirror=1 --aug=noaug