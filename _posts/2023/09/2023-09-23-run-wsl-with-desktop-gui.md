---
title: "Run WSL with Desktop GUI"
tags: WSL Linux
categories: Tech
header:
  teaser: /assets/source/image/teaser/wsl.png
---

I first started using WSL (Windows Subsystem for Linux) in 2021 when I had to complete two C/C++ based units that required a Linux environment. The recommended options for students were either VMBox or VMware Workstation, but I found these to be cumbersome. Launching the hypervisor and starting an instance felt like a tedious process, and constantly switching between two systems was disorienting.

In search of a more efficient solution, I explored setting up a Linux environment within Windows and came across WSL. It proved to be a game-changer, as it addressed all my previous issues. Using WSL in conjunction with local VS Code provided an excellent experience. However, at that time, WSL lacked support for GUI desktop, which posed a challenge when I needed to generate graphical results and provide screenshots for assignments.

Recently, I returned to using WSL for learning ROS2 as part of my preparations for pursuing a PhD degree. During a ROS2 tutorial, I discovered the possibility of running GUI applications in WSL, reigniting my interest in exploring GUI desktop functionality within WSL. Fortunately, this time around, I found a tutorial that guided me through the process of setting up a desktop GUI in WSL.

## Steps

Watch the video:

<iframe width="560" height="315" src="https://www.youtube.com/embed/QC7a9nowsz8" frameborder="0" allowfullscreen></iframe>


In short, you need to:

 - Set up the windows and linux distro (basically download Ubuntu 22.04 from MS store)
 - Set up the Desktop Environment. We’ll use XFCE4, as it’s the simplest:
   ```bash
   sudo apt install -y xrdp xfce4 xfce4-goodies
   sudo cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bak
   sudo sed -i 's/3389/3390/g' /etc/xrdp/xrdp.ini
   sudo sed -i 's/max_bpp=32/#max_bpp=32\nmax_bpp=128/g' /etc/xrdp/xrdp.ini
   sudo sed -i 's/xserverbpp=24/#xserverbpp=24\nxserverbpp=128/g' /etc/xrdp/xrdp.ini
   echo xfce4-session > ~/.xsession
    
   # To finish setting up the RDP access
   sudo nano /etc/xrdp/startwm.sh
   # then comment out the following lines by placing a # before them: 
   # test -x /etc/x11... and the next line; echo /bin/sh /etc/x11...
   # add the following on a new line at the very end: startxfce4
   # Save and close with Ctrl+S, Ctrl+X
   # Start RDP with: 
   sudo /etc/init.d/xrdp start
   # Now, open Remote Desktop on your Windows host machine, 
   # and connect to localhost:3390.
   ```


## References

[WSL Document](https://learn.microsoft.com/en-us/windows/wsl/)

[WSL Desktop GUI](https://hub.tcno.co/windows/wsl/desktop-gui/)

[Webots](https://docs.ros.org/en/humble/Tutorials/Advanced/Simulators/Webots/Installation-Windows.html)