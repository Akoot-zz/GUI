package com.Akoot.util
{
	import flash.display.MovieClip;
	import flash.text.TextFormat;
	import flash.text.TextField;

	public class Text
	{
		public function Text()
		{
			// constructor code
		}

		public static function setSize(texts:TextField, h:Number):void
		{
			var fmt:TextFormat = new TextFormat();
			fmt.size = h;
			texts.defaultTextFormat = fmt;
			trace(texts.defaultTextFormat.size);
		}
	}
}