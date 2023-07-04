Add-Type -AssemblyName System.Windows.Forms

# Creating the main form
$mainForm = New-Object System.Windows.Forms.Form
$mainForm.Text = "Virtual Machine Creation Application"
$mainForm.Size = New-Object System.Drawing.Size(600, 400)
$mainForm.StartPosition = "CenterScreen"

# Creating the panel for the first step
$panelName = New-Object System.Windows.Forms.Panel
$panelName.Location = New-Object System.Drawing.Point(0, 0)
$panelName.Size = $mainForm.ClientSize

# Creating the labels and comboboxes for the name format
$labelType = New-Object System.Windows.Forms.Label
$labelType.Text = "Type:"
$labelType.Location = New-Object System.Drawing.Point(20, 20)

$comboboxType = New-Object System.Windows.Forms.ComboBox
$comboboxType.Location = New-Object System.Drawing.Point(180, 20)
$comboboxType.Size = New-Object System.Drawing.Size(200, 20)

# Add the options to the combo box
$comboboxType.Items.Add("F - Fizyczna")
$comboboxType.Items.Add("V - Wirtualna")
$comboboxType.Items.Add("D - Docker")
$comboboxType.Items.Add("C - Chmurowa")

$labelCity = New-Object System.Windows.Forms.Label
$labelCity.Text = "City:"
$labelCity.Location = New-Object System.Drawing.Point(20, 60)

$comboboxCity = New-Object System.Windows.Forms.ComboBox
$comboboxCity.Location = New-Object System.Drawing.Point(180, 60)
$comboboxCity.Size = New-Object System.Drawing.Size(200, 20)

# Add the options to the combo box
$comboboxCity.Items.Add("OPO - Opole")
$comboboxCity.Items.Add("WAW - Warszawa")
$comboboxCity.Items.Add("WYS - WYSOWA ZDROJ")

$labelOwner = New-Object System.Windows.Forms.Label
$labelOwner.Text = "Owner:"
$labelOwner.Location = New-Object System.Drawing.Point(20, 100)

$comboboxOwner = New-Object System.Windows.Forms.ComboBox
$comboboxOwner.Location = New-Object System.Drawing.Point(180, 100)
$comboboxOwner.Size = New-Object System.Drawing.Size(200, 20)

# Add the options to the combo box
$comboboxOwner.Items.Add("AIR - AIRLAN")
$comboboxOwner.Items.Add("AKT - AKOLOTECH")
$comboboxOwner.Items.Add("LKP - ŁUKASZ KOŁODZIEJ")
$comboboxOwner.Items.Add("JDJ - JAKUB DUDA")
$comboboxOwner.Items.Add("DLW - DAWID LAKWA")
$comboboxOwner.Items.Add("OPH - OPHOST")

$labelSystem = New-Object System.Windows.Forms.Label
$labelSystem.Text = "System:"
$labelSystem.Location = New-Object System.Drawing.Point(20, 140)

$comboboxSystem = New-Object System.Windows.Forms.ComboBox
$comboboxSystem.Location = New-Object System.Drawing.Point(180, 140)
$comboboxSystem.Size = New-Object System.Drawing.Size(200, 20)

# Add the options to the combo box
$comboboxSystem.Items.Add("W - Windows")
$comboboxSystem.Items.Add("WS - Windows Server")
$comboboxSystem.Items.Add("L - Linux")
$comboboxSystem.Items.Add("LU - Linux Ubuntu")
$comboboxSystem.Items.Add("LU18 - Linux Ubuntu 18.04 LTS")
$comboboxSystem.Items.Add("LU20 - Linux Ubuntu 20.04 LTS")
$comboboxSystem.Items.Add("LU22 - Linux Ubuntu 22.04 LTS")
$comboboxSystem.Items.Add("LD - Linux Debian")

$labelUsage = New-Object System.Windows.Forms.Label
$labelUsage.Text = "Usage:"
$labelUsage.Location = New-Object System.Drawing.Point(20, 180)

$comboboxUsage = New-Object System.Windows.Forms.ComboBox
$comboboxUsage.Location = New-Object System.Drawing.Point(180, 180)
$comboboxUsage.Size = New-Object System.Drawing.Size(200, 20)

# Add the options to the combo box
$comboboxUsage.Items.Add("APP - Aplikacyjny")
$comboboxUsage.Items.Add("DB - Bazodanowy")
$comboboxUsage.Items.Add("WEB - WEBOWY")
$comboboxUsage.Items.Add("VMH - Host Maszyn Wirtualnych")

$labelNumber = New-Object System.Windows.Forms.Label
$labelNumber.Text = "Number:"
$labelNumber.Location = New-Object System.Drawing.Point(20, 220)

$textboxNumber = New-Object System.Windows.Forms.TextBox
$textboxNumber.Location = New-Object System.Drawing.Point(180, 220)
$textboxNumber.Size = New-Object System.Drawing.Size(200, 20)

