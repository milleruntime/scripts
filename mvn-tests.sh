# Run this script in git directory
# It will pull out any Tests that have
#  changed in your workspace (but not committed)
#  and run just those tests

DIFF=`git diff --cached --name-only`
if [ -z "$DIFF" ] 
then
   DIFF=`git diff --name-only`
fi
if [ -z "$DIFF" ]
then
   echo "No files to test"
   exit 1
fi

echo "$DIFF" > tmp
cat tmp | while read -r line ; do
  T="$(basename $line .java)"
  if [[ $T == *"Test"* ]]
  then
     printf "$T," >> tmp2
  fi
done

rm tmp
TESTS=`cat tmp2`
rm tmp2
echo "Running tests $TESTS"
mvn test -Dtest="$TESTS"
