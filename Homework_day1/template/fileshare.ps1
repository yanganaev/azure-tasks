$connectTestResult = Test-NetConnection -ComputerName testlabstorage0000099.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Save the password so the drive will persist on reboot
    cmd.exe /C "cmdkey /add:`"testlabstorage0000099.file.core.windows.net`" /user:`"localhost\testlabstorage0000099`" /pass:`"DwDNFly8f4K6rolUDK6L9spO0hTuBRoumKqczhyNdFSftgEtLJD8CGPjZ7sYqKGLXLmoYXKwjr7wxCstqkoACA==`""
    # Mount the drive
    New-PSDrive -Name X -PSProvider FileSystem -Root "\\testlabstorage0000099.file.core.windows.net\testlabfileshare" -Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}