# Adding controls to the panel
$panelName.Controls.Add($labelType)
$panelName.Controls.Add($comboboxType)
$panelName.Controls.Add($labelCity)
$panelName.Controls.Add($comboboxCity)
$panelName.Controls.Add($labelOwner)
$panelName.Controls.Add($comboboxOwner)
$panelName.Controls.Add($labelSystem)
$panelName.Controls.Add($comboboxSystem)
$panelName.Controls.Add($labelUsage)
$panelName.Controls.Add($comboboxUsage)
$panelName.Controls.Add($labelNumber)
$panelName.Controls.Add($textboxNumber)

# Creating the "Next" button
$buttonNext = New-Object System.Windows.Forms.Button
$buttonNext.Text = "Next"
$buttonNext.Location = New-Object System.Drawing.Point(500, 350)
$buttonNext.Size = New-Object System.Drawing.Size(80, 30)
$buttonNext.Add_Click({ ButtonNext_Click })

# Function for handling the "Next" button click event
function ButtonNext_Click {
    # Validate input from the first panel
    # ...
    
    # Get the selected values from the combo boxes
    $selectedType = $comboboxType.SelectedItem.ToString().Substring(0, 1)
    $selectedCity = $comboboxCity.SelectedItem.ToString().Substring(0, 3)
    $selectedOwner = $comboboxOwner.SelectedItem.ToString().Substring(0, 3)
    $selectedSystem = $comboboxSystem.SelectedItem.ToString().Substring(0, 2)
    $selectedUsage = $comboboxUsage.SelectedItem.ToString().Substring(0, 3)
    $number = $textboxNumber.Text
    
    # Generate the formatted name
    $formattedName = "$selectedType$selectedCity$selectedOwner$selectedSystem$selectedUsage$number"
    
    # Pass the formatted name to the next panel or store it in a variable for further use
    # ...
    
    # Hide the Name panel and show the next panel
    $panelName.Visible = $false
    $panelNext.Visible = $true
}

# Creating the second panel for VM parameters
$panelParameters = New-Object System.Windows.Forms.Panel
$panelParameters.Location = New-Object System.Drawing.Point(0, 0)
$panelParameters.Size = New-Object System.Drawing.Size(600, 400)
$panelParameters.Visible = $false

$labelCPU = New-Object System.Windows.Forms.Label
$labelCPU.Text = "CPU:"
$labelCPU.Location = New-Object System.Drawing.Point(20, 20)

$textboxCPU = New-Object System.Windows.Forms.TextBox
$textboxCPU.Location = New-Object System.Drawing.Point(180, 20)
$textboxCPU.Size = New-Object System.Drawing.Size(200, 20)

$labelRAM = New-Object System.Windows.Forms.Label
$labelRAM.Text = "RAM:"
$labelRAM.Location = New-Object System.Drawing.Point(20, 60)

$textboxRAM = New-Object System.Windows.Forms.TextBox
$textboxRAM.Location = New-Object System.Drawing.Point(180, 60)
$textboxRAM.Size = New-Object System.Drawing.Size(200, 20)

$labelDiskSize = New-Object System.Windows.Forms.Label
$labelDiskSize.Text = "Disk Size:"
$labelDiskSize.Location = New-Object System.Drawing.Point(20, 100)

$textboxDiskSize = New-Object System.Windows.Forms.TextBox
$textboxDiskSize.Location = New-Object System.Drawing.Point(180, 100)
$textboxDiskSize.Size = New-Object System.Drawing.Size(200, 20)

# Creating the "Next" button for the second panel
$buttonNext2 = New-Object System.Windows.Forms.Button
$buttonNext2.Text = "Next"
$buttonNext2.Location = New-Object System.Drawing.Point(500, 350)
$buttonNext2.Size = New-Object System.Drawing.Size(80, 30)
$buttonNext2.Add_Click({ ButtonNext2_Click })

# Function for handling the "Next" button click event for the second panel
function ButtonNext2_Click {
    # Validate input from the second panel
    # ...
    
    # Get the values entered by the user
    $cpu = $textboxCPU.Text
    $ram = $textboxRAM.Text
    $diskSize = $textboxDiskSize.Text
    
    # Pass the values to the next panel or store them in variables for further use
    # ...
    
    # Hide the Parameters panel and show the next panel
    $panelParameters.Visible = $false
    $panelNext.Visible = $true
}

# Adding controls to the second panel
$panelParameters.Controls.Add($labelCPU)
$panelParameters.Controls.Add($textboxCPU)
$panelParameters.Controls.Add($labelRAM)
$panelParameters.Controls.Add($textboxRAM)
$panelParameters.Controls.Add($labelDiskSize)
$panelParameters.Controls.Add($textboxDiskSize)

# Adding the "Next" button for the second panel
$panelParameters.Controls.Add($buttonNext2)

# Adding the second panel to the main form
$mainForm.Controls.Add($panelParameters)




# Adding controls to the main form
$mainForm.Controls.Add($panelName)
$mainForm.Controls.Add($buttonNext)

# Running the application
$mainForm.ShowDialog()
