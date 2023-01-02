#!/bin/bash/
P1="/LBOCGNATDATA/CGNAT_ROOT/PROCESSING_ROOT/KOLKATA/ROUTING_INPUT"
P2="/LBOCGNATDATA/CGNAT_ROOT/PROCESSING_ROOT/KOLKATA/"

for i in input input1 input2 input3
do
find $P1 -type f -name "*.gz"| head -20 | xargs -I {} mv {}  $P2/$i
done