#!/bin/sh
file1="$1"
file2="$2"

if [ -z "$file1" ] || [ -z "$file2" ]; then
  echo 'Usage: hash-compare "/path/to/file/1" "/path/to/file/2"'
else
  echo "$(tput setaf 2; echo "==>") $(tput setaf 15; echo "SHA256:")"

  hash1=$(sha256sum "$file1" | awk '{print $1}')
  hash2=$(sha256sum "$file2" | awk '{print $1}')

  echo -e "$hash1 : $file1\n$hash2 : $file2\n"

  echo "$(tput setaf 2; echo "==>") $(tput setaf 15; echo "File sizes:")"
  tput setaf 11; echo -e "$(lsd -l --blocks size,name "$file1")\n$(lsd -l --blocks size,name "$file2")\n"

  if [ "$hash1" = "$hash2" ]; then
    echo "$(tput setaf 2; echo "==>") $(tput setaf 10; echo " Files match ")"
  else
    echo "$(tput setaf 2; echo "==>") $(tput setab 9; tput setaf 0; echo " Files differ ")"
  fi

fi
