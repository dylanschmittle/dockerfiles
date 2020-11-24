#!/bin/bash
file_list=()
while IFS= read -d $'\0' -r file ; do
    file_list=("${file_list[@]}" "$file")
done < <(find . -name "Dockerfile*" -print0)
docker login
for f in ${file_list[@]}; do
  img=$(echo ${f} | cut -d'.' -f3)

  buildah bud --squash -f Dockerfile.${img} -t docker.io/schmillin/${img}:latest .
  docker push docker.io/schmillin/${img} docker.io/schmillin/${img}
done

