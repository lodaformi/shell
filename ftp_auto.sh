  
#!/bin/bash
ip=10.0.10.0
user=lxl
pass=123

lftp -u $user,$pass $ip << EOF
cd ftp
put $@    #把执行脚本时传入的文件上传到ftp服务器上
ls
exit
EOF

echo "done"
