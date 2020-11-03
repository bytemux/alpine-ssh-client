## Usage in .gitlab-ci.yml:

```
image: bytemux/alpine-ssh-client
script:
 - echo "$DEPLOY_STAGING_PRIV_KEY" > ~/.ssh/id_rsa
 - ssh "$DEPLOY_HOST_USER@$DEPLOY_HOST_NAME "echo 'running some commands on host'"
```
