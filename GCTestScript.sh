#!/bin/bash
GCs=( "Serial" "Parallel" "ConcMarkSweep" "G1" "Z" "Shenandoah" )
test_options=( "fop" "tradesoap" "tradebeans" )
for gc in ${GCs[@]}
do
	for option in ${test_options[@]}
	do
	sudo java -XX:+UnlockExperimentalVMOptions -XX:+Use${gc}GC -Xloggc:${gc}_${option}_gc.log -XX:+PrintGCDetails -jar dacapo-9.12-MR1-bach.jar ${option}
	done
done
