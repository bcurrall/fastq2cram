#!/bin/bash
echo “Hello World”
echo “fastq2cram”

# main function to handle all options
main(){
  check $@
}

help(){
  cat << EOF
  usage: fastq2cram INPUTLIST

  Checks list of fastq to determine fastq type (including whether index in header or separate file) and compresses to standardized cram files, saving output in queue for AWS transfer

  Positional arguments:
    INPUT    List of fastq or cram files in input folder

  Optional arguments:
    -h  HELP          Show this help message and exit
  EOF
}

main $@
