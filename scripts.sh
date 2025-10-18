

echo $XDG_DATA_DIRS    | tr ':' '\n' | sort | uniq -c
echo "||||"


echo $XDG_DATA_DIRS 
export XDG_DATA_DIRS=$(echo $XDG_DATA_DIRS | tr ':' '\n' | sort | uniq | tr '\n' ':')
echo "||||"
echo $XDG_DATA_DIRS


printenv | while IFS= read -r line; do
  duplicates=$(echo "$line" | cut -d= -f2- | tr ':' '\n' | sort | uniq -d)
  if [[ -n $duplicates ]]; then
    echo $line    | tr ':' '\n' | sort | uniq -c
    echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||"
  fi
done