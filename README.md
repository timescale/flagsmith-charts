Flagsmith Charts
================

This is a forked version of the [official Flagsmith Helm chart] that we can
customize for our own use. In addition to the chart values found in the
[Flagsmith Helm chart documentation], we also can interpolate the following:

| Parameter                      | Description                                                 | Default |
|--------------------------------|-------------------------------------------------------------|---------|
| `service.api.annotations`      | The annotations applied to the `flagsmith-api` Service      | `{}`    |
| `service.frontend.annotations` | The annotations applied to the `flagsmith-frontend` Service | `{}`    |

### Usage

Add this repository using:

```bash
helm repo add timescale-flagsmith https://raw.githubusercontent.com/timescale/flagsmith-charts/master/charts/repo
```

Or by adding the following into `helmfile.yaml`:

```yaml
repositories:
  # ...
  - name: timescale-flagsmith
    url: https://raw.githubusercontent.com/timescale/flagsmith-charts/master/charts/repo
```

[official Flagsmith Helm chart]: https://github.com/Flagsmith/flagsmith-charts
[Flagsmith Helm chart documentation]: https://docs.flagsmith.com/deployment/kubernetes
