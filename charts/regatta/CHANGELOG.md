# Changelog

## v0.2.0

### Improvements

* Support of v0.2.x series of Regatta
* Support for securityContext settings
* Support for constraining temp usage


### Bugfixes

* Fixes the initialMembers setting when installing into namespace different from regatta.

## v0.1.5

### Improvements

* Added CHANGELOG.md.
* Added support for PodDisruptionBudget policy/v1

## v0.1.4

### Improvements

* Added auto-generated documentation.
* Exposed flags `raft.maxInMemLogSize`, `raft.maxRecvQueueSize`, and `raft.maxSendQueueSize`.

### Bugfixes

* Fixed default image tag.

## v0.1.3

### Bugfixes

* Fixed the `spec.jobLabel` and `spec.selector.matchLabels` in the service monitor object.

## v0.1.2

### Breaking changes

* Removed `Values.kafka.*` values and flags.

## v0.1.1

### Bugfixes

* Changed the type of `Values.api.externalLoadBalancer.loadBalancerSourceRanges` to a list.

## v0.1.0

This is the initial release of Regatta Helm Chart.
