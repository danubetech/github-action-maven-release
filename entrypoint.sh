#!/usr/bin/env sh

echo "Substitute single server file."
envsubst < /settings.template.xml > /settings.xml

cd "$INPUT_PATH_TO_POM" || exit
mvn release:clean \
    release:prepare \
    -Dusername="$GITHUB_TOKEN" \
    release:perform \
    -DreleaseVersion="$INPUT_RELEASE_VERSION" \
    -DdevelopmentVersion="$INPUT_DEVELOPMENT_VERSION" \
    -Dtag="$INPUT_TAG" --settings /settings.xml