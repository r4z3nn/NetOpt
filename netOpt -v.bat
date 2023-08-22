��&cls
@echo off
color 0D
title _r4z3nn's Basic NetOptimizer

echo _r4z3nn's Basic NetOptimizer
echo -----------------------
echo This tool will flush the DNS resolver cache to help optimize your network.
ping localhost -n 2 > nul
echo.
echo Fetching your router's public IP address...
ping localhost -n 5 > nul

setlocal enabledelayedexpansion

for /f "delims=" %%i in ('nslookup myip.opendns.com resolver1.opendns.com ^| find "Address:"') do (
    set ipaddress=%%i
)

echo Your Router's Public IP Address: !ipaddress:~9!
echo.
echo Pinging evangelist to check your connection...
ping google.com -n 5
echo.
echo Flushing DNS resolver cache...
ping localhost -n 5 > nul
ipconfig /flushdns
echo DNS resolver cache has been flushed successfully.
echo.
ping localhost -n 1 > nul
echo Network has been optimized.
echo Check more in https://github.com/r4z3nn!
echo.
pause
