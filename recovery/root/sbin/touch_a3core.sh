#!/system/bin/sh 
# Mounting of the "socko" partition 
mount -t ext4 -o rw /dev/block/by-name/socko /socko
# mkdir of modules folder to ensure it exists 
# mkdir /vendor/lib/modules/$(uname -r) 0755 root root - this is init-style, so we'll replace it with shell style: 
MOD_DIR="/vendor/lib/modules/4.14" 
mkdir -p "$MOD_DIR" 
chmod 755 "$MOD_DIR" 
chown root:root "$MOD_DIR" 
# Copying all .ko files to /vendor/lib/modules 
cp /socko/*.ko "$MOD_DIR/"