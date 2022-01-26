Set-AzVMExtension -ResourceGroupName "Feliks_Ianganaev" `
    -ExtensionName "IIS" `
    -VMName "test-vm1" `
    -Location "westeurope" `
    -Publisher Microsoft.Compute `
    -ExtensionType CustomScriptExtension `
    -TypeHandlerVersion 1.8 `
    -SettingString '{"commandToExecute":"powershell Add-WindowsFeature Web-Server; powershell Add-Content -Path \"C:\\inetpub\\wwwroot\\Default.htm\" -Value $($env:computername)"}'