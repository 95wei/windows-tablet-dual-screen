<#
.SYNOPSIS
Reports the Windows host state for Sunshine and spacedesk.
.DESCRIPTION
Reads Windows services, common TCP listeners, and active desktop displays.
The check runs locally and does not establish a connection to a client.
.PARAMETER Component
Choose All, Sunshine, spacedesk, or Displays.
.EXAMPLE
./scripts/Test-DualScreenHost.ps1 -Component spacedesk
#>
[CmdletBinding()]
param(
    [ValidateSet('All', 'Sunshine', 'spacedesk', 'Displays')]
    [string]$Component = 'All'
)

if ($env:OS -ne 'Windows_NT') {
    throw 'This host check requires Windows.'
}

$servicesToCheck = @{
    Sunshine = @{ ServiceName = 'SunshineService'; Ports = @(47984, 47989, 47990, 48010) }
    spacedesk = @{ ServiceName = 'spacedeskService'; Ports = @(28252) }
}

if ($Component -ne 'Displays') {
    $windowsServices = Get-CimInstance -ClassName Win32_Service -ErrorAction Stop
    $tcpListeners = Get-NetTCPConnection -State Listen -ErrorAction Stop

    $componentsToReport = if ($Component -eq 'All') { 'Sunshine', 'spacedesk' } else { $Component }
    foreach ($componentName in $componentsToReport) {
        $expected = $servicesToCheck[$componentName]
        $service = $windowsServices | Where-Object Name -eq $expected.ServiceName | Select-Object -First 1
        $listeningPorts = @($tcpListeners | Where-Object { $_.LocalPort -in $expected.Ports } |
            Select-Object -ExpandProperty LocalPort -Unique | Sort-Object)

        [pscustomobject]@{
            Component            = $componentName
            ServiceName          = $expected.ServiceName
            ServiceFound         = $null -ne $service
            ServiceState         = $service.State
            StartMode            = $service.StartMode
            DefaultTcpPorts      = $expected.Ports -join ', '
            ListeningTcpPorts    = $listeningPorts -join ', '
        }
    }
}

if ($Component -in 'All', 'Displays') {
    Add-Type -AssemblyName System.Windows.Forms
    $displays = @([System.Windows.Forms.Screen]::AllScreens)
    foreach ($display in $displays) {
        [pscustomobject]@{
            Component  = 'Displays'
            Device     = $display.DeviceName
            Primary    = $display.Primary
            ScreenCount = $displays.Count
            Bounds     = '{0}x{1} at ({2},{3})' -f $display.Bounds.Width, $display.Bounds.Height,
                $display.Bounds.X, $display.Bounds.Y
        }
    }
}
