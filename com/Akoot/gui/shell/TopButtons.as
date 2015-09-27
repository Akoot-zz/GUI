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

	public class TopButtons extends MovieClip
	{

		private var theStage:Stage;
		private var over_close_btn:Boolean;
		
		public static const WINDOWS:Number = 0;
		public static const MAC:Number = 1;

		public function TopButtons()
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}

		public function init(event:Event):void
		{
			theStage = this.stage;
			addEventListener(Event.REMOVED_FROM_STAGE, remove);
			addEventListener(Event.ENTER_FRAME, update);
			addEventListener(MouseEvent.MOUSE_DOWN, down);
			close.addEventListener(MouseEvent.CLICK, click_close);
			close.addEventListener(MouseEvent.MOUSE_OUT, out_close);
			close.addEventListener(MouseEvent.MOUSE_OVER, over_close);
			title.width = main.WIDTH - close.width;
			title.x = 5;
		}

		private function down(event:MouseEvent):void
		{
			if (theStage.displayState == StageDisplayState.NORMAL)
			{
				NativeApplication.nativeApplication.activeWindow.startMove();
			}
		}
		
		public function setCloseOrientation(o:Number):void
		{
			if(o != WINDOWS)
			{
				close.x = 0;
				close.gotoAndStop("mac");
				close.bg.alpha = 0;
			}
			else
			{
				close.x = main.WIDTH - close.width;
			}
		}
		
		private function over_close(event:Event):void
		{
			close.bg.gotoAndStop(2);
			over_close_btn = true;
		}

		private function out_close(event:Event):void
		{
			close.bg.gotoAndStop(1);
			over_close_btn = false;
		}

		private function click_close(event:Event):void
		{
			close.bg.gotoAndStop(3);
			NativeApplication.nativeApplication.exit(0);
		}

		private function update(event:Event):void
		{
			if (over_close_btn)
			{
				close.icon.nextFrame();
			}
			else
			{
				close.icon.prevFrame();
			}
		}

		private function remove(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			removeEventListener(Event.ENTER_FRAME, update);
			removeEventListener(MouseEvent.MOUSE_DOWN, down);
			close.removeEventListener(MouseEvent.CLICK, click_close);
			close.removeEventListener(MouseEvent.MOUSE_OUT, out_close);
			close.removeEventListener(MouseEvent.MOUSE_OVER, over_close);
			removeEventListener(Event.REMOVED_FROM_STAGE, remove);
		}
	}
}