Add-Type -AssemblyName System.Windows.Forms

# Tworzenie okna głównego
$mainForm = New-Object System.Windows.Forms.Form
$mainForm.Text = "Aplikacja do tworzenia maszyn wirtualnych"
$mainForm.Size = New-Object System.Drawing.Size(400, 300)
$mainForm.StartPosition = "CenterScreen"

# Tworzenie etykiet
$labelName = New-Object System.Windows.Forms.Label
$labelName.Text = "Nazwa maszyny:"
$labelName.Location = New-Object System.Drawing.Point(20, 20)

$labelType = New-Object System.Windows.Forms.Label
$labelType.Text = "Typ maszyny:"
$labelType.Location = New-Object System.Drawing.Point(20, 60)

$labelLocation = New-Object System.Windows.Forms.Label
$labelLocation.Text = "Lokalizacja plików VHD/VHDX:"
$labelLocation.Location = New-Object System.Drawing.Point(20, 100)

# Tworzenie pól tekstowych
$textboxName = New-Object System.Windows.Forms.TextBox
$textboxName.Location = New-Object System.Drawing.Point(180, 20)
$textboxName.Size = New-Object System.Drawing.Size(200, 20)

$textboxType = New-Object System.Windows.Forms.TextBox
$textboxType.Location = New-Object System.Drawing.Point(180, 60)
$textboxType.Size = New-Object System.Drawing.Size(200, 20)

$textboxLocation = New-Object System.Windows.Forms.TextBox
$textboxLocation.Location = New-Object System.Drawing.Point(180, 100)
$textboxLocation.Size = New-Object System.Drawing.Size(200, 20)

# Tworzenie przycisków
$buttonCreateVM = New-Object System.Windows.Forms.Button
$buttonCreateVM.Text = "Utwórz maszynę wirtualną"
$buttonCreateVM.Location = New-Object System.Drawing.Point(20, 150)

$buttonInstallOS = New-Object System.Windows.Forms.Button
$buttonInstallOS.Text = "Zainstaluj system operacyjny"
$buttonInstallOS.Location = New-Object System.Drawing.Point(180, 150)

# Dodawanie kontrolek do okna
$mainForm.Controls.Add($labelName)
$mainForm.Controls.Add($labelType)
$mainForm.Controls.Add($labelLocation)
$mainForm.Controls.Add($textboxName)
$mainForm.Controls.Add($textboxType)
$mainForm.Controls.Add($textboxLocation)
$mainForm.Controls.Add($buttonCreateVM)
$mainForm.Controls.Add($buttonInstallOS)

# Obsługa zdarzenia kliknięcia przycisku "Utwórz maszynę wirtualną"
$buttonCreateVM.Add_Click({
    # Tutaj dodajemy kod do utworzenia maszyny wirtualnej na podstawie wprowadzonych danych
})

# Obsługa zdarzenia kliknięcia przycisku "Zainstaluj system operacyjny"
$buttonInstallOS.Add_Click({
    # Tutaj dodajemy kod do instalacji systemu operacyjnego na maszynie wirtualnej
})

# Uruchomienie aplikacji
$mainForm.ShowDialog()

