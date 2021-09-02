#!/bin/sh
upload_response=$(appcenter distribute release --token ${INPUT_TOKEN} -f ${INPUT_FILE} --output json --group ${INPUT_GROUP:-Collaborators} --app ${INPUT_OWNER}/${INPUT_APP} --release-notes-file ${INPUT_NOTES})

echo "::debug::response $upload_response"

release_id=$(echo "$upload_response" | jq -r '.id')
download_url=$(echo "$upload_response" | jq -r '.downloadUrl')
install_url=$(echo "$upload_response" | jq -r '.installUrl')
release_url="https://appcenter.ms/orgs/${INPUT_OWNER}/apps/${INPUT_APP}/distribute/releases/${release_id}"

echo "::debug::install-ur=$install_url"
echo "::debug::download-url=$download_url"

echo "::set-output name=release-id::$release_id"
echo "::set-output name=release-url::$release_url"
echo "::set-output name=download-url::$download_url"
echo "::set-output name=install-url::$install_url"
