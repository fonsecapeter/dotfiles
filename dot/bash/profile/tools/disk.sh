# disk space usage
function disk_unsorted {
  du -x -d1 -h $@
}
function disk_sorted {
  disk_unsorted | sort -hr
}
alias disk=disk_sorted
alias usage='df -h /'
