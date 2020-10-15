$Gen = "gwgggg", "ggxggy", "wgggyy", "gggyhy", "ggyyxy"
$Gen = "g","y","w","h","x"
$AzauKlone= 4

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
if(!("Powershell.CSharp" -as [type])){
    Add-Type -TypeDefinition $source -Language CSharp -ErrorAction SilentlyContinue
}

function Genvergliche {
    param (
        $G1,
        $G2,
        $G3,
        $G4

    )
    

}


$ComboIndex = [Powershell.CSharp]::Combinations($AzauKlone,$gen.Length)
$AuiCombo =@()
foreach ($item in $ComboIndex) {
    $ACObj = New-Object psobject
    Add-Member -inputobject $ACObj -membertype Noteproperty -name GEN1 -value $gen[$item[0]]
    Add-Member -inputobject $ACObj -membertype Noteproperty -name GEN2 -value $gen[$item[1]]
    Add-Member -inputobject $ACObj -membertype Noteproperty -name GEN3 -value $gen[$item[2]]
    Add-Member -inputobject $ACObj -membertype Noteproperty -name GEN4 -value $gen[$item[3]]
    $AuiCombo += $ACObj
}
#$AuiCombo


foreach ($combo in $AuiCombo) {
    $combo.gen1[0]
    $combo.gen2[0]
    $combo.gen3[0]
    $combo.gen4[0]
}

























<# #function AuiCombinatione {
   # param (
        #$Gen,
        $azauklone = 4     
        $fak = 1
$gen.Count..($gen.count - $azauklone+1) | ForEach-Object {$fak *= $_}

    #)
    $durchloeif=0
    $AuiCombo =@()

    ForEach($g in $Gen){
        
        for ($i = $durchloeif; $i -le $Gen.count; $i++) {
            #$a=$g, $gen[$i+1], $gen[$i+2], $gen[$i+3]
            $ACObj = New-Object psobject
            Add-Member -inputobject $ACObj -membertype Noteproperty -name GEN1 -value $g
            Add-Member -inputobject $ACObj -membertype Noteproperty -name GEN2 -value $gen[$i+1]
            Add-Member -inputobject $ACObj -membertype Noteproperty -name GEN3 -value $gen[$i+2]
            Add-Member -inputobject $ACObj -membertype Noteproperty -name GEN4 -value $gen[$i+3]
            $AuiCombo += $ACObj
            
     #       $mut++
        }
        $durchloeif++
       
    }

#}

$AuiCombo

 #>




<# function Gener  {
    param (
        $Gen1,
        $Gen2,
        $Gen3
    )


    for ($i = 0; $i -lt 6 ; $i++) {

        Group-Object $gen1[0][$i], $gen1[1][$i],$gen1[2][$i]
    }
}

 #>#gener $gen
