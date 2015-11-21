import yaml from 'js-yaml';
import fs from 'fs';

function normalize(entry) {

}

function runfile() {
  return `
    #!/bin/sh

    set -euf -o pipefail

    git clone --branch "$CI_BRANCH" --depth 50 .
    git checkout -qf "$CI_COMMIT"

    ${tasks.map(task => `
    ${task}
    `)}

    cp artifactA /artifacts/...
  `;
}

function dockerfile() {
  return `
    FROM ${image}
    MAINTAINER averice@walmart.com

    MKDIR /app

    COPY /run.sh

    VOLUME [ '/artifacts', '/cache' ]
    WORKDIR /app
    EXEC /run.sh
  `;
}

// Get document, or throw exception on error
try {
  var doc = yaml.safeLoad(fs.readFileSync('./.averice.yml', 'utf8'));
  console.log(doc);
} catch (e) {
  console.log(e);
}
