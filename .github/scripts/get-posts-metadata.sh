posts=$GITHUB_WORKSPACE/cards/**/README.md 
out_folder=$GITHUB_WORKSPACE/out

postnames=$(ls $posts | xargs -I {} bash -c "head -n1 {} | cut -c3-" > $out_folder/paths) 
metadata=$(ls $posts | xargs -I {} bash -c "git --no-pager log --format='%ci#{}#' -- '{}'" > $out_folder/names)

paste -d '' $out_folder/paths $out_folder/names > $out_folder/data
cat $out_folder/data | sort -r | awk -F'#' '{print substr($1, 0, 19) " " "[" $3 "]" "(" $2  ")"}' > $GITHUB_WORKSPACE/README.md




