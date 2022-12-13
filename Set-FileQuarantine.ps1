# Set the path to the file that you want to quarantine
$filePath = "C:\Path\To\File.exe"

# Quarantine the file
Write-Host "Quarantining $filePath..."
$response = Invoke-WebRequest -Method Post -Uri "https://localhost:8008/api/v1.0/quarantine" -Body @{
    "filePaths" = @($filePath)
} -ContentType "application/json"

# Check the response
if ($response.StatusCode -eq 200) {
    Write-Host "Successfully quarantined $filePath"
} else {
    Write-Host "Failed to quarantine $filePath"
}
