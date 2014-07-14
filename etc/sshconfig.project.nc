Host 192.168.33.13
	ProxyCommand ssh vagrant@192.168.33.12 nc -w 120 %h %p 
