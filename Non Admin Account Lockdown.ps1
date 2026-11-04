# Emergency lockdown + log off sessions
# Leaves Administrator and krbtgt enabled
# Leaves YOUR current Administrator session logged on

function Wait-Exit {
    Write-Host ""
    Write-Host "Press any key to close..." -ForegroundColor Yellow
    try { $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") } catch { Read-Host "Press Enter to close" }
}

function Get-UserSessions {
    param([string]$ComputerName)

    $raw = @(query user /server:$ComputerName 2>$null)
    if (-not $raw -or $raw.Count -lt 2) { return @() }

    $sessions = @()
    foreach ($line in $raw | Select-Object -Skip 1) {
        $parts = ($line -replace '^\s>', '' -replace '\s+', ' ').Trim() -split ' '
        if ($parts.Count -lt 3) { continue }

        $sessionId = ($parts | Where-Object { $_ -match '^\d+$' } | Select-Object -First 1)
        if (-not $sessionId) { continue }

        $sessions += [PSCustomObject]@{
            User      = $parts[0].TrimStart('>')
            SessionId = $sessionId
        }
    }
    return $sessions
}

try {
    $ErrorActionPreference = "Stop"
    Import-Module ActiveDirectory

    $keepUsers = @("Administrator", "krbtgt")
    $targets = Get-ADUser -Filter * | Where-Object {
        $keepUsers -notcontains $_.SamAccountName -and
        $_.SID -notlike "*-500"
    }
    $count = @($targets).Count

    Write-Host ""
    Write-Host "Do you want to lockdown $count users and log them off?" -ForegroundColor Yellow
    Write-Host "(Administrator and krbtgt stay enabled. Your current Admin session stays.)"
    Write-Host ""

    $answer = Read-Host "Type Lockdown to confirm"
    if ($answer -ne "Lockdown") {
        Write-Host "Cancelled. No accounts or sessions were changed." -ForegroundColor Yellow
        return
    }

    $disabled = 0
    foreach ($user in $targets) {
        Disable-ADAccount -Identity $user.SamAccountName
        Write-Host "Disabled $($user.SamAccountName)"
        $disabled++
    }

    Write-Host ""
    Write-Host "Logging off sessions..." -ForegroundColor Yellow

    $computers = Get-ADComputer -Filter * | Select-Object -ExpandProperty Name
    $loggedOff = 0

    foreach ($computer in $computers) {
        if (-not (Test-Connection -ComputerName $computer -Count 1 -Quiet)) {
            Write-Host "Offline: $computer - skipped"
            continue
        }

        $sessions = Get-UserSessions -ComputerName $computer
        foreach ($s in $sessions) {
            if ($s.User -eq "Administrator") {
                Write-Host "Left Administrator logged on at $computer"
                continue
            }

            logoff $s.SessionId /server:$computer
            Write-Host "Logged off $($s.User) on $computer (session $($s.SessionId))"
            $loggedOff++
        }
    }

    Write-Host ""
    Write-Host "Lockdown complete. Disabled: $disabled   Sessions logged off: $loggedOff" -ForegroundColor Red
}
catch {
    Write-Host ""
    Write-Host "ERROR: The script did not complete." -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
}
finally {
    Wait-Exit
}