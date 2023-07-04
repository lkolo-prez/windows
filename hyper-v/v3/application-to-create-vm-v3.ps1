# Dodajemy moduł Hyper-V
Import-Module Hyper-V

# Tworzenie funkcji do tworzenia maszyn wirtualnych
function CreateVirtualMachine {
    # Pobierz wartości wprowadzone przez użytkownika z pól tekstowych
    $vmName = $textboxName.Text
    $vmType = $textboxType.Text
    $vmLocation = $textboxLocation.Text
    
    # Tutaj wpisz kod do tworzenia maszyn wirtualnych na podstawie danych wprowadzonych przez użytkownika
    # Wykorzystaj moduł Hyper-V w PowerShellu
    
    # Przykład kodu tworzącego maszynę wirtualną
    # Pamiętaj, że to tylko przykład, a faktyczna implementacja może się różnić w zależności od Twoich wymagań
    $vm = New-VM -Name $vmName -Path $vmLocation -MemoryStartupBytes 2GB
    
    # Wyświetlanie komunikatu o utworzeniu maszyny wirtualnej
    Write-Host "Utworzono maszynę wirtualną: $vmName"
}

# Tworzenie funkcji do instalacji systemu operacyjnego
function InstallOperatingSystem {
    # Pobierz wartości wprowadzone przez użytkownika z pól tekstowych
    $vmName = $textboxName.Text
    $os = $textboxOS.Text
    
    # Tutaj wpisz kod do instalacji systemu operacyjnego na maszynie wirtualnej
    # Możesz wykorzystać narzędzia takie jak Packer
    
    # Przykład kodu instalującego system operacyjny na maszynie wirtualnej
    # Pamiętaj, że to tylko przykład, a faktyczna implementacja może się różnić w zależności od Twoich wymagań
    Write-Host "Instalacja systemu operacyjnego $os na maszynie wirtualnej: $vmName"
}

# Funkcja obsługująca zdarzenie kliknięcia przycisku "Utwórz maszynę wirtualną"
function ButtonCreateVM_Click {
    # Pobierz wartości wprowadzone przez użytkownika z pól tekstowych
    $vmName = $textboxName.Text
    $vmType = $textboxType.Text
    $vmLocation = $textboxLocation.Text
    
    # Wywołaj funkcję do tworzenia maszyny wirtualnej
    CreateVirtualMachine
}

# Funkcja obsługująca zdarzenie kliknięcia przycisku "Zainstaluj system operacyjny"
function ButtonInstallOS_Click {
    # Pobierz wartości wprowadzone przez użytkownika z pól tekstowych
    $vmName = $textboxName.Text
    $os = $textboxOS.Text
    
    # Wywołaj funkcję do instalacji systemu operacyjnego
    InstallOperatingSystem
}

# Tworzenie okna głównego aplikacji
$mainForm = New-Object System.Windows.Forms.Form
$mainForm.Text = "Aplikacja do tworzenia maszyn wirtualnych"
$mainForm.Size = New-Object System.Drawing.Size(400, 300)
$mainForm.StartPosition = "CenterScreen"

# Tworzenie etykiety i pola tekstowego dla nazwy maszyny wirtualnej
$labelName = New-Object System.Windows.Forms.Label
$labelName.Text = "Nazwa maszyny:"
$labelName.Location = New-Object System.Drawing.Point(20, 20)

$textboxName = New-Object System.Windows.Forms.TextBox
$textboxName.Location = New-Object System.Drawing.Point(180, 20)
$textboxName.Size = New-Object System.Drawing.Size(200, 20)

# Tworzenie etykiety i pola tekstowego dla typu maszyny wirtualnej
$labelType = New-Object System.Windows.Forms.Label
$labelType.Text = "Typ maszyny:"
$labelType.Location = New-Object System.Drawing.Point(20, 60)

$textboxType = New-Object System.Windows.Forms.TextBox
$textboxType.Location = New-Object System.Drawing.Point(180, 60)
$textboxType.Size = New-Object System.Drawing.Size(200, 20)

# Tworzenie etykiety i pola tekstowego dla lokalizacji plików VHD/VHDX
$labelLocation = New-Object System.Windows.Forms.Label
$labelLocation.Text = "Lokalizacja plików VHD/VHDX:"
$labelLocation.Location = New-Object System.Drawing.Point(20, 100)

$textboxLocation = New-Object System.Windows.Forms.TextBox
$textboxLocation.Location = New-Object System.Drawing.Point(180, 100)
$textboxLocation.Size = New-Object System.Drawing.Size(200, 20)

# Tworzenie etykiety i pola tekstowego dla systemu operacyjnego
$labelOS = New-Object System.Windows.Forms.Label
$labelOS.Text = "System operacyjny:"
$labelOS.Location = New-Object System.Drawing.Point(20, 140)

$textboxOS = New-Object System.Windows.Forms.TextBox
$textboxOS.Location = New-Object System.Drawing.Point(180, 140)
$textboxOS.Size = New-Object System.Drawing.Size(200, 20)

# Tworzenie przycisku "Utwórz maszynę wirtualną"
$buttonCreateVM = New-Object System.Windows.Forms.Button
$buttonCreateVM.Text = "Utwórz maszynę wirtualną"
$buttonCreateVM.Location = New-Object System.Drawing.Point(20, 180)
$buttonCreateVM.Size = New-Object System.Drawing.Size(150, 30)

# Tworzenie przycisku "Zainstaluj system operacyjny"
$buttonInstallOS = New-Object System.Windows.Forms.Button
$buttonInstallOS.Text = "Zainstaluj system operacyjny"
$buttonInstallOS.Location = New-Object System.Drawing.Point(20, 230)
$buttonInstallOS.Size = New-Object System.Drawing.Size(150, 30)

# Dodawanie obsługi zdarzeń dla przycisków
$buttonCreateVM.Add_Click({ ButtonCreateVM_Click })
$buttonInstallOS.Add_Click({ ButtonInstallOS_Click })

# Dodawanie kontrolki do okna głównego aplikacji
$mainForm.Controls.Add($labelName)
$mainForm.Controls.Add($textboxName)
$mainForm.Controls.Add($labelType)
$mainForm.Controls.Add($textboxType)
$mainForm.Controls.Add($labelLocation)
$mainForm.Controls.Add($textboxLocation)
$mainForm.Controls.Add($labelOS)
$mainForm.Controls.Add($textboxOS)
$mainForm.Controls.Add($buttonCreateVM)
$mainForm.Controls.Add($buttonInstallOS)

# Uruchomienie aplikacji
$mainForm.ShowDialog()
