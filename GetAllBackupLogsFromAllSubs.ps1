$subs=Get-AzureRmSubscription
foreach ($sub in $subs)
{   
    Set-AzureRmContext -SubscriptionId $sub.Id
    Write-Host "Current Subscription: " $sub.Id
    $vaults=Get-AzureRmRecoveryServicesVault
    foreach ($vault in $vaults)
    { 
        Set-AzureRmRecoveryServicesVaultContext -Vault $vault
        Write-Host "Current Backup Vault: " $vault.Name
        Write-Host "-----------------------------------------------------"
        Get-AzureRmRecoveryServicesBackupJob
        Write-Host "-----------------------------------------------------"
    }
}
