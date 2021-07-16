##$TxtFiletoImport = Read-Host "What Text File Do You Want To Calculate Entropy On"

$arraylength = @()
$arrayentropy = @()
$CUrPas = "Current Password: "
$AdvSt = "Current Length is: "
$TotalPassword = "Total Number of Passwords: "
$AdverageLength  = "Adv Length is: "
$AdverageEnt   = "Adv Ent is: "


function entropy-importtextintoarray
{
    $ImportedTxtFile = Get-Content C:\Users\IamNotGroot\Desktop\new4.txt
    ForEach ($ImportedLine in $ImportedTxtFile)
    {
       $ImporteLineEncoded = [system.Text.Encoding]::default.GetBytes($ImportedLine)
       $arrayentropy += entropy-calulate $ImporteLineEncoded 
       entropy-calulate $ImporteLineEncoded >> logs.txt
       $CUrPas >> logs.txt
       $ImportedLine >> logs.txt
       $AdvSt >> logs.txt
       $ImportedLine.length >> logs.txt
       $arraylength += $ImportedLine.length
    }
    $TotalPassword >> stats.txt
    $ImportedTxtFile.Count >> stats.txt
    $AdverageLength >> stats.txt
    $avg = ($arraylength | Measure-Object -Average).Average

    $avgc = $ImportedTxtFile.Count
    $avg2 = $avg / $avgc
    $avg2 >> stats.txt
    $AdverageEnt >> stats.txt
    $AdverageEnt2 = ($arrayentropy | Measure-Object -Average).Average 
    $AdverageEnt3 = $AdverageEnt2 / $avgc 
    $AdverageEnt3 >> stats.txt
}

 function entropy-calulate
{
<#    
      Slight Modification of:
      PowerSploit Function: Get-Entropy
      Author: Matthew Graeber (@mattifestation)
#>
    [CmdletBinding()] Param 
    (
        [Parameter(Mandatory = $True, Position = 0, ValueFromPipeline = $True, ParameterSetName = 'Bytes')]
        [ValidateNotNullOrEmpty()]
        [Byte[]]
        $ByteArray
    )
    BEGIN
    {
        $FrequencyTable = @{}
        $ByteArrayLength = 0
    }

    PROCESS
    {
        foreach ($Byte in $ByteArray)
        {
            $FrequencyTable[$Byte]++
            $ByteArrayLength++
        }
    }

    END
    {
        $Entropy = 0.0

        foreach ($Byte in 0..255)
        {
            $ByteProbability = ([Double] $FrequencyTable[[Byte]$Byte]) / $ByteArrayLength
            if ($ByteProbability -gt 0)
            {
                $Entropy += -$ByteProbability * [Math]::Log($ByteProbability, 2)
                
            }
            
            Write-Output $Entropy
        }
    }
} 



entropy-importtextintoarray
