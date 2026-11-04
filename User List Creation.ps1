# Create AD users from users.csv
# Headers: FirstName,LastName,LogonName,Password

function Wait-Exit {
    Write-Host ""
    Write-Host "Press any key to close..." -ForegroundColor Yellow
    try { $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") } catch { Read-Host "Press Enter to close" }
}

try {
    $ErrorActionPreference = "Stop"
    Import-Module ActiveDirectory

    $CsvPath = "C:\Users\Administrator\Desktop\Powershell Scripts\User List.csv"
    $OUPath  = "CN=Users,DC=CompanyVirtualNet,DC=local"

    Write-Host ""
    Write-Host "=== Create users from CSV ===" -ForegroundColor Cyan
    Write-Host "File: $CsvPath"

    if (-not (Test-Path $CsvPath)) {
        Write-Host "CSV not found: $CsvPath" -ForegroundColor Red
        return
    }

    Write-Host ""
    Write-Host "----- users.csv -----" -ForegroundColor Yellow
    Get-Content $CsvPath
    Write-Host "---------------------" -ForegroundColor Yellow
    Write-Host ""

    $rows = @(Import-Csv $CsvPath)
    Write-Host "Rows found: $($rows.Count)"
    $rows | Format-Table FirstName, LastName, LogonName, Password -AutoSize

    if ($rows.Count -eq 0) {
        Write-Host "The CSV is empty." -ForegroundColor Red
        return
    }

    $answer = Read-Host "Create these accounts from the list above? (Y/N)"
    if ($answer -ne "Y" -and $answer -ne "y") {
        Write-Host "Cancelled. No users were created." -ForegroundColor Yellow
        return
    }

    $created = 0
    $skipped = 0

    foreach ($row in $rows) {
        $LogonName = $row.LogonName
        $FullName  = $row.FirstName + " " + $row.LastName

        Write-Host "Processing $LogonName ..."

        if ([string]::IsNullOrWhiteSpace($LogonName)) {
            Write-Warning "Skipping a row with no LogonName"
            $skipped++
            continue
        }

        $exists = Get-ADUser -Filter "SamAccountName -eq '$LogonName'"
        if ($exists) {
            Write-Warning "$LogonName already exists - skipped"
            $skipped++
            continue
        }

        $Password = ConvertTo-SecureString $row.Password -AsPlainText -Force

        New-ADUser -Name $FullName -GivenName $row.FirstName -Surname $row.LastName -DisplayName $FullName -SamAccountName $LogonName -UserPrincipalName ($LogonName + "@CompanyVirtualNet.local") -Path $OUPath -AccountPassword $Password -Enabled $true -ChangePasswordAtLogon $false -CannotChangePassword $false -PasswordNeverExpires $false

        Write-Host "Created $LogonName ($FullName)" -ForegroundColor Green
        $created++
    }

    Write-Host ""
    Write-Host "Finished successfully. Created: $created  Skipped: $skipped" -ForegroundColor Green
}
catch {
    Write-Host ""
    Write-Host "ERROR: The script did not complete." -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
}
finally {
    Wait-Exit
}