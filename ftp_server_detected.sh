#!/bin/bash
for ip in 10.0.10.{0.254}
do
        {
        wget ftp://$ip &>/dev/null
        if (($? == 0))
        then
                echo "$ip开发了ftp服务"
        fi
        }&
done
wait
