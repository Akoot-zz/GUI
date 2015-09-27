package com.Akoot.gui.shell.content
{
	import flash.display.MovieClip;
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	import flash.events.MouseEvent;
	import flash.events.Event;

	import com.Akoot.util.Color;
	import com.Akoot.main;
	import flash.display.NativeWindow;
	import flash.desktop.NativeApplication;
	import flash.display.StageDisplayState;
	import flash.display.Stage;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.AntiAliasType;


	public class Btn extends MovieClip
	{

		private var theStage:Stage;

		public var h:Number;
		public var w:Number;

		public var text:String;
		public var color1:uint;
		public var color2:uint;

		public var func:Function;

		private var hover:Boolean;
		private var clicked:Boolean;
		private var speed:Number;

		private var tf:TextField;
		private var en:Boolean;

		private var hasTip:Boolean;
		private var tip2:Boolean;

		public function Btn(text:String, height:int, width:int, color1:uint, color2:uint, func:Function)
		{
			hover = false;
			clicked = false;
			this.text = text;
			this.h = height;
			this.w = width;
			this.color1 = color1;
			this.color2 = color2;
			this.func = func;
			en = false;
			addEventListener(Event.ADDED_TO_STAGE, init);
			this.hasTip = false;
			msg.visible = false;
			tip.visible = false;
			this.tip2 = false;
		}

		public function showTip(b:Boolean)
		{
			tip2 = b;
		}

		public function setTip(s:String)
		{
			this.hasTip = true;
			tip.text = s;
			var a:Number = s.length * 10 + 5;
			var b:Number = 40;

			msg.width = a;
			msg.height = b;

			var f:TextFormat = new TextFormat();
			f.size = msg.height - 10;

			tip.width = a;
			tip.height = b;
			tip.defaultTextFormat = f;
			tip.textColor = this.color1;

			var c:ColorTransform = new ColorTransform();
			c.color = color2;
			msg.transform.colorTransform = c;
		}

		public function setEnabled(en:Boolean)
		{
			this.en = en;
		}

		public function isDown():Boolean
		{
			return clicked;
		}

		private function init(event:Event):void
		{
			theStage = this.stage;

			speed = .1 * w;

			hit.alpha = 0;
			hit.height = h;
			hit.width = w;

			var c:ColorTransform = new ColorTransform();
			c.color = color1;
			bg.transform.colorTransform = c;

			c.color = color2;
			fg.transform.colorTransform = c;

			var fmt:TextFormat = new TextFormat();
			fmt.size = this.h - 10;

			texts.width = this.w;
			texts.height = this.h;
			texts.defaultTextFormat = fmt;
			//texts.y = 2;
			texts.text = this.text;
			texts.textColor = this.color2;

			bg.width = this.w;
			bg.height = this.h;

			addEventListener(Event.REMOVED_FROM_STAGE, remove);
			hit.addEventListener(MouseEvent.CLICK, click);
			hit.addEventListener(MouseEvent.ROLL_OVER, over);
			hit.addEventListener(MouseEvent.ROLL_OUT, out);
			hit.addEventListener(MouseEvent.MOUSE_DOWN, down);
			hit.addEventListener(MouseEvent.MOUSE_UP, up);
			addEventListener(Event.ENTER_FRAME, update);
		}

		private function click(event:MouseEvent):void
		{
			if (en)
			{
				this.func();
			}
		}

		private function down(event:MouseEvent):void
		{
			if (en)
			{
				fg.width = bg.width;
				hit.alpha = .3;
			}
		}

		private function up(event:MouseEvent):void
		{
			if (en)
			{
				hit.alpha = 0;
			}
		}

		private function over(event:MouseEvent):void
		{
			hover = true;
		}

		private function out(event:MouseEvent):void
		{
			hover = false;
			hit.alpha = 0;
		}

		private function update(event:Event):void
		{
			if (hover)
			{
				if (en)
				{
					fg.width +=  speed;
				}
			}
			else
			{
				if (en)
				{
					fg.width -=  speed;
					hit.alpha = 0;
				}
			}

			if (fg.width > bg.width)
			{
				fg.width = bg.width;
			}
			if (fg.width < 5)
			{
				fg.width = 5;
			}
			if (fg.width >= bg.width / 2)
			{
				texts.textColor = color1;
			}
			else
			{
				texts.textColor = color2;
			}

			if (! en || tip2)
			{
				if (! en)
				{
					hit.alpha = .5;
				}

				if (hover)
				{
					msg.visible = true;
					tip.visible = true;
					if ((stage.mouseX + msg.width) < stage.stageWidth)
					{
						msg.x = stage.mouseX - this.x;
					}
					else
					{
						msg.x = (stage.stageWidth - msg.width - this.x);
					}
					msg.y = stage.mouseY - 10 - this.y - msg.height;
					tip.y = msg.y;
					tip.x = msg.x + 5;
				}
				else
				{
					msg.visible = false;
					tip.visible = false;
				}
			}
		}

		private function remove(event:Event):void
		{
			hit.removeEventListener(MouseEvent.CLICK, click);
			hit.removeEventListener(MouseEvent.ROLL_OVER, over);
			hit.removeEventListener(MouseEvent.ROLL_OUT, out);
			hit.removeEventListener(MouseEvent.MOUSE_DOWN, down);
			hit.removeEventListener(MouseEvent.MOUSE_UP, up);
			removeEventListener(Event.ADDED_TO_STAGE, init);
			removeEventListener(Event.ENTER_FRAME, update);
			removeEventListener(Event.REMOVED_FROM_STAGE, remove);
		}
	}
}