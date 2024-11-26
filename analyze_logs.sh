#!/bin/bash
#
report_file_name="report.txt"
log_file_name="access.log"

> $report_file_name

echo Report about logs from web-server >> $report_file_name
echo ================================= >> $report_file_name

total_lines_count=$(awk 'END {print NR}' $log_file_name)
echo Total count requests:  $total_lines_count >> $report_file_name


total_uniq_ips=$(awk '{ ip=$1;seen[ip]=$1 } END {print length(seen)}' $log_file_name)
echo Total unique ip-addresses: $total_uniq_ips >> $report_file_name

echo " " >> $report_file_name

echo Requests method counter: >> $report_file_name

awk '
{ 
	method=substr($6, 2); 
	methods[method]=methods[method]+1;
} 
END {
	for (method in methods) {
             print "\t",methods[method], method;
	}
}' $log_file_name >> $report_file_name

echo  " " >> $report_file_name


most_popular_url=$(awk '
BEGIN {
	n=0
}

{
	url=substr($7, 2);
	urls[url]=urls[url]+1;
}

END {
	max_popular_counter=0;
	most_popular_url="";
	for (url in urls) {
		if (max_popular_counter < urls[url]) {
			max_popular_counter=urls[url];
			most_popular_url=url
		}
	}
	print max_popular_counter, most_popular_url
}
' $log_file_name)
echo Most popular URL: $most_popular_url >> $report_file_name

echo Report save to file $report_file_name
