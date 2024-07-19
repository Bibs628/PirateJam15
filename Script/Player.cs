using Godot;
using System;

public partial class Player : CharacterBody2D {
	[Export] public float Speed = 200.0f;
	[Export] public float JumpVelocity = -400.0f;
	[Export] public NodePath WalkAnim {get; set; }
	private AnimationPlayer Animation;

	public float gravity = ProjectSettings.GetSetting("physics/2d/default_gravity").AsSingle();

	public override void _PhysicsProcess(double delta) {
		Vector2 velocity = Velocity;

		if (!IsOnFloor())
			velocity.Y += gravity * (float)delta;

		if (Input.IsActionJustPressed("Jump") && IsOnFloor()) {
			// TODO: Jump Animation einfuegen
			velocity.Y = JumpVelocity;
		}

		Vector2 direction = Input.GetVector("Left", "Right", "Up", "Down");
		if (direction != Vector2.Zero) {
			velocity.X = direction.X * Speed;
			Animation.Play("Walk");
		}
		else {
			velocity.X = Mathf.MoveToward(Velocity.X, 0, Speed);
			// TODO: Idle Animation einfuegen
		}

		Velocity = velocity;
		MoveAndSlide();
	}
	
	// Charakterverhalten am Start
	public override void _Ready()
	{
		Animation = GetNode<AnimationPlayer>(WalkAnim);
	}
}
