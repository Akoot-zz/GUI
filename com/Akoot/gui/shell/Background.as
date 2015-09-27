package com.Akoot.gui.shell
{
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

	public class Background extends MovieClip
	{

		private var theStage:Stage;

		public function Background()
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(event:Event):void
		{
			addEventListener(Event.REMOVED_FROM_STAGE, remove);
			addEventListener(MouseEvent.MOUSE_DOWN, down);
			theStage = this.stage;
		}
		
		public function setOppacity(a:Number)
		{
			this.bg.alpha = a / 100;
		}

		private function down(event:MouseEvent):void
		{
			if (theStage.displayState == StageDisplayState.NORMAL)
			{
				NativeApplication.nativeApplication.activeWindow.startMove();
			}
		}

		public function setColor(c:uint):void
		{
			var color:ColorTransform = new ColorTransform();
			color.color = c;
			bg.transform.colorTransform = color;
		}

		public function fadeIn(speed:Number, mc:MovieClip):void
		{
			addEventListener(Event.ENTER_FRAME, update);
			function update(event:Event):void
			{
				if (bg.alpha > 0)
				{
					bg.alpha -=  speed;
				}
				else
				{
					mc.parent.removeChild(mc);
					removeEventListener(Event.ENTER_FRAME, update);
				}
			}
		}
		public function remove(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			removeEventListener(MouseEvent.MOUSE_DOWN, down);
			removeEventListener(Event.REMOVED_FROM_STAGE, remove);
		}
	}
}