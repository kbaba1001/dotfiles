#!/bin/sh

change_hash_notation() {
  file_type=$1
  printf "$file_type...    "
  for file in `find . -name "$file_type"`
    do
      perl -pi -e 's/([^\w^:]):([\w\d_]+)\s*=>/\1\2:/g' $file
    done
  echo "Done!"
}

if test $# -ge 1 ; then
  for file_type in $@
    do
      change_hash_notation "$file_type"
    done
else
  change_hash_notation "Gemfile"
  change_hash_notation "*.rb"
  change_hash_notation "*.haml"
  change_hash_notation "*.rake"
fi
