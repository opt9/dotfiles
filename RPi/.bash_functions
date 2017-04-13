function ahead_behind {
    curr_branch=$(git rev-parse --abbrev-ref HEAD);
    curr_remote=$(git config branch.$curr_branch.remote);
    curr_merge_branch=$(git config branch.$curr_branch.merge | cut -d / -f 3);
    git rev-list --left-right --count $curr_branch...$curr_remote/$curr_merge_branch | tr -s '\t' '|';
}

function cd() {
  # async() {
  #   {
  #     $2 $($1)
  #   }&
  # }

  # notify_callback() {
  #   [[ $1 > 0 ]] && echo "You have new stuff to pull!"
  # }

  # If it's a git repo, check if we need to pull.
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    # async "git rev-list HEAD...origin/master --count" notify_callback
    (( $(git rev-list HEAD..@{u} --count) > 0 )) && echo "There are new things to merge"
  fi
 
  builtin cd "$@"
}
