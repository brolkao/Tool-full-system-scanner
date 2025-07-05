# Full System Files Scanner

#!/bin/bash

# Function to scan files
scan_files() {
    echo "Scanning system files..."
    for file in $(find / -type f 2>/dev/null); do
        if [[ $(clamscan "$file" | grep "Infected files:") ]]; then
            echo "Malware detected in: $file"
            rm -f "$file"
            echo "$file has been deleted."
        fi
    done
}

# Start the scanner
read -p "Press Enter to start the full system files scanner..."
scan_files
