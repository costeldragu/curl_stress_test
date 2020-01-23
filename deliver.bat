@echo off
setlocal enabledelayedexpansion

echo  execute requests

for /r %%f in (output\*.json)  do (
    echo deliver %%f
    set Build=
   for /F "usebackq tokens=*" %%x in (%%f) do set Build=!Build!%%x
  curl -i -X POST   https://postman-echo.com/post -H "Content-Type: application/json" --data '!Build!'
)


