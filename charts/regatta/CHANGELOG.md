# Changelog
---
## v0.4.3

### Improvements
* Add support for extra templated manifests.
* Remove the "external" loadbalancer.
* Add additional options to Replication and Api service.

---
## v0.4.2

### Improvements
* Add support for NetworkPolicy.

---
## v0.4.1

### Improvements
* Bump to release image version.

---
## v0.4.0

### Improvements
* Compatibility with `v0.4.x` Regatta series.
* Extracted the backup cron into standalone chart.

---
## v0.3.2

### Improvements
* Add ability to specify different types of workdir for backup CronJob.

### Bugfixes
* Fix backup in rootless mode.

---
## v0.3.1

### Improvements
* Default to `v0.3.2` regatta.
* Fixed replication leader address parameter.

---
## v0.3.0

### Improvements
* Compatibility with `v0.3.x` Regatta series.
* Added ability to specify `podSecurityContext`.
* The container now start as rootless by default.

---
## v0.2.4

### Improvements
* When the replication is turned off on the leader its configuration is completely removed from the statefulset.

---
## v0.2.3

### Improvements
* Default image version changed to `v0.2.1`.
* Fix `replication.logCacheSize` parameter.

---
## v0.2.2

### Improvements
* Default image version changed to released version.
* Support for `raft.port` and `raft.snapshotRecoveryType` added.

---
## v0.2.1

### Improvements
* Added kubeVersion to Chart.yaml
* Added icon to Chart.yaml
* Added auto-generation of TLS certificates for better quickstart experience.

---
## v0.2.0

### Improvements
* Support of v0.2.x series of Regatta
* Support for securityContext settings
* Support for constraining temp usage

### Bugfixes
* Fixes the initialMembers setting when installing into namespace different from regatta.

---
## v0.1.5

### Improvements
* Added CHANGELOG.md.
* Added support for PodDisruptionBudget policy/v1

---
## v0.1.4

### Improvements
* Added auto-generated documentation.
* Exposed flags `raft.maxInMemLogSize`, `raft.maxRecvQueueSize`, and `raft.maxSendQueueSize`.

### Bugfixes
* Fixed default image tag.

---
## v0.1.3

### Bugfixes
* Fixed the `spec.jobLabel` and `spec.selector.matchLabels` in the service monitor object.

---
## v0.1.2

### Breaking changes
* Removed `Values.kafka.*` values and flags.

---
## v0.1.1

### Bugfixes
* Changed the type of `Values.api.externalLoadBalancer.loadBalancerSourceRanges` to a list.

---
## v0.1.0

This is the initial release of Regatta Helm Chart.
