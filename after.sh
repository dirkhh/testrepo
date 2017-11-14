
#!/bin/bash
RELEASE_NAME="continuous"
RELEASE_TITLE="Release for continuous"
BODY="Testin 1-2-3"
release_id=$(curl https://api.github.com/repos/dirkhh/testrepo/releases/tags/${RELEASE_NAME} | grep id: |grep "\"id\":" | head -n 1 | tr -s " " | cut -f 3 -d" " | cut -f 1 -d ",")
release_infos=$(curl -H "Authorization: token ${GITHUB_TOKEN}" --request PATCH \
       --data '{"tag_name": "'"$RELEASE_NAME"'","name": "'"$RELEASE_TITLE"'","body": "'"$BODY"'"}' "https://api.github.com/repos/dirkhh/testrepo/releases/${release_id}")
