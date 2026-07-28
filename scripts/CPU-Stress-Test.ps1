$jobs = @()

1..8 | ForEach-Object {
    $jobs += Start-Job {
        while ($true) {
            [Math]::Sqrt((Get-Random))
        }
    }
}

Write-Host "CPU Stress Started..."