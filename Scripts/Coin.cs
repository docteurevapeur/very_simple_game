using Godot;
using System;

public class Coin : Node2D
{
    [Signal]
    delegate void EnterSignal();

    private Random rnd = new Random();

    public override void _Ready(){
        int XThing = rnd.Next(600);
        int YThing = rnd.Next(400);
        var PositionVector = new Vector2(XThing, YThing);
        Position = (PositionVector);
    }

    
    public void PlayerTouch(PhysicsBody2D area)
    {
        int XThing = rnd.Next(600);
        int YThing = rnd.Next(400);
        EmitSignal("EnterSignal");
        var PositionVector = new Vector2(XThing, YThing);
        Position = (PositionVector);
    }

}