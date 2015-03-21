param($installPath, $toolsPath, $package, $project)


function RemoveForceProjectLevelHack($project)
{
    Write-Host "RemoveForceProjectLevelHack" 
	Foreach ($item in $project.ProjectItems) 
	{
		if ($item.Name.EndsWith("ToBeDeleted.txt"))
		{
			$item.Delete()
		}
	}
}

function FlushVariables()
{
    Write-Host "Flushing environment variables"
    $env:FodyLastProjectPath = ""
    $env:FodyLastWeaverName = ""
    $env:FodyLastXmlContents = ""
}

function Fix-ReferencesCopyLocal($package, $project)
{
    Write-Host "Fix-ReferencesCopyLocal $($package.Id)"
    $asms = $package.AssemblyReferences | %{$_.Name}
 
    foreach ($reference in $project.Object.References)
    {
        if ($asms -contains $reference.Name + ".dll")
        {
            if($reference.CopyLocal -eq $true)
            {
                $reference.CopyLocal = $false;
            }
        }
    }
}

function UnlockWeaversXml($project)
{
    $fodyWeaversProjectItem = $project.ProjectItems.Item("FodyWeavers.xml");
    if ($fodyWeaversProjectItem)
    {
        $fodyWeaversProjectItem.Open("{7651A701-06E5-11D1-8EBD-00A0C90F26EA}")
        $fodyWeaversProjectItem.Save()
		$fodyWeaversProjectItem.Document.Close()
    }   
}

UnlockWeaversXml($project)

RemoveForceProjectLevelHack $project

Fix-ReferencesCopyLocal $package $project