Add-Type -AssemblyName System.Windows.Forms

# Tworzenie funkcji do tworzenia maszyn wirtualnych
function CreateVirtualMachine {
    # Pobierz wartości wprowadzone przez użytkownika z pól tekstowych
    $vmType = $textboxType.Text
    $vmCity = $textboxCity.Text
    $vmOwner = $textboxOwner.Text
    $vmSystem = $textboxSystem.Text
    $vmUsage = $textboxUsage.Text
    $vmNumber = $textboxNumber.Text
    
    # Tworzenie nazwy maszyny wirtualnej na podstawie konwencji nazewniczej
    $vmName = "V$vmType$vmCity$vmOwner$vmSystem$vmUsage$vmNumber"
    
    # Pobieranie wartości parametrów maszyny wirtualnej
    $cpu = $textboxCPU.Text
    $ram = $textboxRAM.Text
    $diskPath = $textboxDiskPath.Text
    
    # Dodatkowe opcje konfiguracji maszyny wirtualnej
    $BootDevice = "VHD"
    $ISOPath = $textboxISOPath.Text
    $Generation = 2
    $DynamicMemoryMinimumMB = $textboxDynamicMemoryMin.Text
    $DynamicMemoryMaximumMB = $textboxDynamicMemoryMax.Text
    $DynamicMemoryEnabled = $checkboxDynamicMemory.Checked
    $SecureBootEnabled = $checkboxSecureBoot.Checked
    $EnableTPM = $checkboxEnableTPM.Checked
    $NumaNodesCount = $textboxNumaNodes.Text
    
    # Tworzenie maszyny wirtualnej na podstawie wprowadzonych danych
    $vm = New-VM -Name $vmName -Path $vmLocation -Generation $Generation -BootDevice $BootDevice -SwitchName $vmSwitch -MemoryStartupBytes $ram -ProcessorCount $cpu -DynamicMemory -MemoryMinimumBytes $DynamicMemoryMinimumMB -MemoryMaximumBytes $DynamicMemoryMaximumMB -SecureBootEnabled $SecureBootEnabled -EnableTPM $EnableTPM -NumaNodesCount $NumaNodesCount
    
    # Dodanie dysku do maszyny wirtualnej
    $disk = New-VHD -Path $diskPath -SizeBytes 10GB
    Add-VMHardDiskDrive -VMName $vmName -Path $disk.Path
    
    # Podłączenie napędu DVD z plikiem ISO
    Set-VMDvdDrive -VMName $vmName -Path $ISOPath
    
    # Uruchomienie maszyny wirtualnej
    Start-VM -VMName $vmName
    
    # Wyświetlenie komunikatu o utworzeniu maszyny wirtualnej
    Write-Host "Utworzono maszynę wirtualną: $vmName"
}

# Funkcja obsługująca zdarzenie kliknięcia przycisku "Utwórz maszynę wirtualną"
function ButtonCreateVM_Click {
    # Sprawdź poprawność wprowadzonych danych przez użytkownika
    if (ValidateInputs) {
        # Wywołaj funkcję do tworzenia maszyny wirtualnej
        CreateVirtualMachine
    }
}

# Funkcja sprawdzająca poprawność wprowadzonych danych przez użytkownika
function ValidateInputs {
    # Tutaj wpisz kod do walidacji wprowadzonych danych
    # Sprawdź czy pola tekstowe nie są puste, czy wartości są w odpowiednich zakresach, etc.
    # Jeśli wszystkie dane są poprawne, zwróć $true. W przeciwnym razie, wyświetl komunikat o błędzie i zwróć $false.
    # ...
    return $true
}

# Tworzenie okna głównego aplikacji
$mainForm = New-Object System.Windows.Forms.Form
$mainForm.Text = "Aplikacja do tworzenia maszyn wirtualnych"
$mainForm.Size = New-Object System.Drawing.Size(600, 400)
$mainForm.StartPosition = "CenterScreen"

# Tworzenie etykiet i pól tekstowych dla nazwy maszyny wirtualnej
$labelType = New-Object System.Windows.Forms.Label
$labelType.Text = "Typ serwera:"
$labelType.Location = New-Object System.Drawing.Point(20, 20)

$textboxType = New-Object System.Windows.Forms.TextBox
$textboxType.Location = New-Object System.Drawing.Point(180, 20)
$textboxType.Size = New-Object System.Drawing.Size(200, 20)

