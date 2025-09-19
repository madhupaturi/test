# Install the Microsoft.Graph module if not already installed
Install-Module -Name Microsoft.Graph

# Import the module
Import-Module -Name Microsoft.Graph

# Connect to Microsoft Graph
Connect-MgGraph -Scopes "User.Read.All"

# Calculate threshold date (e.g., users who haven't signed in within 1 day)
$thresholdDate = (Get-Date).AddDays(-1)

# Get users who haven't signed in since the threshold date
$users = Get-MgUser -All $true | Where-Object {
    $_.signInActivity.lastSignInDateTime -eq $null -or $_.signInActivity.lastSignInDateTime -lt $thresholdDate
}

# Display the list of inactive users
$users | Select-Object displayName, userPrincipalName, @{Name="LastSignInDateTime"; Expression={$_.signInActivity.lastSignInDateTime}} | Format-Table -AutoSize

# Disconnect from Microsoft Graph (optional)
Disconnect-MgGraph
