$k = Get-Content .\commits
$prefix = "JIRA-101. "
foreach($r in $k) {
    $msg = git log --format=%B -n 1 $r
    git cherry-pick -n $r
    $branch = git branch --show-current
    $newMsg = "$prefix$msg"
    Write-Host "Cherrypicking $r to $branch. New message= '$newMsg'"
    Read-Host "Do commit?"
    git commit -m $newMsg
}