#!/bin/bash
echo "Input task number: "
read task

# the commit message must contain pattern "#task"
commits=$(git log dev --grep="#$task" --pretty=format:"%H")
list_files=""

for var in $commits; do
  iter=$(git diff-tree --no-commit-id --name-only -r "$var")
  list_files+=$iter
done

echo "!!!---all changed files in task $task---!!!"
echo "$list_files" | sort | uniq -u