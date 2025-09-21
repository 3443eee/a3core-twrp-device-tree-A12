#!/system/bin/sh

# Loop through all .ko files in socko and insmod them
for module in /mnt/socko/*.ko; do
    if [ -f "$module" ]; then
        echo "Loading module: $module"
        insmod "$module" || echo "Failed to load: $module"
    fi
done
