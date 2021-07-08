  
#!/bin/bash
ip=10.0.10.0
user=lxl
pass=123

lftp -u $user,$pass $ip << EOF
cd ftp
put $@
ls
exit
EOF

echo "done"
