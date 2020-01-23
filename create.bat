@echo off
setlocal enabledelayedexpansion


powershell -Command "(Remove-Item -Path 'output/*.json')"

echo  Update palyloads files

for /l %%x in (1, 1, 100) do  (
    FOR /F %%a IN ('POWERSHELL -COMMAND "$([guid]::NewGuid().ToString())"') DO ( SET "NEWGUID=%%a" )
    powershell -Command "(gc templates/request1.json) -replace 'replaceUUID', '"!NEWGUID!"' -replace 'replaceDate', 'a date' | Out-File -encoding ASCII output/request"%%x".json"
    echo Request with id !NEWGUID! created
)
