using Godot;
using System;

public class PointCounter : Label
{

    public void _on_Player_point_signal(int pointcount)
    {
        Text = pointcount.ToString();
    }
}