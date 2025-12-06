using System.Text.Json;
using System.Text;
using Flowchart = System.Collections.Generic.Dictionary<string, System.Collections.Generic.List<string>>;

namespace Ws2Explorer.Gui;

partial class FlowchartWindow : Form
{
    private enum FlowchartFormat
    {
        Mermaid,
        Json,
    }

    private static FlowchartFormat format = FlowchartFormat.Mermaid;
    private static bool showAllArcs = false;

    private Flowchart flowchart;

    private static readonly HashSet<string> HIDDEN_NODES = new(StringComparer.InvariantCultureIgnoreCase) {
        "start",
        "replay_exe",
        "evret",
    };

    private static readonly Dictionary<string, int> NODE_ORDER = new(StringComparer.InvariantCultureIgnoreCase)
    {
        { "start", 0 },
        { "mainmenu", 1 },
    };

    public FlowchartWindow(Flowchart flowchart)
    {
        this.flowchart = flowchart;

        InitializeComponent();

        switch (format)
        {
            case FlowchartFormat.Mermaid:
                mermaid_Radio.Checked = true;
                break;
            case FlowchartFormat.Json:
                json_Radio.Checked = true;
                break;
        }
        showAllArcs_CheckBox.Checked = showAllArcs;

        UpdateOutput();
    }

    private void FormatRadio_CheckChanged(object sender, EventArgs e)
    {
        if (mermaid_Radio.Checked)
        {
            format = FlowchartFormat.Mermaid;
        }
        else if (json_Radio.Checked)
        {
            format = FlowchartFormat.Json;
        }
        UpdateOutput();
    }

    private void ShowAllArcs_CheckChanged(object sender, EventArgs e)
    {
        showAllArcs = showAllArcs_CheckBox.Checked;
        UpdateOutput();
    }

    private static Flowchart FlowchartCopy(Flowchart original)
    {
        return original.ToDictionary(
            kvp => kvp.Key,
            kvp => new List<string>(kvp.Value));
    }

    private static void FlowchartEnsureSrcNodes(Flowchart fc)
    {
        var nodes = new HashSet<string>(StringComparer.InvariantCultureIgnoreCase);
        foreach (var (src, dsts) in fc)
        {
            nodes.Add(src);
            foreach (var dst in dsts)
            {
                nodes.Add(dst);
            }
        }
        foreach (var node in nodes)
        {
            if (!fc.ContainsKey(node))
            {
                fc[node] = [];
            }
        }
    }

    private static void FlowchartRemoveNodes(Flowchart fc, HashSet<string> nodesToRemove)
    {
        foreach (var node in nodesToRemove)
        {
            fc.Remove(node);
        }
        foreach (var (src, dsts) in fc.ToList())
        {
            dsts.RemoveAll(nodesToRemove.Contains);
        }
    }

    private static HashSet<string> FlowchartFindLeaves(Flowchart flowchart)
    {
        return flowchart.Where(kvp => kvp.Value.Count == 0)
            .Select(kvp => kvp.Key)
            .ToHashSet(StringComparer.InvariantCultureIgnoreCase);
    }

    private static void FlowchartRemoveLeaves(Flowchart fc)
    {
        while (true)
        {
            var leaves = FlowchartFindLeaves(fc);
            if (leaves.Count == 0)
            {
                return;
            }
            FlowchartRemoveNodes(fc, leaves);
        }
    }

    private void UpdateOutput()
    {
        Flowchart fc = flowchart;
        if (!showAllArcs_CheckBox.Checked)
        {
            fc = FlowchartCopy(flowchart);
            FlowchartEnsureSrcNodes(fc);
            FlowchartRemoveNodes(fc, HIDDEN_NODES);
            FlowchartRemoveLeaves(fc);
        }

        var orderedFlowchart =
            fc
            .OrderBy(kvp => NODE_ORDER.GetValueOrDefault(kvp.Key, int.MaxValue))
            .ToList();

        switch (format)
        {
            case FlowchartFormat.Mermaid:
                output_TextBox.Text = FormatMermaid(orderedFlowchart);
                break;
            case FlowchartFormat.Json:
                output_TextBox.Text = FormatJson(orderedFlowchart);
                break;
        }
    }

    private static string FormatMermaid(List<KeyValuePair<string, List<string>>> flowchart)
    {
        var sb = new StringBuilder();
        sb.AppendLine("graph TD;");
        foreach (var (src, dsts) in flowchart)
        {
            foreach (var dst in dsts)
            {
                sb.AppendLine($"  {src}-->{dst}");
            }
        }
        return sb.ToString();
    }

    private static string FormatJson(List<KeyValuePair<string, List<string>>> flowchart)
    {
        var sb = new StringBuilder();
        sb.AppendLine("{");
        var i = 0;
        foreach (var (src, dsts) in flowchart)
        {
            sb.Append($"  \"{src}\": ");
            sb.Append(JsonSerializer.Serialize(dsts));
            if (i < flowchart.Count - 1)
            {
                sb.Append(',');
            }
            sb.AppendLine();
            i++;
        }
        sb.AppendLine("]");
        return sb.ToString();
    }
}
