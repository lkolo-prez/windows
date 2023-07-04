Add-Type -TypeDefinition @"
using System;
using System.Windows.Forms;

public class InputDialog : Form
{
    private Label label;
    private TextBox textBox;
    private Button button;

    public string Result { get; private set; }

    public InputDialog(string prompt)
    {
        label = new Label
        {
            Text = prompt,
            Dock = DockStyle.Top
        };

        textBox = new TextBox
        {
            Dock = DockStyle.Top
        };

        button = new Button
        {
            Text = "OK",
            Dock = DockStyle.Top
        };
        button.Click += Button_Click;

        Controls.Add(button);
        Controls.Add(textBox);
        Controls.Add(label);

        Text = "Enter a value";
        FormBorderStyle = FormBorderStyle.FixedDialog;
        MaximizeBox = false;
        MinimizeBox = false;
        StartPosition = FormStartPosition.CenterScreen;
    }

    private void Button_Click(object sender, EventArgs e)
    {
        Result = textBox.Text;
        DialogResult = DialogResult.OK;
        Close();
    }
}
"@

# Wywołanie okienka dialogowego i pobranie wartości
function Show-InputDialog($prompt) {
    $inputDialog = New-Object InputDialog($prompt)
    $result = $inputDialog.ShowDialog()
    if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
        return $inputDialog.Result
    } else {
        return $null
    }
}

# Pobranie wartości przy użyciu okienka dialogowego
$VMName = Show-InputDialog -prompt "Enter the VM name"
$VMPath = Show-InputDialog -prompt "Enter the VM path"
$VHDPath = Show-InputDialog -prompt "Enter the VHD path"
$SwitchName = Show-InputDialog -prompt "Enter the switch name"
$MemoryGB = Show-InputDialog -prompt "Enter the memory size (in GB)"
$CPUCount = Show-InputDialog -prompt "Enter the CPU count"

# Tworzenie konfiguracji maszyny wirtualnej
$VMConfig = New-VM -Name $VMName -Path $VMPath -SwitchName $SwitchName

# Ustalenie rozmiaru pamięci RAM
Set-VMMemory -VMName $VMName -StartupBytes ($MemoryGB * 1GB) -MinimumBytes ($MemoryGB * 1GB) -MaximumBytes ($MemoryGB * 1GB)

# Ustalenie liczby procesorów
Set-VMProcessor -VMName $VMName -Count $CPUCount

# Tworzenie dysku wirtualnego
$VHDSize = (Get-ChildItem $VHDPath).Length
$VHDName = Split-Path -Leaf $VHDPath
Add-VMHardDiskDrive -VMName $VMName -Path $VHDPath -SizeBytes $VHDSize

# Uruchamianie maszyny wirtualnej
Start-VM -VMName $VMName
