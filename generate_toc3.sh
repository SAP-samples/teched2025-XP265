#!/bin/bash

# Function to convert heading text to GitHub anchor format
heading_to_anchor() {
    local heading="$1"
    echo "[DEBUG] Converting heading to anchor: '$heading'" >&2
    
    # Remove the "## " prefix first
    local clean_text=$(echo "$heading" | sed 's/^## //')
    echo "[DEBUG] After removing ##: '$clean_text'" >&2
    
    # Convert to lowercase
    local lowercase=$(echo "$clean_text" | tr 'A-Z' 'a-z')
    echo "[DEBUG] After lowercase: '$lowercase'" >&2
    
    # Remove special characters except spaces and hyphens, then convert spaces to hyphens
    # This preserves existing hyphens and converts spaces to hyphens
    local anchor=$(echo "$lowercase" | sed 's/[^a-z0-9 -]//g' | sed 's/ /-/g')
    echo "[DEBUG] After space-to-hyphen conversion: '$anchor'" >&2
    
    # Remove leading and trailing hyphens only
    anchor=$(echo "$anchor" | sed 's/^-*//' | sed 's/-*$//')
    echo "[DEBUG] Generated anchor: '$anchor'" >&2
    
    echo "$anchor"
}

# Function to extract main title from H1 heading (# )
get_main_title() {
    local readme_file="$1"
    echo "[DEBUG] Looking for main title (H1) in: $readme_file" >&2
    if [[ -f "$readme_file" ]]; then
        local title=$(grep "^# " "$readme_file" | head -n 1 | sed 's/^# //')
        if [[ -n "$title" ]]; then
            echo "[DEBUG] Found H1 title: '$title'" >&2
            echo "$title"
        else
            echo "[DEBUG] No H1 heading found, using default title" >&2
            echo "Exercise Description"
        fi
    else
        echo "[DEBUG] README.md not found, using default title" >&2
        echo "Exercise Description"
    fi
}

# Function for cross-platform sorting (macOS doesn't have sort -V by default)
natural_sort() {
    if sort -V /dev/null >/dev/null 2>&1; then
        # GNU sort with version sort
        sort -V
    else
        # macOS/BSD sort fallback - sort by exercise number
        sort -t'x' -k2 -n
    fi
}

# Main function to generate TOC
generate_toc() {
    echo "[DEBUG] Starting TOC generation..." >&2
    echo "[DEBUG] Current working directory: $(pwd)" >&2
    echo "[DEBUG] Operating system: $(uname -s)" >&2
    
    echo "# Table of Contents"
    echo ""
    
    # Check if exercises directory exists
    if [[ ! -d "./exercises" ]]; then
        echo "[ERROR] ./exercises directory not found!" >&2
        echo "[DEBUG] Current directory contents:" >&2
        ls -la . >&2
        exit 1
    fi
    
    echo "[DEBUG] Found exercises directory" >&2
    
    # Find all directories starting with "ex" followed by numbers in exercises folder
    echo "[DEBUG] Searching for exercise directories..." >&2
    
    # Use a more portable approach for finding and sorting directories
    local ex_dirs_unsorted=$(find ./exercises -maxdepth 1 -type d -name "ex[0-9]*" 2>/dev/null)
    
    if [[ -z "$ex_dirs_unsorted" ]]; then
        echo "[ERROR] No exercise directories found matching pattern ex[0-9]*" >&2
        echo "[DEBUG] Contents of ./exercises:" >&2
        ls -la ./exercises >&2
        exit 1
    fi
    
    # Sort directories using natural sort function
    local ex_dirs=$(echo "$ex_dirs_unsorted" | natural_sort)
    
    echo "[DEBUG] Found exercise directories:" >&2
    echo "$ex_dirs" | while IFS= read -r dir; do echo "[DEBUG]   $dir" >&2; done
    
    # Process each directory
    while IFS= read -r dir; do
        [[ -z "$dir" ]] && continue  # Skip empty lines
        
        echo "[DEBUG] Processing directory: $dir" >&2
        
        # Extract directory name without ./exercises/
        local dir_name=$(basename "$dir")
        local readme_file="$dir/README.md"
        
        echo "[DEBUG] Directory name: $dir_name" >&2
        echo "[DEBUG] README file path: $readme_file" >&2
        
        # Extract exercise number
        local ex_num=$(echo "$dir_name" | sed 's/ex//')
        echo "[DEBUG] Exercise number: $ex_num" >&2
        
        # Get main title from H1 heading (# )
        local main_title=$(get_main_title "$readme_file")
        
        # Generate main exercise link
        if [[ "$ex_num" == "0" ]]; then
            echo "[DEBUG] Generating 'Getting Started' link" >&2
	    echo "- [Exercise 0 - General Information and Prerequisites (Optional)](exercises/$dir_name/)"
        else
            echo "[DEBUG] Generating main exercise link for ex$ex_num" >&2
            # Use the H1 title directly (it already contains "Exercise X - Description")
            echo "- [$main_title](exercises/$dir_name/)"
        fi
        
        # Extract all ## headings (H2) from README.md and create sub-links
        if [[ -f "$readme_file" ]]; then
            echo "[DEBUG] Processing H2 headings from $readme_file" >&2
            
            # Count total H2 headings
            local total_h2_headings=$(grep -c "^## " "$readme_file" 2>/dev/null || echo "0")
            echo "[DEBUG] Found $total_h2_headings H2 headings" >&2
            
            # Process all H2 headings as sub-items
            if [[ "$total_h2_headings" -gt 0 ]]; then
                echo "[DEBUG] Processing H2 sub-headings:" >&2
                
                grep "^## " "$readme_file" | while IFS= read -r heading; do
                    echo "[DEBUG]   H2 Sub-heading: '$heading'" >&2
                    
                    # Clean heading text
                    local clean_heading=$(echo "$heading" | sed 's/^## //')
                    echo "[DEBUG]   Clean heading: '$clean_heading'" >&2
                    
                    # Convert to GitHub anchor format
                    local anchor=$(heading_to_anchor "$heading")
                    
                    # Generate sub-exercise link
                    echo "    - [$clean_heading](exercises/$dir_name#$anchor)"
                done
            else
                echo "[DEBUG] No H2 sub-headings found" >&2
            fi
        else
            echo "[DEBUG] README.md not found in $dir" >&2
        fi
        
        echo "[DEBUG] Finished processing $dir_name" >&2
        echo "[DEBUG] ---" >&2
    done <<< "$ex_dirs"
    
    echo "[DEBUG] TOC generation completed!" >&2
}

# Check if we're in the right directory
if [[ ! -d "./exercises" ]]; then
    echo "[ERROR] Please run this script from the directory containing the 'exercises' folder" >&2
    echo "[DEBUG] Current directory contents:" >&2
    ls -la . >&2
    exit 1
fi

# Execute the function
generate_toc
