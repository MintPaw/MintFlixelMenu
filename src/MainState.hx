package;

import flixel.FlxG;
import flixel.FlxState;
import mintFlx.MintFlxMenu;

class MainState extends FlxState
{

	public function new()
	{
		super();
	}

	override public function create():Void
	{
		super.create();

		FlxG.switchState(new MintFlxMenu());
	}
}
