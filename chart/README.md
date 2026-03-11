# generic

![Version: 1.4.1](https://img.shields.io/badge/Version-1.4.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

A generic Helm chart for Kubernetes deployments

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalPorts | list | `[]` | Specify any addtional ports on the container |
| affinity | object | `{}` |  |
| config | object | `{}` | Specify any values to add to the configmap |
| deploymentStrategy.type | string | `"RollingUpdate"` |  |
| entrypoint | object | `{"args":[],"command":[]}` | Override the entrypoint and args |
| env | list | `[]` | Specify any extra env fields |
| extraContainers | list | `[]` | Specify any extra container in the pod |
| httpRoute | object | `{"annotations":{},"enabled":false,"hostnames":[],"labels":{},"parentRefs":[],"rules":[{"matches":[{"path":{"type":"Prefix","value":"/"}}],"port":"http"}]}` | Configure HTTPRoute resources for the service |
| httpRoute.hostnames | list | `[]` | The hostnames the route listens on |
| image | object | `{"pullPolicy":"IfNotPresent","repository":"nginx","tag":"","token":""}` | Configure the image used by the deployment |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| image.token | string | `""` | Specify an optional secret with the registry authentication token |
| ingress | object | `{"annotations":{"kubernetes.io/tls-acme":"true"},"className":"nginx","enabled":false,"hosts":[],"tls":[]}` | Configure Ingress resources for the service |
| ingress.className | string | `"nginx"` | Specify the className of the ingress |
| ingress.enabled | bool | `false` | Specify whether to enable the ingress |
| initContainers | list | `[]` | Specify any initContainer for the pod |
| jobs | list | `[]` |  |
| metrics | object | `{"enabled":false,"honorLabels":false,"interval":"60s","path":"/metrics","port":"http","timeout":"30s"}` | Setup ServiceMonitors for the deployment |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| probes | object | `{"enabled":true,"failureThreshold":1,"initialDelaySeconds":0,"options":{"path":"/","port":"http"},"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1,"type":"httpGet"}` | Configure probes for the deployment |
| probes.enabled | bool | `true` | Specifies whether or not to add probes to the deployment |
| probes.options | object | `{"path":"/","port":"http"}` | Configure options for the probe kind |
| probes.type | string | `"httpGet"` | Specify the probe type |
| pvc.accessModes | list | `["ReadWriteOnce"]` | Specify the access modes for the pvc |
| pvc.enabled | bool | `false` | Specifies whether to create a PVC |
| pvc.mountPath | string | `"/data"` | Specify the path in the container to mount the pvc |
| pvc.size | string | `"1Gi"` | Specify the size of the PVC |
| pvc.storageClassName | string | `"smb"` | Specify the storageclass of the pvc |
| replicaCount | int | `1` | The number of replicas of the deployment |
| resources | object | `{}` |  |
| secrets | object | `{"enabled":false,"key":"","secretStoreRef":{"kind":"ClusterSecretStore","name":"onepassword-connect"}}` | The external-secrets item |
| secrets.enabled | bool | `false` | Specify whether to create an external-secrets item |
| secrets.key | string | `""` | Specify the key external-secrets shoudl pull data form |
| securityContext | object | `{}` |  |
| service | object | `{"additionalPorts":[],"enabled":true,"loadBalancer":{"enabled":false,"externalTrafficPolicy":"Cluster","ip":""},"port":80,"portName":"http","type":"ClusterIP"}` | Configure the service |
| service.additionalPorts | list | `[]` | Specify any additional ports for the service |
| service.enabled | bool | `true` | Specifies whether or not to create a service |
| service.loadBalancer | object | `{"enabled":false,"externalTrafficPolicy":"Cluster","ip":""}` | Optionally configure properties for an additional LoadBalancer service |
| service.loadBalancer.enabled | bool | `false` | Specifies whether to create an additional service with type LoadBalancer |
| service.loadBalancer.externalTrafficPolicy | string | `"Cluster"` | Specify the externalTrafficPolicy of the service |
| service.port | int | `80` | Specifies the port of the service |
| service.portName | string | `"http"` | Specifies the name of the port |
| service.type | string | `"ClusterIP"` | Specifies the type of the service |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` | Specify any additional volume mounts |
| volumes | list | `[]` | Specify any additional volumes |
| vpn | object | `{"enabled":false,"env":[{"name":"PUID","value":"911"},{"name":"PGID","value":"911"}],"image":{"pullPolicy":"Always","repository":"linuxserver/wireguard","tag":"latest"},"probes":{"enabled":true,"exec":["sh","-c","curl https://am.i.mullvad.net/connected | grep \"You are connected\""]},"script":"echo Copying config file to shared volume\ncp /wg/wg0.conf /config/wg0.conf\n","secret":{"enabled":true,"key":"wg0.conf","mount":{"enabled":true,"path":"/config/wg_confs"},"secretStoreRef":{"kind":"ClusterSecretStore","name":"onepassword-connect"}},"securityContext":{"capabilities":{"add":["NET_ADMIN"]},"privileged":true}}` | Add a sidecar that connects to a wireguard vpn and routes pod traffic through it |
| vpn.enabled | bool | `false` | Specify whether to enable a VPN sidecar |
| vpn.script | string | `"echo Copying config file to shared volume\ncp /wg/wg0.conf /config/wg0.conf\n"` | Scripts to run to copy over the wirguard config |
| vpn.secret | object | `{"enabled":true,"key":"wg0.conf","mount":{"enabled":true,"path":"/config/wg_confs"},"secretStoreRef":{"kind":"ClusterSecretStore","name":"onepassword-connect"}}` | external-secrets config for the wireguard secret |
| vpn.secret.key | string | `"wg0.conf"` | The key external secrets uses to pull in the wireguard configs |
| vpn.secret.mount.enabled | bool | `true` | Specify whether to mount the secret in to container |
| vpn.secret.mount.path | string | `"/config/wg_confs"` | Specify the path to mount the secret to |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
