#!/bin/bash

# Define default values
file="coordinates/Coastal_VA.csv"
height=2048
width=2048
dataset="sentinel"

# List of bands to loop through
bands=("RGB" "RE" "RE4" "NIR" "SWIR1" "SWIR2" "IR")

# Parse command line arguments
while getopts f:h:w:d: flag
do
    case "${flag}" in
        f) file=${OPTARG};;
        h) height=${OPTARG};;
        w) width=${OPTARG};;
        d) dataset=${OPTARG};;
    esac
done

# Function to increment the month
increment_month() {
    date -d "$1 +1 month" +"%Y-%m-%d"
}

# Loop through the dates and bands
for band in "${bands[@]}"; do
    start_date="2023-01-01"
    end_date="2023-02-01"

    # Adjust resolution based on the band type
    if [[ "$band" == "RGB" || "$band" == "IR" || "$band" == "NIR" ]]; then
        height=2048
        width=2048
    else
        height=1024
        width=1024
    fi

    while [ "$start_date" != "2024-01-01" ]; do
        # Define the output path based on the current start and end dates
        output_path="data/$band/$(date -d "$start_date" +"%Y%m%d")_$(date -d "$end_date" +"%Y%m%d")"
        
        # Create the output directory if it doesn't exist
        mkdir -p "$output_path"

        # Run the Python script with the specified parameters
        python imageExporter.py -f "$file" -he "$height" -w "$width" -d "$dataset" -s "$start_date" -e "$end_date" -o "$output_path" -b "$band"
        
        # Increment the start and end dates
        start_date=$(increment_month "$start_date")
        end_date=$(increment_month "$end_date")
    done
done
