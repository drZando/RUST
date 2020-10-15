$a="1","2","3","4","5","6"
$com=@()
$steue=3
$loops=0


foreach ($p in $a) {
for ($i = 0; $i -lt $a.Count; $i++) {

    $ACObj = New-Object psobject
    Add-Member -InputObject $ACObj -MemberType NoteProperty -Name a -Value 1
    Add-Member -InputObject $ACObj -MemberType NoteProperty -Name b
    $com += $ACObj
}
}


$ACObj = New-Object psobject
Add-Member -InputObject $ACObj -MemberType NoteProperty -Name b -Value 1
$com += $ACObj



foreach ($p in $a) {
    for ($i = 0; $i -lt $a.Count; $i++) {
    
        $ACObj = New-Object psobject
        Add-Member -InputObject $ACObj -MemberType NoteProperty -Name a -Value 1
        Add-Member -InputObject $ACObj -MemberType NoteProperty -Name b
        $com += $ACObj
    }
    }
    


    $source = @'
    using System;
    using System.Collections.Generic;
 
    namespace Powershell
    {
        public class CSharp
        {
            public static IEnumerable<int[]> Combinations(int m, int n)
            {
                int[] result = new int[m];
                Stack<int> stack = new Stack<int>();
                stack.Push(0);
 
                while (stack.Count > 0) {
                    int index = stack.Count - 1;
                    int value = stack.Pop();
 
                    while (value < n) {
                        result[index++] = value++;
                        stack.Push(value);
                        if (index == m) {
                            yield return result;
                            break;
                        }
                    }
                }
            }
        }
    }
'@
 
Add-Type -TypeDefinition $source -Language CSharp
 
[Powershell.CSharp]::Combinations(4,8) | Format-Wide {$_} -Column 4 -Force

$a=[Powershell.CSharp]::Combinations(4,8)
$k=@()
$a | %{$k+=write-host $_}
$k
<# for ($i = 0; $i -lt $a.Count; $i++) {
    $temp=$a[$i] + $a[$i+1] + $a[$i+2] + $a[$i+3]
    $k+=$temp
    $i=$i+4
}
 #>
 