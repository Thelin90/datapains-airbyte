# DataPains Airbyte

[Corresponding Youtube Tutorial](...)

# Pre Requisites

# Setup Helm Airbyte

First add the airbyte helm repo!

```bash
helm repo add airbyte https://airbytehq.github.io/helm-charts
```

```bash
helm search repo airbyte
```

Should give:

```bash
NAME                                    CHART VERSION   APP VERSION     DESCRIPTION                                       
airbyte/airbyte                         0.242.2         0.63.3          Helm chart to deploy airbyte                      
airbyte/airbyte-api-server              0.242.2         0.63.3          Helm chart to deploy airbyte-api-server           
airbyte/airbyte-bootloader              0.242.2         0.63.3          Helm chart to deploy airbyte-bootloader           
airbyte/airbyte-cron                    0.40.37         0.40.17         Helm chart to deploy airbyte-cron                 
airbyte/airbyte-workload-api-server     0.49.18         0.50.33         Helm chart to deploy airbyte-api-server           
airbyte/connector-builder-server        0.242.2         0.63.3          Helm chart to deploy airbyte-connector-builder-...
airbyte/cron                            0.242.2         0.63.3          Helm chart to deploy airbyte-cron                 
airbyte/keycloak                        0.242.2         0.63.3          Helm chart to deploy airbyte-keycloak             
airbyte/keycloak-setup                  0.242.2         0.63.3          Helm chart to deploy airbyte-keycloak-setup       
airbyte/metrics                         0.242.2         0.63.3          Helm chart to deploy airbyte-metrics              
airbyte/pod-sweeper                     0.242.2         0.63.3          Helm chart to deploy airbyte-pod-sweeper          
airbyte/server                          0.242.2         0.63.3          Helm chart to deploy airbyte-server               
airbyte/temporal                        0.242.2         0.63.3          Helm chart to deploy airbyte-temporal             
airbyte/webapp                          0.242.2         0.63.3          Helm chart to deploy airbyte-webapp               
airbyte/worker                          0.242.2         0.63.3          Helm chart to deploy airbyte-worker               
airbyte/workload-api                    0.50.3          0.50.35         Helm chart to deploy the workload-api service     
airbyte/workload-api-server             0.242.2         0.63.3          Helm chart to deploy the workload-api service     
airbyte/workload-launcher               0.242.2         0.63.3          Helm chart to deploy airbyte-workload-launcher   
```

# Setup Airbyte

## Local

### values.yaml

We use almost all the default values, they are grabbed from here: https://github.com/airbytehq/airbyte-platform/blob/main/charts/airbyte/values.yaml

The only thing I have done is to expose the airbyte web app locally via `NodePort`:

```yaml
  service:
    type: NodePort
    port: 80
    targetPort: 80
    nodePort: 32767
    annotations: {}
```

I also make sure resources are low for `jobs` to keep resources down as I run locally:

```yaml
  jobs:
    resources:
      limits:
        memory: 2Gi
        cpu: "0.2"

      requests:
        memory: 1Gi
        cpu: "0.1"
```

### Deploy

```bash
make deploy ENV=local CMD=install
```

### Upgrade Changes

```bash
make deploy ENV=local CMD=updgrade
```

### Delete

```bash
make delete
```

### Access UI

`UI` is now accessible via: [wwww.localhost:32767](wwww.localhost:32767)
