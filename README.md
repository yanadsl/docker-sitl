# docker-sitl
The image followed [official guide](http://ardupilot.org/dev/docs/setting-up-sitl-on-linux.html) to install.

However, **JSBSim is not included** in this image

If you want to build yourself, check `Dockerfile` in Line 24

`timeout 240 sim_vehicle.py -w`

I'm using `timeout 240` to let the program run for 240s and kill itself

It's because the program need to run once first, and the time depend on your computer.

# Usage
```
docker run -itd --name SITL -p 5762:5762 yanadsl:docker-sitl\
-l 25.0340999,121.563394,15,165 -C --out 192.168.62.1:14550
```
arg `-l` for location, you can dismiss it or change yourself. Add other args if you need them, check `sim_vehicle.py` for more.

**Args for `sim_vehicle.py` must be add before `-C`**



**args after `-C` are for Mvaproxy**, you can check the args [here](http://ardupilot.github.io/MAVProxy/html/getting_started/starting.html)

arg `--out` is for the client computer's(where you install mission planner) IP address and the port you want to use, add multiple if you need more
