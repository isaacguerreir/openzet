cd $GITHUB_WORKSPACE/out/zet
rm -rf $GITHUB_WORKSPACE/cards/*
cat relations/public | xargs -I {} cp '{}' $GITHUB_WORKSPACE/cards/
