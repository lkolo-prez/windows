param (
    [Parameter(Mandatory=$true)]
    [string]$VMName,

    [Parameter(Mandatory=$true)]
    [string]$VMPath,

    [Parameter(Mandatory=$true)]
    [string]$VHDPath,

    [Parameter(Mandatory=$true)]
    [string]$SwitchName,

    [Parameter(Mandatory=$true)]
    [int]$MemoryGB,

    [Parameter(Mandatory=$true)]
    [int]$CPUCount,

    [Parameter(Mandatory=$false)]
    [string]$BootDevice = "VHD",

    [Parameter(Mandatory=$true)]
    [string]$ISOPath,

    [Parameter(Mandatory=$true)]
    [int]$Generation = 2,

    [Parameter(Mandatory=$true)]
    [int]$DynamicMemoryMinimumMB,

    [Parameter(Mandatory=$true)]
    [int]$DynamicMemoryMaximumMB,

    [Parameter(Mandatory=$true)]
    [switch]$DynamicMemoryEnabled,

    [Parameter(Mandatory=$true)]
    [switch]$SecureBootEnabled,

    [Parameter(Mandatory=$false)]
    [switch]$EnableTPM,

    [Parameter(Mandatory=$false)]
    [int]$NumaNodesCount
)

# Tworzenie konfiguracji maszyny wirtualnej
$VMConfig = New-VM -Name $VMName -Path $VMPath -SwitchName $SwitchName -Generation $Generation

# Ustalenie rozmiaru pamięci RAM
if ($DynamicMemoryEnabled) {
    Set-VMMemory -VMName $VMName -DynamicMemoryEnabled $true -MinimumBytes ($DynamicMemoryMinimumMB * 1MB) -MaximumBytes ($DynamicMemoryMaximumMB * 1MB)
} else {
    Set-VMMemory -VMName $VMName -StartupBytes ($MemoryGB * 1GB) -MinimumBytes ($MemoryGB * 1GB) -MaximumBytes ($MemoryGB * 1GB)
}

# Ustalenie liczby procesorów
Set-VMProcessor -VMName $VMName -Count $CPUCount

# Tworzenie dysku wirtualnego
$VHDSize = (Get-ChildItem $VHDPath).Length
$VHDName = Split-Path -Leaf $VHDPath
Add-VMHardDiskDrive -VMName $VMName -Path $VHDPath -SizeBytes $VHDSize

# Podłączenie pliku ISO
if ($ISOPath) {
    $DVDDrive = Get-VMDvdDrive -VMName $VMName | Where-Object {$_.ControllerLocation -eq 0}
    Set-VMDvdDrive -VMName $VMName -ControllerNumber $DVDDrive.ControllerNumber -ControllerLocation $DVDDrive.ControllerLocation -Path $ISOPath
}

# Konfiguracja opcji dodatkowych
Set-VMFirmware -VMName $VMName -EnableSecureBoot $SecureBootEnabled -EnableTPM $EnableTPM
Set-VMNumaNode -VMName $VMName -Count $NumaNodesCount

# Ustawienie urządzenia rozruchowego
Set-VMFirmware -VMName $VMName -FirstBootDevice $BootDevice

# Uruchamianie maszyny wirtualnej
Start-VM -VMName $VMName
