# generic

A generic Helm chart for Kubernetes deployments

## Usage

### Directly

```yaml
---
# yaml-language-server: $schema=https://henrywhitaker3.github.io/generic-helm-chart/values.schema.json
# fill in values here
```

```sh
helm install example oci://ghcr.io/henrywhitaker3/generic --version 1.4.3
```

### Sub-chart

```yaml
---
# yaml-language-server: $schema=https://henrywhitaker3.github.io/generic-helm-chart/subchart.schema.json
generic:
  # fill in values here
```

```sh
helm install example oci://ghcr.io/henrywhitaker3/generic --version 1.4.3
```
