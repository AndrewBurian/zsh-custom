# K8s plugin

This plugin adds a few new commands and helpers for dealing with kubernets

## Multi-context support
The commands added by this plugin do not respect the current active context set in your `.kubeconfig` file.
Changes to the current context with `kubectl config use-context` will have no effect on these commands.

Instead, each session tracks its own current context with a `$KUBE_CTX` env var.

This is especially useful when you want to deal with different clusters in different sessions that all target one single `.kubeconfig` file.

## Auto context-switching
When you change to a directory, if either `.kubectx` or `../.kubectx` exists in that order, its contents will be interpreted as a context and will attempt to be switched to with the `kcluster` command.

This is useful if you have a directory of files for a single cluster or namespace, and always want to have that context active when working in that directory.

## Commands

`k` shorthand for `kubectl` and runs targetting the current context

`kcluster` switches the `$KUBE_CTX` env var to another valid context

`kcurrent` lists the current active context

## Internal Commands

`_kcontext` a helper for the auto context-switching
