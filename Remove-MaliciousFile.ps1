# Get the path to the file
$filePath = $Event.FilePath

# Remove the file
Remove-Item $filePath -Force
