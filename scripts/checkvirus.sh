#!/bin/sh
echo 'start clamscan...'
clamscan -l /home/kbaba/log/clamav.log -i -r /home/kbaba > /dev/null 2>&1
