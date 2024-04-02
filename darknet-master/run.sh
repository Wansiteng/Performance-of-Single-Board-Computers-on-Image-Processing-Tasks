#!/bin/bash

IMAGE_DIR="/media/edison/SanDisk/SmallPic"
CONFIG_PATH="cfg/yolov4.cfg"
WEIGHTS_PATH="yolov4.weights"
DATA_PATH="cfg/coco.data"
LOG_FOLDER="/media/edison/Sandisk/darknet-master/log"
count=0

for image in $(find ${IMAGE_DIR} -name "*.jpg"); do
	if [ $count -ge 200 ]; then
		break
	fi

	if [[ $image == *._* ]]; then
		continue
	fi

	massif_out="massif_out_${count}.txt"

	valgrind --tool=massif --massif-out-file=${massif_out} ./darknet detector test ${DATA_PATH} ${CONFIG_PATH} ${WEIGHTS_PATH} ${image}

	ms_print ${massif_out} > "readable_${massif_out}"

	((count++))

done

echo "processed $count images."
