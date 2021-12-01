#TODO: 暂以x86 centos7为主  增加其他架构和操作系统
cd /OS/x86/Centos7
wget -c -t 0 -P ./files -i ./download-links/k3s-files.txt
wget -c -t 0 -P ./packages -i ./download-links/k3s-packages.txt