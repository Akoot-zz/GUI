package com.Akoot.gui.shell.content
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.Akoot.util.Color;
	import com.Akoot.util.Text;
	import flash.text.TextFormat;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;

	public class InsText extends MovieClip
	{

		public var h:Number;
		public var w:Number;
		private var hint:String;
		private var color1:uint;
		private var color2:uint;
		private var focused:Boolean;
		private var showClear:Boolean;

		public function InsText(hint:String, height:Number, width:Number, color1:uint, color2:uint)
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
			this.h = height;
			this.w = width;
			this.hint = hint;
			this.color1 = color1;
			this.color2 = color2;
		}

		public function setTextColor(color:uint)
		{
			this.txt.textColor = color;
		}

		public function init(event:Event)
		{
			this.txt.text = hint;
			this.txt.width = w;

			var border:Number = 5;

			this.bg.width = w;
			this.bg.height = h;

			this.bg.x = border / 2;
			this.bg.y = border / 2;

			this.fg.width = w + border;
			this.fg.height = h + border;

			this.txt.textColor = color2;

			Color.setColor(this.fg, color2);
			Color.setColor(this.bg, color1);


			trace("a:" + this.txt.defaultTextFormat.size);
			var fmt:TextFormat = new TextFormat();
			fmt.size = h - 10;
			txt.defaultTextFormat = fmt;
			txt.height = h + 10;
			txt.width = w - h;

			trace("b:" + this.txt.defaultTextFormat.size);

			this.txt.x = 5 + h;
			this.txt.y = 0.5;

			icon.height = h;
			icon.width = h;
			icon.x = bg.x;
			icon.y = bg.y;

			addEventListener(Event.ENTER_FRAME, update);
			txt.addEventListener(FocusEvent.FOCUS_IN, focus_in);
			txt.addEventListener(FocusEvent.FOCUS_OUT, focus_out);
			icon.addEventListener(MouseEvent.MOUSE_OVER, icon_over);
			icon.addEventListener(MouseEvent.MOUSE_OUT, icon_out);
			icon.addEventListener(MouseEvent.CLICK, icon_click);
		}

		private function focus_in(event:Event):void
		{
			focused = true;
		}

		private function focus_out(event:Event):void
		{
			focused = false;
		}

		private function icon_over(event:MouseEvent):void
		{
			Color.setColor(icon.bg, 0xFF3333);
		}

		private function icon_out(event:MouseEvent):void
		{
			Color.setColor(icon.bg, color2);
		}

		private function icon_click(event:MouseEvent):void
		{
			txt.text = "";
		}
		
		public function getText():String
		{
			return txt.text;
		}

		private function update(event:Event):void
		{
			var speed = 5;
			if (focused)
			{
				this.fg.alpha = 1;
				this.txt.alpha = 1;
				this.bg.alpha = 1;
				if (txt.text.length > 0)
				{
					this.icon.alpha = 1;
				}
			}
			else
			{
				this.fg.alpha = 0.3;
				this.txt.alpha = 0.5;
				this.bg.alpha = 0;
				if (txt.text.length > 0)
				{
					this.icon.alpha = 0.5;
				}
			}

			if (txt.text.length > 0)
			{
				icon.x +=  speed;
				icon.alpha +=  0.10;
			}
			else
			{
				icon.x -=  speed;
				icon.alpha -=  0.10;
			}

			if (icon.alpha < 0)
			{
				icon.alpha = 0;
			}

			if (icon.alpha > 1)
			{
				icon.alpha = 1;
			}

			if (icon.x < bg.x - h)
			{
				icon.x = bg.x - h;
			}

			if (icon.x > bg.x)
			{
				icon.x = bg.x;
			}

			txt.x = icon.x + h + 5;
		}
	}

}