        # Możesz wykorzystać moduł Hyper-V w PowerShellu
        Add-Type -AssemblyName System.Windows.Forms

        # Tworzenie funkcji do tworzenia maszyn wirtualnych
        function CreateVirtualMachine {
            # Tutaj wpisz kod do tworzenia maszyn wirtualnych na podstawie danych wprowadzonych przez użytkownika
            # Możesz wykorzystać moduł Hyper-V w PowerShellu
            # ...
        }
        
        # Tworzenie funkcji do instalacji systemu operacyjnego
        function InstallOperatingSystem {
            # Tutaj wpisz kod do instalacji systemu operacyjnego na maszynie wirtualnej
            # Możesz wykorzystać narzędzia takie jak Packer
            # ...
        }
        
        # Funkcja obsługująca zdarzenie kliknięcia przycisku "Utwórz maszynę wirtualną"
        function ButtonCreateVM_Click {
            # Tutaj wpisz kod obsługujący zdarzenie kliknięcia przycisku "Utwórz maszynę wirtualną"
            # Pobierz wartości wprowadzone przez użytkownika z pól tekstowych
            # Wywołaj funkcję CreateVirtualMachine z odpowiednimi parametrami
            # ...
        }
        
        # Funkcja obsługująca zdarzenie kliknięcia przycisku "Zainstaluj system operacyjny"
        function ButtonInstallOS_Click {
            # Tutaj wpisz kod obsługujący zdarzenie kliknięcia przycisku "Zainstaluj system operacyjny"
            # Pobierz wartości wprowadzone przez użytkownika z pól tekstowych
            # Wywołaj funkcję InstallOperatingSystem z odpowiednimi parametrami
            # ...
        }
        
        # Tworzenie okna głównego aplikacji
        $mainForm = New-Object System.Windows.Forms.Form
        $mainForm.Text = "Aplikacja do tworzenia maszyn wirtualnych"
        $mainForm.Size = New-Object System.Drawing.Size(400, 300)
        $mainForm.StartPosition = "CenterScreen"
        
        # Tworzenie przycisku "Utwórz maszynę wirtualną"
        $buttonCreateVM = New-Object System.Windows.Forms.Button
        $buttonCreateVM.Text = "Utwórz maszynę wirtualną"
        $buttonCreateVM.Location = New-Object System.Drawing.Point(20, 20)
        $buttonCreateVM.Size = New-Object System.Drawing.Size(150, 30)
        
        # Tworzenie przycisku "Zainstaluj system operacyjny"
        $buttonInstallOS = New-Object System.Windows.Forms.Button
        $buttonInstallOS.Text = "Zainstaluj system operacyjny"
        $buttonInstallOS.Location = New-Object System.Drawing.Point(20, 70)
        $buttonInstallOS.Size = New-Object System.Drawing.Size(150, 30)
        
        # Dodawanie obsługi zdarzeń dla przycisków
        $buttonCreateVM.Add_Click({ ButtonCreateVM_Click })
        $buttonInstallOS.Add_Click({ ButtonInstallOS_Click })
        
        # Dodawanie przycisków do okna głównego aplikacji
        $mainForm.Controls.Add($buttonCreateVM)
        $mainForm.Controls.Add($buttonInstallOS)
        
        # Uruchomienie aplikacji
        $mainForm.ShowDialog()
        