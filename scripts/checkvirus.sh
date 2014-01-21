#!/bin/sh
echo '*********************' >> ~/log/clamav.log
date >> ~/log/clamav.log

clamscan -l ~/log/clamav.log -i -r ~ > /dev/null 2>&1
