# Kubernetes - Scheduling

In this post we'll explore how Kubernetes schedules pods.

## Scheduler

* https://github.com/GoogleCloudPlatform/kubernetes/blob/master/pkg/scheduler/scheduler.go

* https://github.com/GoogleCloudPlatform/kubernetes/blob/master/pkg/scheduler/generic_scheduler.go

* https://github.com/GoogleCloudPlatform/kubernetes/blob/master/pkg/scheduler/types.go#L49 -- PriorityFunction (impl: CalculateSpreadPriority)

* https://github.com/GoogleCloudPlatform/kubernetes/blob/master/plugin/pkg/scheduler/scheduler.go#L69
  * nextPod and fire events

## Predicates

    