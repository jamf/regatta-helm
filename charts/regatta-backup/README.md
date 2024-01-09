# regatta-backup

![Version: 0.4.0](https://img.shields.io/badge/Version-0.4.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.4.0](https://img.shields.io/badge/AppVersion-0.4.0-informational?style=flat-square)

Regatta is a distributed key-value store. Regatta is designed as easy to deploy, kubernetes friendly with emphasis
on high read throughput and low operational cost. Purpose of regatta-backup is as the name suggest backup Regatta store into configurable sink at periodic interval.

**Homepage:** <https://engineering.jamf.com/regatta>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| coufalja |  |  |
| jsfpdn |  |  |

## Requirements

Kubernetes: `>= 1.21.0`

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalPodLabels | object | `{}` | additionalPodLabels: Optional map of additional pod labels |
| failedJobsHistoryLimit | int | `2` | failedJobsHistoryLimit: CronJob config field |
| fullnameOverride | string | `""` | fullnameOverride: String to fully override `"regatta-backup.fullname"` |
| nameOverride | string | `""` | nameOverride: Provide a name in place of `regatta`. |
| nodeSelector | object | `{}` | nodeSelector: Map of nodeSelector labels for the Regatta pods # ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#nodeselector |
| podAnnotations | object | `{}` | podAnnotations: Optional map of pod annotations |
| podAntiAffinity.enabled | bool | `false` | enabled: Enable or disable the pod anti-affinity |
| podAntiAffinity.topologyKey | string | `"kubernetes.io/hostname"` | topologyKey: Use to override the topologyKey value |
| podSecurityContext | object | `{"fsGroup":1000,"fsGroupChangePolicy":"OnRootMismatch","runAsGroup":1000,"runAsUser":1000}` | podSecurityContext: The full content of the spec.securityContext |
| priorityClassName | string | `""` | priorityClassName: Defines the priorityClassName of the Regatta pods.   Leave empty string if you don't want to use this feature. # ref: https://kubernetes.io/docs/concepts/scheduling-eviction/pod-priority-preemption/ |
| schedule | string | `"0 */4 * * *"` | schedule: Cron expression defining how often the backup is executed |
| securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false}` | securityContext: The full content of the container.securityContext |
| serviceAccount.create | bool | `true` | create: Create the ServiceAccount for regatta |
| serviceAccount.name | string | `""` | name: ServiceAccount name override, default: `"regatta-backup.fullname"` |
| sink | object | `{"bucket":"s3-bucket-name","image":{"imagePullPolicy":"IfNotPresent","repository":"peakcom/s5cmd","tag":"v2.2.2"},"resources":{"limits":{"cpu":"1","memory":"256Mi"},"requests":{"cpu":"200m","memory":"128Mi"}}}` | sink: Sink container configuration |
| sink.bucket | string | `"s3-bucket-name"` | bucket: Address of the s3 bucket where to upload backup |
| sink.image | object | `{"imagePullPolicy":"IfNotPresent","repository":"peakcom/s5cmd","tag":"v2.2.2"}` | image: S3 backup tool image override. |
| sink.image.imagePullPolicy | string | `"IfNotPresent"` | imagePullPolicy: ref: https://kubernetes.io/docs/concepts/containers/images/#image-pull-policy |
| sink.resources | object | `{"limits":{"cpu":"1","memory":"256Mi"},"requests":{"cpu":"200m","memory":"128Mi"}}` | resources: Define the resources of the container |
| source | object | `{"address":"regatta-api:8443","ca":{"secretKind":"none","value":"secret-token"},"image":{"imagePullPolicy":"IfNotPresent","repository":"ghcr.io/jamf/regatta","tag":"v0.4.0"},"resources":{"limits":{"cpu":"1","memory":"1Gi"},"requests":{"cpu":"200m","memory":"512Mi"}},"token":{"secretKind":"none","value":"secret-token"}}` | source: Source container configuration. |
| source.address | string | `"regatta-api:8443"` | address: Regatta API server address. |
| source.ca | object | `{"secretKind":"none","value":"secret-token"}` | ca:   Depending on value of `secretKind`     - sealedSecret: enter the encrypted value     - plaintext: enter the plaintext secret value     - none: the field is ignored     - ref: the reference to existing token |
| source.ca.secretKind | string | `"none"` | secretKind:   May be one of:   - sealedSecret: Use if you have SealedSecrets support on your cluster. (https://sealed-secrets.netlify.app/)   - plaintext: Use to create Opaque Secret from the plaintext.   - ref: Use to reference token from existing secret.   - none: Do not create the secret with the token at all. The secret must be provided externally.      Secret example:         apiVersion: v1        kind: Secret        metadata:          name: regatta-backup-api-cert        data:          token: c2VjcmV0LXRva2Vu  |
| source.ca.value | string | `"secret-token"` | value:   Based on the secretKind it may be literal token, the SealedSecret to create or a reference to existing secret. |
| source.image.imagePullPolicy | string | `"IfNotPresent"` | imagePullPolicy: ref: https://kubernetes.io/docs/concepts/containers/images/#image-pull-policy |
| source.image.repository | string | `"ghcr.io/jamf/regatta"` | repository: Default image repository |
| source.image.tag | string | `"v0.4.0"` | tag: Override to use different image version |
| source.resources | object | `{"limits":{"cpu":"1","memory":"1Gi"},"requests":{"cpu":"200m","memory":"512Mi"}}` | resources: Define the resources of the container |
| source.token | object | `{"secretKind":"none","value":"secret-token"}` | token:   Depending on value of `secretKind`     - sealedSecret: enter the encrypted value     - plaintext: enter the plaintext secret value     - none: the field is ignored     - ref: the reference to existing token |
| source.token.secretKind | string | `"none"` | secretKind:   May be one of:   - sealedSecret: Use if you have SealedSecrets support on your cluster. (https://sealed-secrets.netlify.app/)   - plaintext: Use to create Opaque Secret from the plaintext.   - ref: Use to reference token from existing secret.   - none: Do not create the secret with the token at all. The secret must be provided externally.      Secret example:         apiVersion: v1        kind: Secret        metadata:          name: regatta-backup-maintenance-token        data:          token: c2VjcmV0LXRva2Vu  |
| source.token.value | string | `"secret-token"` | value:   Based on the secretKind it may be literal token, the SealedSecret to create or a reference to existing secret. |
| successfulJobsHistoryLimit | int | `4` | successfulJobsHistoryLimit: CronJob config field |
| tolerations | list | `[]` | tolerations: Defines tolerations for the Regatta pods # ref: https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/ |
| workdir | object | `{}` | workdir: Could be used to set specifics about backup job workdir, by default emptyDir is used. For larger backups ephemeralVolume should be considered. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.12.0](https://github.com/norwoodj/helm-docs/releases/v1.12.0)
