CPATH='.;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar'




rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'
cd student-submission


if [[ -f ListExamples.java ]]
then
   echo 'ListExamples Found'
else
   echo 'Need file ListExamples'
   exit 1
fi
mkdir lib
cp -R ../lib .
cp ../TestListExamples.java .


javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java 2>erroroutput.txt
if [[ $(wc -l < erroroutput.txt) -ne 0 ]]
then
   echo 'Your file did not compile'
   exit 1
fi
java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples > results.txt




if grep -q OK "results.txt";
then
    echo "100 percent"
else
   echo 'Did not pass all tests'
fi
