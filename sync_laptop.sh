#!/usr/bin/bash
#sync_laptop.sh
rsync -av --delete biol792 /mnt/e
echo 'Your BIOL792 work is now backed up.'