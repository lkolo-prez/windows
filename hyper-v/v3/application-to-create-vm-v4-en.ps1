Add-Type -AssemblyName System.Windows.Forms

# Creating the main form
$mainForm = New-Object System.Windows.Forms.Form
$mainForm.Text = "Virtual Machine Creation Application"
$mainForm.Size = New-Object System.Drawing.Size(600, 400)
$mainForm.StartPosition = "CenterScreen"

# Creating the labels and textboxes for VM details
$labelType = New-Object System.Windows.Forms.Label
$labelType.Text = "Server Type:"
$labelType.Location = New-Object System.Drawing.Point(20, 20)

$textboxType = New-Object System.Windows.Forms.TextBox
$textboxType.Location = New-Object System.Drawing.Point(180, 20)
$textboxType.Size = New-Object System.Drawing.Size(200, 20)

$labelCity = New-Object System.Windows.Forms.Label
$labelCity.Text = "City:"
$labelCity.Location = New-Object System.Drawing.Point(20, 60)

$textboxCity = New-Object System.Windows.Forms.TextBox
$textboxCity.Location = New-Object System.Drawing.Point(180, 60)
$textboxCity.Size = New-Object System.Drawing.Size(200, 20)

$labelOwner = New-Object System.Windows.Forms.Label
$labelOwner.Text = "Owner:"
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
$labelUsage.Text = "Usage:"
$labelUsage.Location = New-Object System.Drawing.Point(20, 180)

$textboxUsage = New-Object System.Windows.Forms.TextBox
$textboxUsage.Location = New-Object System.Drawing.Point(180, 180)
$textboxUsage.Size = New-Object System.Drawing.Size(200, 20)

$labelNumber = New-Object System.Windows.Forms.Label
$labelNumber.Text = "Number:"
$labelNumber.Location = New-Object System.Drawing.Point(20, 220)

$textboxNumber = New-Object System.Windows.Forms.TextBox
$textboxNumber.Location = New-Object System.Drawing.Point(180, 220)
$textboxNumber.Size = New-Object System.Drawing.Size(200, 20)

# Creating the labels and textboxes for VM parameters
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

#$labelDiskPath = New-Object System.Windows.Forms.Label
#$labelDiskPath.Text = "Disk Path:"
#$labelDiskPath.Location = New-Object System.Drawing.Point(20, 340)

#$textboxDiskPath = New-Object System.Windows.Forms.TextBox
#$textboxDiskPath.Location = New-Object System.Drawing.Point(180, 340)
#$textboxDiskPath.Size = New-Object System.Drawing.Size(200, 20)

# Creating the label and textbox for ISO path
$labelISOPath = New-Object System.Windows.Forms.Label
$labelISOPath.Text = "ISO Path:"
$labelISOPath.Location = New-Object System.Drawing.Point(20, 380)

$textboxISOPath = New-Object System.Windows.Forms.TextBox
$textboxISOPath.Location = New-Object System.Drawing.Point(180, 380)
$textboxISOPath.Size = New-Object System.Drawing.Size(200, 20)

# Creating the label and textbox for dynamic memory minimum
$labelDynamicMemoryMin = New-Object System.Windows.Forms.Label
$labelDynamicMemoryMin.Text = "Dynamic Memory (Min):"
$labelDynamicMemoryMin.Location = New-Object System.Drawing.Point(20, 420)

$textboxDynamicMemoryMin = New-Object System.Windows.Forms.TextBox
$textboxDynamicMemoryMin.Location = New-Object System.Drawing.Point(180, 420)
$textboxDynamicMemoryMin.Size = New-Object System.Drawing.Size(200, 20)

# Creating the label and textbox for dynamic memory maximum
$labelDynamicMemoryMax = New-Object System.Windows.Forms.Label
$labelDynamicMemoryMax.Text = "Dynamic Memory (Max):"
$labelDynamicMemoryMax.Location = New-Object System.Drawing.Point(20, 460)

