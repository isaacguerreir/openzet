cd $GITHUB_WORKSPACE/out/zet
rm -rf $GITHUB_WORKSPACE/cards/*
cat relations/public | xargs -I {} cp --parents '{}' $GITHUB_WORKSPACE
