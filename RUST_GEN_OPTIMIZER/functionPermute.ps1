function Permute ($list)
{
    $global:remove = { 
        param ($element, $list) 

        $newList = @() 
        $list | ForEach-Object { if ($_ -ne $element) { $newList += $_} }  

        return $newList 
    }

    $global:append = {
        param ($head, $tail)

        if ($tail.Count -eq 0)
            { return ,$head }

        $result =  @()

        $tail | ForEach-Object{
            $newList = ,$head
            $_ | ForEach-Object{ $newList += $_ }
            $result += ,$newList
        }

        return $result
    }

    if ($list.Count -eq 0)
        { return @() }

    $list | ForEach-Object{
        $permutations = Permute ($remove.Invoke($_, $list))
        return $append.Invoke($_, $permutations)
    }
}

Clear-Host

$list = "g", "y", "x", "w","h"

$permutations = Permute $gen

$permutations | ForEach-Object{
    Write-Host ([string]::Join(", ", $_))
}




