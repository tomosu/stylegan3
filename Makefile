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
			--gpus=2 --batch=32 --batch-gpu=4 --gamma=32 --mirror=1 --aug=noaug --snap=1