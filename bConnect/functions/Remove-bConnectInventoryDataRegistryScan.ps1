﻿function Remove-bConnectInventoryDataRegistryScan
{
<#
	.SYNOPSIS
		Remove all registry scans from specified endpoint.
	
	.DESCRIPTION
		Remove all registry scans from specified endpoint.
	
	.PARAMETER EndpointGuid
		Valid GUID of a endpoint.
#>	
	[CmdletBinding(SupportsShouldProcess = $true)]
	param
	(
		[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
		[PsfValidatePattern('\b[A-F0-9]{8}(?:-[A-F0-9]{4}){3}-[A-F0-9]{12}\b', ErrorMessage = 'Failed to parse input as guid: {0}')]
		[string]
		$EndpointGuid
	)
	
	begin
	{
		Assert-bConnectConnection
	}
	process
	{
		$body = @{
			EndpointId = $EndpointGuid;
		}
		
		if (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $EndpointGuid -Action 'Remove InventoryDataRegistryScan')
		{
			Invoke-bConnectDelete -Controller "InventoryDataRegistryScans" -Data $body
		}
	}
}
