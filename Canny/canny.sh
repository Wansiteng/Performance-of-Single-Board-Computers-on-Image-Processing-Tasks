#!/bin/bash

input_folder="/media/rock/SanDisk/SmallPic"
output_folder="/media/rock/SanDisk/Canny/canny_output"
log_folder="/media/rock/SanDisk/Canny/log"

count=0

for input_file in $(find ${input_folder} -name "*.bmp"); do
	filename=$(basename -- "$input_file")
	output_file="$output_folder/$filename"
	massif_out="${log_folder}/massif_out_${count}.txt"

	valgrind --tool=massif --massif-out-file=${massif_out} ./canny "$input_file" "$output_file" || { echo "Error processing file $input_file"; continue; }

	readable_massif_out_filename=$(basename -- "$massif_out")
	ms_print ${massif_out} > "${log_folder}/readable_${readable_massif_out_filename}"


	echo "Running canny for $input_file to $output_file"

	((count++))
done

echo "Finish."
