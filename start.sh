#!/bin/bash
export DISPLAY=:1

# تشغيل Xvfb وواجهة سطح المكتب
Xvfb :1 -screen 0 1024x768x24 &
fluxbox &

# تشغيل VNC مع كلمة مرور محددة
x11vnc -passwd toolboxlap -display :1 -N -forever -shared -rfbport 5900 &

# تشغيل noVNC على المنفذ 10000
websockify --web=/usr/share/novnc/ 10000 localhost:5900
