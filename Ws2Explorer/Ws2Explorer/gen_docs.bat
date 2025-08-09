rmdir /S /Q Docs
dotnet build
dotnet xmldoc2md bin/Debug/net8.0/Ws2Explorer.dll -o Docs
