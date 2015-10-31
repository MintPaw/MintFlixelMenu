package mintFlx;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class MintFlxMenu extends FlxState
{
	public var titleString:String = "Unnamed";
	public var subtitleString:String = "Unnamed";
	public var playButtonString:String = "Play";
	public var settingsButtonString:String = "Settings";
	public var credits:String =
		"Credits:\nMember: position\nMember: position\netc...";

	public var titleGraphicPath:String = null;
	public var subtitleGraphicPath:String = null;

	public var playCallback:Void->Void;

	public var fadeTime:Float = 2;
	public var debugFadeTime:Float = .25;

	private var _currentMenu:String;

	private var _fadeTime:Float;
	
	private var _mainObjects:Array<FlxObject>;
	private var _title:FlxSprite;
	private var _subtitle:FlxSprite;
	private var _play:FlxButton;
	private var _settings:FlxButton;
	private var _credits:FlxText;

	private var _settingsObjects:Array<FlxObject>;
	private var _back:FlxButton;

	public function new()
	{
		super();
	}

	override public function create():Void
	{
		super.create();
		
		// Global function defines
		var buttonPadding:Float = 10;

		{ // Setup misc
			_fadeTime = fadeTime;

#if debug
			_fadeTime = debugFadeTime;
#end
		}

		{ // Setup main
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

			_settings.x = FlxG.width - _settings.width - buttonPadding;
			_settings.y = FlxG.height - _settings.height - buttonPadding;
			_play.x = FlxG.width - _play.width - buttonPadding;
			_play.y = _settings.y - _settings.height - buttonPadding;

			_credits = new FlxText(0, 0, 0, credits, 20);
			_credits.autoSize = true;
			_credits.x = buttonPadding;
			_credits.y = FlxG.height - _credits.height - buttonPadding;

			_mainObjects = [];
			_mainObjects.push(_title);
			_mainObjects.push(_subtitle);
			_mainObjects.push(_credits);
			_mainObjects.push(_settings);
			_mainObjects.push(_play);

			for (m in _mainObjects) add(m);
		}

		{ // Setup settings
			_back = new FlxButton(0, 0, "Back", internalBackCallback);
			_back.x = FlxG.width - _back.width - buttonPadding;
			_back.y = FlxG.height - _back.height - buttonPadding;
			
			_settingsObjects = [];
			_settingsObjects.push(_back);

			for (m in _settingsObjects) add(m);
		}

		loadMenu("main");
	}
	
	private function loadMenu(menu:String):Void
	{
		for (m in members) m.kill();
		_currentMenu = menu;

		if (_currentMenu == "main") {
			for (m in _mainObjects) m.reset(m.x, m.y);
		}

		if (_currentMenu == "settings") {
			for (m in _settingsObjects) m.reset(m.x, m.y);
		}
	}

	private function internalPlayCallback():Void
	{
		FlxG.camera.fade(0x000000, _fadeTime, false, playCallback, true);
	}

	private function internalSettingsCallback():Void
	{
		loadMenu("settings");
	}

	private function internalBackCallback():Void
	{
		if (_currentMenu == "settings") loadMenu("main");
	}
}
