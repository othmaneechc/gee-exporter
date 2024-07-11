#!/bin/bash

# Define default values
file="Coastal_VA.csv"
height=2048
width=2048
dataset="sentinel"
start_date="2023-07-21"
end_date="2023-12-21"

# Parse command line arguments
while getopts f:h:w:d:s:e: flag
do
    case "${flag}" in
        f) file=${OPTARG};;
        h) height=${OPTARG};;
        w) width=${OPTARG};;
        d) dataset=${OPTARG};;
        s) start_date=${OPTARG};;
        e) end_date=${OPTARG};;
    esac
done

# Run the python script with the specified parameters
python imageExporter.py -f "$file" -he "$height" -w "$width" -d "$dataset" -s "$start_date" -e "$end_date"
