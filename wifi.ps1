#Checks password for a network called X2X
netsh wlan show profile name="X2X" key=clear | Out-String -Stream | Select-String -Pattern "Key Content"

#alternatively
netsh wlan show profile name="X2X" key=clear  | Select-String -Pattern "Key Content"

#or
netsh wlan show profile name="X2X" key=clear | Out-String | Select-String -Pattern "Key Content"
