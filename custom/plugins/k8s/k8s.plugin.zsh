() {
  KUBE_CTX=$(kubectl config current-context)
  export KUBE_CTX

  # set the chpwd helper
  if [ -z $chpwd_functions ]; then
    chpwd_functions+=("_kubectx")
    return
  fi

  for helper in $chpwd_functions; do
    if [[ $helper == "_kubectx" ]]; then
      return
    fi
  done

  chpwd_functions+=("_kubectx")
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

_kubectx() {

  local target=""

  if [ -f ../.kubectx ]; then
    target=$(cat ../.kubectx)
  fi

  if [ -f ./.kubectx ]; then
    target=$(cat ./.kubectx)
  fi

  if [ -z $target ]; then
    return 0
  fi

  if [[ $target == $KUBE_CTX ]]; then
    return 0
  fi

  kcluster $target
}
