#Checks password for a network called X2X
netsh wlan show profile name="X2X" key=clear | Out-String -Stream | Select-String -Pattern "Key Content"
