cd %~p0
rmdir /S /Q ..\Wiki\Ws2ExplorerAPI
dotnet build
dotnet xmldoc2md bin/Debug/net8.0/Ws2Explorer.dll -o ..\Wiki\Ws2ExplorerAPI
