# Get the directory where the script is located
$ScriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

# Create the clear.xml file in the same folder as the script
$clearXmlContent = @"
<AppLockerPolicy Version="1" />
"@
$clearXmlPath = Join-Path -Path $ScriptDirectory -ChildPath "clear.xml"
Set-Content -Path $clearXmlPath -Value $clearXmlContent -ErrorAction SilentlyContinue

# Import the AppLocker module
Import-Module AppLocker -ErrorAction SilentlyContinue

# Remove all local AppLocker policies using the clear.xml file
Set-AppLockerPolicy -XMLPolicy $clearXmlPath -ErrorAction SilentlyContinue

# Stop the AppLocker service and configure their startup modes
try {
    appidtel.exe stop [-mionly] -ErrorAction SilentlyContinue
} catch {
    Write-Output "appidtel.exe stop command failed: $_"
}

sc.exe config appid start=demand -ErrorAction SilentlyContinue
sc.exe config appidsvc start=demand -ErrorAction SilentlyContinue
sc.exe config applockerfltr start=demand -ErrorAction SilentlyContinue

# Stop services
sc.exe stop applockerfltr -ErrorAction SilentlyContinue
sc.exe stop appidsvc -ErrorAction SilentlyContinue
sc.exe stop appid -ErrorAction SilentlyContinue
