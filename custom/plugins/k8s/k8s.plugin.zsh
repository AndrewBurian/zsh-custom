() {
  KUBE_CTX=$(kubectl config current-context)
  export KUBE_CTX
}

k() {
  kubectl --context "${KUBE_CTX}" "$@"
}

kcluster() {
  if ! kubectl config get-contexts "$1" > /dev/null; then
    return 1
  fi
  KUBE_CTX=$1
  echo "Set context to $1"
}

kcurrent() {
  echo "${KUBE_CTX}"
}
