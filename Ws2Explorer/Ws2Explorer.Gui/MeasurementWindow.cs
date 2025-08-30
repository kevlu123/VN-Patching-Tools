namespace Ws2Explorer.Gui;

partial class MeasurementWindow : Form
{
    public MeasurementWindow()
    {
        InitializeComponent();

        Opacity = 0.7;
        OnClientSizeChanged(this, EventArgs.Empty);
    }

    private void OnClientSizeChanged(object sender, EventArgs e)
    {
        message_Label.Text = $"Resize me! I am {Size.Width}x{Size.Height} pixels.";
    }
}
