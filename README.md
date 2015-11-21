
- Receive release
 - Wait until no more pending releases
 - Build the application image
  - Create k8s job with using builder
  - GH status -> build
  - Posts resultant image to docker registry
  - Create pod definition for the release
   - Use generated image in docker registry
   - Deploy pod somewhere / somehow

- Receive PR
 - For each validation task do:
  - Create k8s job
  - GH status -> [running X]

- Convert tasks into Dockerfiles
- Build tasks into images

Image based on the base image given in the yml file PLUS custom entrypoint:

```sh
#!/bin/sh
# run.sh

set -euf -o pipefail

git clone therepo
git checkout thebranch

{forall pre}
precmds

{forall cmds}
cmds

{forall post}
postcmds

```

# Deploy

Deploy any `next` service.

```sh

```

add orgs to deis integrate w/ github etc
https://github.com/deis/deis/blob/master/controller/api/models.py

normalize errors:
http://docs.fluentd.org/articles/plugin-development#filter-plugins
https://github.com/maccman/sourcemap


https://github.com/docker/distribution/blob/master/docs/deploying.md

http://jenkins.feops.walmartlabs.com:8080/job/GD_Atlas_Common_PR_Verify/5864/injectedEnvVars/

https://github.com/psi-4ward/docker-etcd-registrator
https://github.com/flynn/flynn/blob/master/slugbuilder/builder/build.sh
https://www.digitalocean.com/community/tutorials/how-to-use-confd-and-etcd-to-dynamically-reconfigure-services-in-coreos

http://unix.stackexchange.com/questions/103461/get-common-name-cn-from-ssl-certificate
https://github.com/inokappa/fluent-plugin-haproxy_stats
http://www.fluentd.org/guides/recipes/haproxy-elasticsearch
http://www.haproxy.org/download/1.4/doc/configuration.txt
https://gist.github.com/GABeech/eb88933bf49cd82ceab0
http://www.vagrantbox.es/
https://github.com/fangli/kibana-authentication-proxy
http://docs.ansible.com/ansible/haproxy_module.html
https://github.com/ansible/ansible-examples/blob/master/lamp_haproxy/rolling_update.yml
Hooks:
https://confluence.atlassian.com/jira/managing-webhooks-300814309.html
https://gecgithub01.walmart.com/organizations/next/settings/hooks/new
