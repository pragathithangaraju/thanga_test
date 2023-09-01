
script_path=$(dirname $0)
env=$1
aws_region=$2

while read i; do
    i=$(dirname "${i}")
    echo "Copy ${org_bck} to ${i}"
    filename=$(basename "${i}")
    cat <<EOF>"${i}/test.tf"
data "terraform_remote_state" "pipeline1" {
  backend="s3" 
  config = {
    bucket = "testdev1"
    key = "backend/folder1/${env}/${filename}.tfsate"
    region = "${aws_region}"
    
  }
} 
EOF


done < <(find ${script_path}/Pipelines  -mindepth 1  -type f -name 'main.tf')
