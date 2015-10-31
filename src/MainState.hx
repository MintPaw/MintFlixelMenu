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

		var menu:MintFlxMenu = new MintFlxMenu();
		menu.titleString = "Test file";
		menu.subtitleString = "A file for testing utils";

		FlxG.switchState(menu);
	}
}
