#to find the cursor x-y location on the screen--------------

Add-Type -AssemblyName System.Windows.Forms
$X = [System.Windows.Forms.Cursor]::Position.X
$Y = [System.Windows.Forms.Cursor]::Position.Y
Write-Output "X: $X | Y: $Y"  

#code for left click --------------------------------- 



[system.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | out-null

# Set the exactly position of cursor in some iexplore hyperlink between the (open parenthesis) below: 
[System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point(648,347)

function Click-MouseButton
{
    $signature=@' 
      [DllImport("user32.dll",CharSet=CharSet.Auto, CallingConvention=CallingConvention.StdCall)]
      public static extern void mouse_event(long dwFlags, long dx, long dy, long cButtons, long dwExtraInfo);
'@ 

    $SendMouseClick = Add-Type -memberDefinition $signature -name "Win32MouseEventNew" -namespace Win32Functions -passThru 

        $SendMouseClick::mouse_event(0x00000002, 0, 0, 0, 0);
        $SendMouseClick::mouse_event(0x00000004, 0, 0, 0, 0);
}

Click-MouseButton
