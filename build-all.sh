#!/bin/sh
# Cant Get Keyrings On Home internet, blocked by ISP
# sudo protonvpn -f c
docker login > /dev/null
if [[ -z $1 ]]; then
  for entry in "$PWD"/*
  do
    if [[ $entry != "$PWD/build-all.sh" && $entry != "$PWD/README.md" && $entry != "$PWD/scripts" ]]; then
      cd $entry
      ../scripts/build.sh schmillin &
      cd ..
    fi
  done
  exit 1
fi

for entry in "$PWD"/*
do
  if [[ $entry != "$PWD/build-all.sh" && $entry != "$PWD/README.md" && $entry != "$PWD/scripts" ]]; then
    cd $entry
    ../scripts/build.sh $1 &
    cd ..
  fi
done