$textboxDynamicMemoryMax = New-Object System.Windows.Forms.TextBox
$textboxDynamicMemoryMax.Location = New-Object System.Drawing.Point(180, 460)
$textboxDynamicMemoryMax.Size = New-Object System.Drawing.Size(200, 20)

# Creating the checkbox for dynamic memory
$checkboxDynamicMemory = New-Object System.Windows.Forms.CheckBox
$checkboxDynamicMemory.Text = "Enable Dynamic Memory"
$checkboxDynamicMemory.Location = New-Object System.Drawing.Point(20, 500)

# Creating the checkbox for Secure Boot
$checkboxSecureBoot = New-Object System.Windows.Forms.CheckBox
$checkboxSecureBoot.Text = "Enable Secure Boot"
$checkboxSecureBoot.Location = New-Object System.Drawing.Point(20, 540)

# Creating the checkbox for TPM
$checkboxEnableTPM = New-Object System.Windows.Forms.CheckBox
$checkboxEnableTPM.Text = "Enable TPM"
$checkboxEnableTPM.Location = New-Object System.Drawing.Point(20, 580)

# Creating the label and textbox for Numa Nodes
$labelNumaNodes = New-Object System.Windows.Forms.Label
$labelNumaNodes.Text = "Numa Nodes:"
$labelNumaNodes.Location = New-Object System.Drawing.Point(20, 620)

$textboxNumaNodes = New-Object System.Windows.Forms.TextBox
$textboxNumaNodes.Location = New-Object System.Drawing.Point(180, 620)
$textboxNumaNodes.Size = New-Object System.Drawing.Size(200, 20)

# Creating the checked list box for disk options
$checkedListBoxDiskOptions = New-Object System.Windows.Forms.CheckedListBox
$checkedListBoxDiskOptions.Location = New-Object System.Drawing.Point(20, 320)
$checkedListBoxDiskOptions.Size = New-Object System.Drawing.Size(300, 100)
$checkedListBoxDiskOptions.CheckOnClick = $true

# Adding disk options to the checked list box
$checkedListBoxDiskOptions.Items.Add("Existing Disk")
$checkedListBoxDiskOptions.Items.Add("New Disk")

# Creating the textbox for disk path
$textboxDiskPath = New-Object System.Windows.Forms.TextBox
$textboxDiskPath.Location = New-Object System.Drawing.Point(140, 30)
$textboxDiskPath.Size = New-Object System.Drawing.Size(150, 20)

# Creating the "Create Disk" button
$buttonCreateDisk = New-Object System.Windows.Forms.Button
$buttonCreateDisk.Text = "Create Disk"
$buttonCreateDisk.Location = New-Object System.Drawing.Point(140, 60)
$buttonCreateDisk.Size = New-Object System.Drawing.Size(100, 30)

# Adding event handling for the "Create Disk" button
$buttonCreateDisk.Add_Click({ ButtonCreateDisk_Click })

# Adding controls to the checked list box
$checkedListBoxDiskOptions.Controls.Add($textboxDiskPath)
$checkedListBoxDiskOptions.Controls.Add($buttonCreateDisk)

# Creating the "Create Virtual Machine" button
$buttonCreateVM = New-Object System.Windows.Forms.Button
$buttonCreateVM.Text = "Create Virtual Machine"
$buttonCreateVM.Location = New-Object System.Drawing.Point(20, 440)
$buttonCreateVM.Size = New-Object System.Drawing.Size(150, 30)

# Adding event handling for the "Create Virtual Machine" button
$buttonCreateVM.Add_Click({ ButtonCreateVM_Click })

# Adding controls to the main form
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
#$mainForm.Controls.Add($labelDiskPath)
#$mainForm.Controls.Add($textboxDiskPath)
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
$mainForm.Controls.Add($groupBoxDiskOptions)
$mainForm.Controls.Add($buttonCreateVM)

# Running the application
$mainForm.ShowDialog()
