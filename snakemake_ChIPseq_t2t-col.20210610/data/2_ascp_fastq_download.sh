#!/bin/bash

# Usage
# ./2_ascp_fastq_download.sh PRJNA349052

accession=$1

while read LIST
do
( $LIST ) &
done < $accession"_download.txt"
wait
