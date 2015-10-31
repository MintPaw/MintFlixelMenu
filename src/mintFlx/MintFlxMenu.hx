package mintFlx;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class MintFlxMenu extends FlxState
{
	public var titleString:String = "Unnamed";
	public var subtitleString:String = "Unnamed";
	public var playButtonString:String = "Play";
	public var settingsButtonString:String = "Settings";
	public var creditsButtonString:String = "Credits";

	public var titleGraphicPath:String = null;
	public var subtitleGraphicPath:String = null;

	public var playCallback:Void->Void;

	public var fadeTime:Float = 2;
	public var debugFadeTime:Float = .25;

	private var _currentMenu:String;

	private var _fadeTime:Float;
	
	private var _title:FlxSprite;
	private var _subtitle:FlxSprite;
	private var _play:FlxButton;
	private var _settings:FlxButton;
	private var _credits:FlxButton;

	public function new()
	{
		super();
	}

	override public function create():Void
	{
		super.create();

		_fadeTime = fadeTime;

#if debug
		_fadeTime = debugFadeTime;
#end

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

			_play = new FlxButton(
					0, 0,
				 	playButtonString,
				 	internalPlayCallback);

			_settings = new FlxButton(
					0, 0,
				 	settingsButtonString,
				 	internalSettingsCallback);

			_credits = new FlxButton(
					0, 0,
				 	settingsButtonString,
				 	internalCreditsCallback);
						
			add(_title);
			add(_subtitle);
		}
	}

	private function internalPlayCallback():Void
	{
		FlxG.camera.fade(0x000000, _fadeTime, false, playCallback, true);
	}

	private function internalSettingsCallback():Void
	{
		// FlxG.camera.fade(0x000000, _fadeTime, false, playCallback, true);
	}

	private function internalCreditsCallback():Void
	{
		// FlxG.camera.fade(0x000000, _fadeTime, false, playCallback, true);
	}
}
