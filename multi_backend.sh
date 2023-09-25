#!/bin/env bash

script_path=$(dirname $0)

while read i; do
    i=$(basename "${i}")
    for env in dev qa1 prod; do
        tgt_dir=${script_path}/Src/infra/${env}
        if [ -d "${tgt_dir}/${i}" ]; then
            continue 1
        fi

        mkdir -p ${tgt_dir}/${i}
        source ${tgt_dir}/${env}.conf
       # cat ${tgt_dir}/${env}.tmpl >  "${tgt_dir}/${i}/templCp.tf"
        exit 1
        # cp {}  
        cat <<EOF>"${tgt_dir}/${i}/main.tf"
data "terraform_remote_state" "pipeline1" {
  backend="s3" 
  config = {
    bucket = "testdev1"
    key = "backend/folder1/${env}/${filename}.tfsate"
    region = "${aws_region}"
  }
} 
EOF

        cat <<EOF>"${tgt_dir}/${i}/provider.tf"
data "terraform_remote_state" "pipeline1" {
  backend="s3" 
  config = {
    bucket = "testdev1"
    key = "backend/folder1/${env}/${filename}.tfsate"
    region = "${aws_region}"
  }
} 
EOF

        cat <<EOF>"${tgt_dir}/${i}/backend.tf"
data "terraform_remote_state" "pipeline1" {
  backend="s3" 
  config = {
    bucket = "testdev1"
    key = "backend/folder1/${env}/${filename}.tfsate"
    region = "${aws_region}"
  }
} 
EOF

        cat <<EOF>"${tgt_dir}/${i}/variables.tf"
data "terraform_remote_state" "pipeline1" {
  backend="s3" 
  config = {
    bucket = "testdev1"
    key = "backend/folder1/${env}/${filename}.tfsate"
    region = "${aws_region}"
  }
} 
EOF
    done
done < <(find ${script_path}/Src/Pipelines  -mindepth 1 -mindepth 1 -type d)