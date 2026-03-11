{{ template "chart.header" . }}
{{ template "chart.description" . }}

## Usage

### Directly

```yaml
---
# yaml-language-server: $schema=https://henrywhitaker3.github.io/generic-helm-chart/values.schema.json
# fill in values here
```

```sh
helm install example oci://ghcr.io/henrywhitaker3/generic --version {{ template "chart.version" . }}
```

### Sub-chart

```yaml
---
# yaml-language-server: $schema=https://henrywhitaker3.github.io/generic-helm-chart/subchart.schema.json
generic:
  # fill in values here
```
