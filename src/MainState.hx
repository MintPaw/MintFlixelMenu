package;

import flixel.FlxState;

class MainState extends FlxState
{

	public function new()
	{
		super();
	}

	override public function create():Void
	{
		super.create();
		trace("Created");
	}
}