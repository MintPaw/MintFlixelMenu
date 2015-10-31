package mintFlx;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;

class MintFlxMenu extends FlxState
{
	public var titleString:String = "Unnamed";
	public var subtitleString:String = "Unnamed";

	public var titleGraphicPath:String = null;
	public var subtitleGraphicPath:String = null;

	private var _currentMenu:String;
	
	private var _title:FlxSprite;
	private var _subtitle:FlxSprite;

	public function new()
	{
		super();
	}

	override public function create():Void
	{
		super.create();

		loadMenu("main");
	}

	private function loadMenu(menu:String):Void
	{
		_currentMenu = menu;

		if (_currentMenu == "main") {
			if (titleGraphicPath != null) {
				_title = new FlxSprite(titleGraphicPath);
			} else {
			 	_title = new FlxText(0, 0, FlxG.width, titleString, 40);
				cast(_title, FlxText).alignment = "center";
				_title.y = FlxG.height / 6;
			}

			if (subtitleGraphicPath != null) {
				_subtitle = new FlxSprite(subtitleGraphicPath);
			} else {
			 	_subtitle = new FlxText(0, 0, FlxG.width, subtitleString, 20);
				cast(_subtitle, FlxText).alignment = "center";
				_subtitle.y = _title.y + _title.height + 10;
			}
						
			add(_title);
			add(_subtitle);
		}
	}
}
