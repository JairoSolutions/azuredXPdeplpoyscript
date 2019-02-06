$SCSDK="D:\azuredeploy91\tools"
$SCTemplates="https://raw.githubusercontent.com/Sitecore/Sitecore-Azure-Quickstart-Templates/master/Sitecore%209.1.0/XPSingle"
$DeploymentId = "naservices"
$ResourceGroup = "naservices"
$LicenseFile = "D:\installer\sc licenses\license.xml"
$CertificateFile = "D:\azuredeploy91\59A194AE0B717FD19681849AF9B22F516EB11D32.pfx"
$SubscriptionId = "16a1fd8b-1684-4b0f-9c72-383d91e35cd7"
$Location="East US"
$ParamFile="D:\azuredeploy91\azuredeploy.parameters.json"
$Parameters = @{
"deploymentId"=$DeploymentId;
"authCertificateBlob" = [System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes($CertificateFile))
}
Import-Module $SCSDK\Sitecore.Cloud.Cmdlets.psm1
Add-AzureRmAccount
Set-AzureRMContext -SubscriptionId $SubscriptionId
Start-SitecoreAzureDeployment -Name $ResourceGroup -Location $Location -ArmTemplateUrl "$SCTemplates/azuredeploy.json" -ArmParametersPath $ParamFile -LicenseXmlPath $LicenseFile -SetKeyValue $Parameters -Verbose
