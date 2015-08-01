
rem This prevents the guest from treating left CMD as windows key
rem So you can use left CMD for virtualbox host key and right cmd 
rem as the windows key in the guest
regedit -s \vagrant\disable-windows-key.reg
