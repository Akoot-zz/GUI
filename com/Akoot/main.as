package com.Akoot
{
	import flash.display.MovieClip;
	import flash.display.NativeWindow;
	import flash.desktop.NativeApplication;
	import flash.display.StageDisplayState;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.system.Capabilities;
	import flash.ui.Keyboard;
	import flash.media.Sound;

	//import com.smartfoxserver.v2.SmartFox;

	public class main extends MovieClip
	{
		public static const HEIGHT:Number = 700;
		public static const WIDTH:Number = 1100;
		public static const NAME:String = "GUI";
		public static const VERSION:String = "0.0.0";

		public function main()
		{
			addEventListener(Event.ENTER_FRAME, update);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyboard_down);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyboard_up);
			init();
		}

		public function update(event:Event):void
		{
		}

		public function keyboard_down(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.ESCAPE)
			{
				event.preventDefault();
			}
		}

		public function keyboard_up(event:KeyboardEvent):void
		{
		}
	}
}