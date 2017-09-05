# docker-sitl
The image followed [official guide](http://ardupilot.org/dev/docs/setting-up-sitl-on-linux.html) to install.

However, **JSBSim is not included** in this image

If you want to build yourself, check `Dockerfile` in Line 24

`timeout 1200 sim_vehicle.py -w`

I'm using `timeout 1200` to let the program run for 1200s and kill itself

It's because the program need to run once first for building and settings, and the time depend on your computer.

# Usage
```
docker pull yanadsl/docker-sitl
docker run -itd --name SITL -p 5762:5762 yanadsl/docker-sitl \
-l 25.0340999,121.563394,15,165 --out 192.168.62.1:14550
```

`-l` for location, you can dismiss it or change it.

`--out` is for the client computer's(where you install mission planner) IP address and the port you want to use, add multiple(--out A --out B) if you need more

If you want to deal with MAVproxy args, add `-m` before it 

For args, looking at **[sim_vehicle](https://github.com/ArduPilot/ardupilot/blob/master/Tools/autotest/sim_vehicle.py)** and [**Mvaproxy**](http://ardupilot.github.io/MAVProxy/html/getting_started/starting.html) 
 should give you more information
