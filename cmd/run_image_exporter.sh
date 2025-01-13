#!/bin/bash

# Define default values
file="./coordinates/sw.csv"
height=1024
width=1024
dataset="landsat"
# dataset="gwl_fcs30"
start_date="2020-01-01"
end_date="2020-12-01"
output_dir="SW/images/"

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
python imageExporter.py -f "$file" -he "$height" -w "$width" -d "$dataset" -s "$start_date" -e "$end_date" -o "$output_dir"
python imageExporter.py -f "$file" -he "$height" -w "$width" -d "$dataset" -s "$start_date" -e "$end_date" -o "$output_dir"
python imageExporter.py -f "$file" -he "$height" -w "$width" -d "$dataset" -s "$start_date" -e "$end_date" -o "$output_dir"
python imageExporter.py -f "$file" -he "$height" -w "$width" -d "$dataset" -s "$start_date" -e "$end_date" -o "$output_dir"
python imageExporter.py -f "$file" -he "$height" -w "$width" -d "$dataset" -s "$start_date" -e "$end_date" -o "$output_dir"

