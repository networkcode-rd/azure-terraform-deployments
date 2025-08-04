# Enable IIS and required features
Install-WindowsFeature -Name Web-Server -IncludeManagementTools

# Wait a moment to ensure IIS setup completes
Start-Sleep -Seconds 5

# Get the hostname of the VM
$vmName = $env:COMPUTERNAME

# Define path to default IIS web page
$defaultPagePath = "C:\inetpub\wwwroot\Default.htm"

# Create a simple HTML page with the VM name
$htmlContent = @"
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to IIS</title>
</head>
<body>
    <h1>Welcome to IIS!</h1>
    <h2>This VM's hostname is: <span style='color: blue;'>$vmName</span></h2>
</body>
</html>
"@

# Overwrite the default IIS page
$htmlContent | Out-File -FilePath $defaultPagePath -Encoding utf8 -Force

# Optionally restart IIS (just to be sure)
iisreset
