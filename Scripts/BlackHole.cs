using Godot;
using System;

public class BlackHole : Node2D
{
    [Signal]
    delegate void BlackHoleTouch();

    private Random rnd = new Random();


    public override void _Ready()
    {
        int XThing = rnd.Next(600);
        int YThing = rnd.Next(400);
        var PositionVector = new Vector2(XThing, YThing);
        Position = (PositionVector);
    }


    public void PlayerTouch(PhysicsBody2D area)
    {
        EmitSignal("BlackHoleTouch");
        int XThing = rnd.Next(600);
        int YThing = rnd.Next(400);
        var PositionVector = new Vector2(XThing, YThing);
        Position = (PositionVector);
    }
}