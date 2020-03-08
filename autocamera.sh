### Auto detect shell scripts
#!/bin/bash
while true
do 
	if [[ `ps aux | grep raspivid | grep -v grep | wc -l` -eq 0 ]]; then
		echo -e '\e[32;40m Camera is rerunning...\e[0m'
		raspivid -rot 180 -w 257 -h 353 -fps 3 -o /tmp/rpicam &   
		echo -e "\e[35;40m Raspivid PID: `ps aux |grep raspivid| grep -v grep | awk '{print $2}' | xargs` \e[0m"
	fi
	sleep 0.5
done
