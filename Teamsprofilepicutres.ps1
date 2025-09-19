# Step 1: Connect to Exchange Online
Connect-ExchangeOnline
# Step 2: Get all mailboxes and check for profile pictures
$usersWithoutPhotos = Get-Mailbox -ResultSize Unlimited | Where-Object {
    $_.HasPicture -eq $false
} | Select-Object DisplayName, UserPrincipalName
# Step 3: Export the result to CSV
$usersWithoutPhotos | Export-Csv -Path "C:\UsersWithoutProfilePicturesevonsys.csv" -NoTypeInformation


