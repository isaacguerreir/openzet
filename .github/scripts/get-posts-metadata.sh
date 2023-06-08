posts=$GITHUB_WORKSPACE/cards/**/README.md 
out_folder=$GITHUB_WORKSPACE/out

touch $out_folder/names
touch $out_folder/paths
touch $out_folder/data

postnames=$(ls $posts | xargs -I {} bash -c "head -n1 {} | cut -c3-" > $out_folder/names) 
metadata=$(ls $posts | xargs -I {} bash -c "git --no-pager log --format='%ci#{}#' -- '{}'" > $out_folder/paths)

paste -d '' $out_folder/paths $out_folder/names > $out_folder/data
cat $out_folder/data | sort -r | awk -F'#' '{print substr($1, 0, 19) " " "[" $3 "]" "(" $2  ")"}' > $GITHUB_WORKSPACE/README.md
