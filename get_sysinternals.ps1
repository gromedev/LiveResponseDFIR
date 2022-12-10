Invoke-Expression "Powercfg -hibernate off"
Invoke-WebRequest -Uri https://github.com/fdhin/LiveResponseDFIR/raw/93636eb986fa29c2d768143938bd267961e18aee/sysinternals.zip -OutFile C:\temp\sysinternals.zip -UseBasicParsing
Expand-Archive -Path C:\temp\sysinternals.zip -DestinationPath C:\temp
Invoke-Expression "C:\temp\sigcheck.exe -accepteula -u -e -s -c c:\ > c:\temp\sigcheck_output.txt"