$labelCity = New-Object System.Windows.Forms.Label
$labelCity.Text = "Miasto:"
$labelCity.Location = New-Object System.Drawing.Point(20, 60)

$textboxCity = New-Object System.Windows.Forms.TextBox
$textboxCity.Location = New-Object System.Drawing.Point(180, 60)
$textboxCity.Size = New-Object System.Drawing.Size(200, 20)

$labelOwner = New-Object System.Windows.Forms.Label
$labelOwner.Text = "Właściciel:"
$labelOwner.Location = New-Object System.Drawing.Point(20, 100)

$textboxOwner = New-Object System.Windows.Forms.TextBox
$textboxOwner.Location = New-Object System.Drawing.Point(180, 100)
$textboxOwner.Size = New-Object System.Drawing.Size(200, 20)

$labelSystem = New-Object System.Windows.Forms.Label
$labelSystem.Text = "System:"
$labelSystem.Location = New-Object System.Drawing.Point(20, 140)

$textboxSystem = New-Object System.Windows.Forms.TextBox
$textboxSystem.Location = New-Object System.Drawing.Point(180, 140)
$textboxSystem.Size = New-Object System.Drawing.Size(200, 20)

$labelUsage = New-Object System.Windows.Forms.Label
$labelUsage.Text = "Zastosowanie:"
$labelUsage.Location = New-Object System.Drawing.Point(20, 180)

$textboxUsage = New-Object System.Windows.Forms.TextBox
$textboxUsage.Location = New-Object System.Drawing.Point(180, 180)
$textboxUsage.Size = New-Object System.Drawing.Size(200, 20)

$labelNumber = New-Object System.Windows.Forms.Label
$labelNumber.Text = "Numeracja:"
$labelNumber.Location = New-Object System.Drawing.Point(20, 220)

$textboxNumber = New-Object System.Windows.Forms.TextBox
$textboxNumber.Location = New-Object System.Drawing.Point(180, 220)
$textboxNumber.Size = New-Object System.Drawing.Size(200, 20)

# Tworzenie etykiet i pól tekstowych dla parametrów maszyny wirtualnej
$labelCPU = New-Object System.Windows.Forms.Label
$labelCPU.Text = "CPU:"
$labelCPU.Location = New-Object System.Drawing.Point(20, 260)

$textboxCPU = New-Object System.Windows.Forms.TextBox
$textboxCPU.Location = New-Object System.Drawing.Point(180, 260)
$textboxCPU.Size = New-Object System.Drawing.Size(200, 20)

$labelRAM = New-Object System.Windows.Forms.Label
$labelRAM.Text = "RAM:"
$labelRAM.Location = New-Object System.Drawing.Point(20, 300)

$textboxRAM = New-Object System.Windows.Forms.TextBox
$textboxRAM.Location = New-Object System.Drawing.Point(180, 300)
$textboxRAM.Size = New-Object System.Drawing.Size(200, 20)

$labelDiskPath = New-Object System.Windows.Forms.Label
$labelDiskPath.Text = "Ścieżka dysku:"
$labelDiskPath.Location = New-Object System.Drawing.Point(20, 340)

$textboxDiskPath = New-Object System.Windows.Forms.TextBox
$textboxDiskPath.Location = New-Object System.Drawing.Point(180, 340)
$textboxDiskPath.Size = New-Object System.Drawing.Size(200, 20)

# Tworzenie etykiety i pola tekstowego dla ścieżki do pliku ISO
$labelISOPath = New-Object System.Windows.Forms.Label
$labelISOPath.Text = "Ścieżka ISO:"
$labelISOPath.Location = New-Object System.Drawing.Point(20, 380)

$textboxISOPath = New-Object System.Windows.Forms.TextBox
$textboxISOPath.Location = New-Object System.Drawing.Point(180, 380)
$textboxISOPath.Size = New-Object System.Drawing.Size(200, 20)

# Tworzenie etykiety i pola tekstowego dla minimalnej pamięci RAM
$labelDynamicMemoryMin = New-Object System.Windows.Forms.Label
$labelDynamicMemoryMin.Text = "Dynamiczna pamięć (min):"
$labelDynamicMemoryMin.Location = New-Object System.Drawing.Point(20, 420)

$textboxDynamicMemoryMin = New-Object System.Windows.Forms.TextBox
$textboxDynamicMemoryMin.Location = New-Object System.Drawing.Point(180, 420)
$textboxDynamicMemoryMin.Size = New-Object System.Drawing.Size(200, 20)

