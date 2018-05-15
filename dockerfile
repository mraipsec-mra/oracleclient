FROM microsoft/aspnet:4.7.1-windowsservercore-ltsc2016
ARG source
WORKDIR /inetpub/wwwroot
COPY ${source:-obj/Docker/publish} .
WORKDIR /
RUN powershell -Command "dir"
ADD https://oracleapps.blob.core.windows.net/public/workloads.zip .
RUN powershell -Command "dir"
RUN powershell -Command "expand-archive -Path 'c:\workloads.zip' -DestinationPath 'c:\'"
RUN powershell -Command "dir"
RUN powershell -Command "c:\workloads\install.bat"
RUN powershell -Command "dir"
