touch $1

function save() {
    rm $1
    touch $1
    for i in `ls`
    do
        NUM=$(( NUM + 1 ))
        cat $NUM >> $1
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
NUM=$(( NUM + 1 ))
touch $NUM
head -n $NUM $1 | tail -n 1 > $NUM
done

while true
do
echo "Which line do you want to edit? (type s to save and x to exit)"
read LINE
if [ $LINE = s ]
then
    save $1
elif [ $LINE = x ]
then
    leave
else
    touch $LINE
    echo "Current Line:"
    cat $LINE
    echo "Enter new line here."
    read NEWLINE
    echo "### Overwriting line..."
    echo $NEWLINE > $LINE
fi
done
