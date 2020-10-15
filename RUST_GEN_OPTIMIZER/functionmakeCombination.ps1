
  write-host "`nbegin combinations with PowerShell demo`n"
  $data = ("ant","bat","cow","dog","elk","fox","gnu")
  write-host "Initial data is: $data `n"
  makeCombination 7 3 $data

  function makeCombination($n,$k,[string[]]$d)
{
  $nVal = 0
  $kVal = 0
  $values = @()
  $all = @() # save all original strings
  $id  = @{} # hash table of original string ids
  if ($d.length -ne $n) {
    throw "Incorrect data array size: array size must equal n"
  }
  else {
    $nVal = $n
    $kVal = $k
    $values = new-object string[] $k
    for ($i = 0; $i -lt $k; $i++) {
      $values[$i] = $d[$i]
    }
    # save all strings
    $all = new-object string[] $n
    for ($i = 0; $i -lt $d.length; $i++) {
      $all[$i] = $d[$i]
    }
    # the ‘id’ of each string
    for ($i = 0; $i -lt $d.length; $i++) {
      $id[$d[$i]] += $i
    }
  } # else
} # makeCombination()