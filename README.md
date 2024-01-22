# rancher1-webhook
Github Action for calling Rancher 1 webhook

## Inputs

### `host`
**Required** Rancher host (protocol and domain)

### `projectId`
**Required** Rancher project ID

### `key`
**Required** Webhook key in project

### `image`
**Required** Docker image to deploy

### `tag`
**Required** Docker tag of image to be deployed

### `extraHeaders`
**Optional** Additional headers to use in the Curl call. Value can be simple or multiline.

## Outputs

None

## Example usage

```yml
uses: pilou/rancher1-webhook@v1
with:  
    host: https://rancher-update.example.com
    projectId: abc123
    key: AbCdEfGhIjKlMnOpQrStUvWxYz0123456789
    image: alpine
    tag: stable
    extraHeaders: |
      foo: bar
      baz: bak
```
