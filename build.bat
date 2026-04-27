@echo off
set GOARCH=amd64
echo Building...
go build -o .\build\security-mon.exe -mod=vendor
