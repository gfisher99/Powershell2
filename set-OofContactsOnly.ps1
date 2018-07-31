# Get a list of mailboxes that have OoF enabled AND have external audience set to 'Everyone' - Store these in a variable for processing.

$ToProcess = Get-Mailbox -OrganizationalUnit "nterprise.net/Accounts and Groups/Associations/Cap Farm Credit/Users" | Get-MailboxAutoReplyConfiguration | where {($_.AutoReplyState -eq "Enabled") -AND ($_.ExternalAudience -eq "All")}

# Change the external audience to 'Known', which translates to 'My Contacts Only' in the Outlook client.

    foreach ($MBX in $ToProcess) {
        Set-MailboxAutoReplyConfiguration $MBX.Identity -ExternalAudience "Known"
        }