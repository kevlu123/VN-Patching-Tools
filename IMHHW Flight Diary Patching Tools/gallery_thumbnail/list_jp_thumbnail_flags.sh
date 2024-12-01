this_dir=$(dirname $0)
for f in $this_dir/thumbnail_flags/*.json; do
    echo $f
    grep -E 'SetFlag",    "args":\[1(0[89]|1[0-5])' $f | sort -u | awk -F '[\\[,]'  '{print $3}'
done
