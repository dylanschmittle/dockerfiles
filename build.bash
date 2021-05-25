#!/bin/bash
echo "Building Everything that starts with Dockerfile using buildah, Extensions Will Be Used to tag each image"
file_list=()
while IFS= read -d $'\0' -r file ; do
    file_list=("${file_list[@]}" "$file")
done < <(find . -name "Dockerfile*" -print0)
for f in ${file_list[@]}; do
  img=$(echo ${f} | cut -d'.' -f3)
  buildah bud --squash -f Dockerfile.${img} -t ${img}:latest .
done;


