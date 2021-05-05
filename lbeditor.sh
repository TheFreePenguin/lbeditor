touch $1

function save() {
    rm $1
    touch $1
    for i in $1
    do
        cat $i >> $1
    done
}

function leave() {
    cd ..
    echo "### Deleting temporary files..."
    exec rm -r lines
}

cat $1

echo "### Starting LBEditor..."
mkdir lines
cd lines

echo "### Preparing lines..."
for i in `cat $1`
do
touch $i
head -n $i $1 | tail -n 1 > $i
done

while true
do
echo "Which line do you want to edit? (type s to save and x to exit)"
read LINE
if [ $LINE = s ]
then
    save
elif [ $LINE = x ]
then
    leave
else
    echo "Current Line:"
    cat $LINE
    echo "Enter new line here."
    read NEWLINE
    echo "### Overwriting line..."
    echo $NEWLINE > $LINE
fi
done
