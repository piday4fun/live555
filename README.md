# live555
Realize the function of live video streaming on Raspberry Pi
# How to install it.
1.Download the repository 
```bash 
git clone https://github.com/piday4fun/live555.git
cd live555/
tar -xf live555-latest.tar.gz
cd live/
./genMakefiles linux
vim testProgs/testOnDemandRTSPServer.cpp

make 
sudo make install
cd mediaServer/
./live555MediaServer & 
```
Do remember put the video file into the same folder with mediaServer.
### Raspberry Pi Camera configure
```bash
mkfifo /tmp/rpicam
raspivid -rot 180 -w 257 -h 353 -fps 3 -o /tmp/rpicam
```
### Auto detect shell scripts
#!/bin/bash
while true
do 
	if [[ `ps aux | grep raspivid | grep -v grep | wc -l` -eq 0 ]]; then
		echo -e "\e[32;40m Camera is rerunning...\[0m"
		raspivid -rot 180 -w 257 -h 353 -fps 3 -o /tmp/rpicam
	fi
	sleep 0.5
done

