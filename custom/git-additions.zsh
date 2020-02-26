gtidy() {
  git branch --no-contains master --format='%(refname:short)' --merged | xargs -n 1 git branch -d
}
