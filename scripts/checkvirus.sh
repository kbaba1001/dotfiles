#!/bin/sh
echo 'start clamscan...'
clamscan -l ~/log/clamav.log -i -r ~ > /dev/null 2>&1
