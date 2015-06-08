#!/bin/bash

cat $input >> ar.txt

for i in {1..10}
do
./flip.sh v z ar.txt > ar2.txt
./flip.sh h y ar2.txt > ar.txt
./flip.sh p x ar.txt > ar2.txt
./flip.sh u w ar2.txt > ar.txt
./flip.sh z v ar.txt > ar2.txt
./flip.sh s u ar2.txt > ar.txt
./flip.sh f t ar.txt > ar2.txt
./flip.sh g s ar2.txt > ar.txt
./flip.sh x r ar.txt > ar2.txt
./flip.sh e q ar2.txt > ar.txt
./flip.sh d p ar.txt > ar2.txt
./flip.sh r o ar2.txt > ar.txt
./flip.sh m n ar.txt > ar2.txt
./flip.sh b m ar2.txt > ar.txt
./flip.sh j l ar.txt > ar2.txt
./flip.sh a k ar2.txt > ar.txt
./flip.sh c j ar.txt > ar2.txt
./flip.sh y i ar2.txt > ar.txt
./flip.sh k h ar.txt > ar2.txt
./flip.sh t g ar2.txt > ar.txt
./flip.sh q f ar.txt > ar2.txt
./flip.sh o e ar2.txt > ar.txt
./flip.sh l d ar.txt > ar2.txt
./flip.sh w c ar2.txt > ar.txt
./flip.sh n b ar.txt > ar2.txt
./flip.sh i a ar2.txt > ar.txt
done

cat ar.txt 

rm ar2.txt
rm ar.txt