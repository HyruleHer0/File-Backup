# STEPS for version 1.0.0:
# [x] Open csv file and store to $table variable
# [X] Use hostname to keep only the rules relevant to this device
# [ ] For each rule, check that the source path exists
# [ ] If it does, check the mode and run the appropriate cmdlet
# [X] Ensure that newer items overwrite older ones of the same name


# POSSIBLE FUTURE ACTIONS:
# [ ] Logging. Log to local file in folder things like date / time, already existing items, missing folders, etc.
# [ ] Naming each rule. Add a column to the csv.
# [ ] Add argument support & support using rule names
# [ ] Copying folder structure only to the device. This would ease saving new items as the folder will most likely already exist for them. May need to add more configuration. Do this at the end? Any 'move' rules will likely remove folders...
# [ ] Support keeping recent files in source destination. Allow configuration in months?

$table = (Import-Csv D:\Programming\Scripts\FileBackup\Backup.csv).Where({$_.hostName -eq (hostname)})
$table[0] | Get-Member
<# $test = Get-ChildItem -Path D:\TestSourceFolder -Recurse


<#ForEach ($rule in $table) {
    $srcPath = $rule.inputPath
    $destPath = $rule.outputPath

    

    # Ensure that the destination path ends with \
    if ($destPath -notmatch '\\$') {
        $destPath += '\'
    }

    if ($_.mode -eq "move") { # move items to output
            
        # move-item -Path $path\* -Destination $dest\
    }
    elif ($_.mode -eq "copy") { # copy items to output
            
        # copy-item - Path $path\* -Destination $dest\ -recurse
    }
    else {
        # TODO: Log info here
    }
}#>

function Apply-BackupRule {

}

function Ensure-TrailingSlashAsterisk {
    param ([string] $path)

    if ($path -notmatch '\\*$') {
        if ($path -match '\\$') {
            $path += '*'
        }
        else {
            $path += '\*'
        }
    }

    return $path
}

function Ensure-TrailingSlash {
    if ($path -notmatch '\\$') {
        $path += '\'
    }

    return $path
}