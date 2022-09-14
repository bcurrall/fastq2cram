#!/bin/bash
echo “Hello World”
echo “cram2fastq”

main(){
  check $@
}

help(){
  cat << EOF

  usage: cram2fastq INPUTLIST

  Uncompresses a list of standardized cram files into standard fastq (barcodes in headers)

  Positional arguments:
    INPUT    List of fastq or cram files in input folder

  Optional arguments:
    -h  HELP          Show this help message and exit
  EOF
}

main $@
