$sURL = "http://localhost/id"
$sRedirectTo=$null
do {
    $oWebResponse = $null
    try
    {
        $oWebResponse = Invoke-WebRequest $sURL 
    }
    catch 
    {
        $oWebResponse=$_.Exception.Response
        write-host ("Exception: {0}" -f $_.Exception.Message)
    }
	if($oWebResponse.StatusCode -ne 200)
	{
		$aRedirectTo=$oWebResponse.Headers.GetValues("location")
		if($aRedirectTo.Count -ge 1)
		{
			$sRedirectTo=$aRedirectTo[0]
		}
		else
		{
			write-host ("No location URL in header")
			break
		}
		if (-not [string]::IsNullOrEmpty($sRedirectTo))
		{
			write-host ("Redirect to {0}" -f ($sRedirectTo))
			$sURL = $sRedirectTo
		}
		else
		{
			write-host ("location URL Null")
			break
		}
	}
    else
    {
        Write-Output ("OK Location = {1} HttpCode = {0}" -f $oWebResponse.StatusCode,$sRedirectTo )
        Write-Output $oWebResponse.Content
        break
    }
	
} 
while ($true)
