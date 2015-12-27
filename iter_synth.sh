#!/bin/bash -x
for i in $(seq 1 1024); do

	sed -i 's,^set_global_assignment -name SEED.*$,set_global_assignment -name SEED '$i',' *.qsf

	#BSV
	sed -i 's,^set_global_assignment -name TOP_LEVEL_ENTITY.*$,set_global_assignment -name TOP_LEVEL_ENTITY mkKeccak,' *.qsf
	/opt/altera/15.0/quartus/bin/quartus_sh --flow compile keccak
	grep -iPo '^;\s*\K[0-9.]+(?=\s*MHz.*?;\s*CLK)' output_files/*.sta.rpt | sort -n | head -n1 >> freq.bsv.txt
	grep -iPo '^; Logic utilization \(in ALMs\)\s*;\s*\K[0-9,]+(?=\s*/)' output_files/*.fit.rpt >> alms.bsv.txt
	rm -rf output_files

	#VHDL
	sed -i 's,^set_global_assignment -name TOP_LEVEL_ENTITY.*$,set_global_assignment -name TOP_LEVEL_ENTITY keccak,' *.qsf
	/opt/altera/15.0/quartus/bin/quartus_sh --flow compile keccak
	grep -iPo '^;\s*\K[0-9.]+(?=\s*MHz.*?;\s*CLK)' output_files/*.sta.rpt | sort -n | head -n1 >> freq.vhdl.txt
	grep -iPo '^; Logic utilization \(in ALMs\)\s*;\s*\K[0-9,]+(?=\s*/)' output_files/*.fit.rpt >> alms.vhdl.txt
	rm -rf output_files

done