# Tworzenie etykiety i pola tekstowego dla maksymalnej pamięci RAM
$labelDynamicMemoryMax = New-Object System.Windows.Forms.Label
$labelDynamicMemoryMax.Text = "Dynamiczna pamięć (max):"
$labelDynamicMemoryMax.Location = New-Object System.Drawing.Point(20, 460)

$textboxDynamicMemoryMax = New-Object System.Windows.Forms.TextBox
$textboxDynamicMemoryMax.Location = New-Object System.Drawing.Point(180, 460)
$textboxDynamicMemoryMax.Size = New-Object System.Drawing.Size(200, 20)

# Tworzenie kontrolki CheckBox dla dynamicznej pamięci RAM
$checkboxDynamicMemory = New-Object System.Windows.Forms.CheckBox
$checkboxDynamicMemory.Text = "Włącz dynamiczną pamięć RAM"
$checkboxDynamicMemory.Location = New-Object System.Drawing.Point(20, 500)

# Tworzenie kontrolki CheckBox dla Secure Boot
$checkboxSecureBoot = New-Object System.Windows.Forms.CheckBox
$checkboxSecureBoot.Text = "Włącz Secure Boot"
$checkboxSecureBoot.Location = New-Object System.Drawing.Point(20, 540)

# Tworzenie kontrolki CheckBox dla modułu TPM
$checkboxEnableTPM = New-Object System.Windows.Forms.CheckBox
$checkboxEnableTPM.Text = "Włącz moduł TPM"
$checkboxEnableTPM.Location = New-Object System.Drawing.Point(20, 580)

# Tworzenie etykiety i pola tekstowego dla liczby węzłów NUMA
$labelNumaNodes = New-Object System.Windows.Forms.Label
$labelNumaNodes.Text = "Liczba węzłów NUMA:"
$labelNumaNodes.Location = New-Object System.Drawing.Point(20, 620)

$textboxNumaNodes = New-Object System.Windows.Forms.TextBox
$textboxNumaNodes.Location = New-Object System.Drawing.Point(180, 620)
$textboxNumaNodes.Size = New-Object System.Drawing.Size(200, 20)

# Tworzenie przycisku "Utwórz maszynę wirtualną"
$buttonCreateVM = New-Object System.Windows.Forms.Button
$buttonCreateVM.Text = "Utwórz maszynę wirtualną"
$buttonCreateVM.Location = New-Object System.Drawing.Point(20, 660)
$buttonCreateVM.Size = New-Object System.Drawing.Size(150, 30)

# Dodawanie obsługi zdarzeń dla przycisków
$buttonCreateVM.Add_Click({ ButtonCreateVM_Click })

# Dodawanie kontrolki do okna głównego aplikacji
$mainForm.Controls.Add($labelType)
$mainForm.Controls.Add($textboxType)
$mainForm.Controls.Add($labelCity)
$mainForm.Controls.Add($textboxCity)
$mainForm.Controls.Add($labelOwner)
$mainForm.Controls.Add($textboxOwner)
$mainForm.Controls.Add($labelSystem)
$mainForm.Controls.Add($textboxSystem)
$mainForm.Controls.Add($labelUsage)
$mainForm.Controls.Add($textboxUsage)
$mainForm.Controls.Add($labelNumber)
$mainForm.Controls.Add($textboxNumber)
$mainForm.Controls.Add($labelCPU)
$mainForm.Controls.Add($textboxCPU)
$mainForm.Controls.Add($labelRAM)
$mainForm.Controls.Add($textboxRAM)
$mainForm.Controls.Add($labelDiskPath)
$mainForm.Controls.Add($textboxDiskPath)
$mainForm.Controls.Add($labelISOPath)
$mainForm.Controls.Add($textboxISOPath)
$mainForm.Controls.Add($labelDynamicMemoryMin)
$mainForm.Controls.Add($textboxDynamicMemoryMin)
$mainForm.Controls.Add($labelDynamicMemoryMax)
$mainForm.Controls.Add($textboxDynamicMemoryMax)
$mainForm.Controls.Add($checkboxDynamicMemory)
$mainForm.Controls.Add($checkboxSecureBoot)
$mainForm.Controls.Add($checkboxEnableTPM)
$mainForm.Controls.Add($labelNumaNodes)
$mainForm.Controls.Add($textboxNumaNodes)
$mainForm.Controls.Add($buttonCreateVM)

# Uruchomienie aplikacji
$mainForm.ShowDialog()
