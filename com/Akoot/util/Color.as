package com.Akoot.util
{
	public class Color
	{
		public function Color()
		{
			// constructor code
		}

		public static function getColor(red:uint, green:uint, blue:uint):uint
		{
			var intVal:int = red << 16 | green << 8 | blue;
			var hexVal:String = intVal.toString(16);
			hexVal = "0x" + (hexVal.length < 6 ? "0" + hexVal : hexVal);
			return parseInt(hexVal);
		}

		public static function randomColor(tint:Number, shade:Number):uint
		{
			var r:uint = 0;
			var g:uint = 0;
			var b:uint = 0;

			var random:Random = new Random();
			var dist:Number = 50;

			while (r < tint || r > shade)
			{
				r = random.nextInt(tint,shade);
			}
			while (g < tint || g > shade)
			{
				g = random.nextInt(tint,shade);
			}
			while (b < tint || b > shade)
			{
				b = random.nextInt(tint,shade);
			}

			trace("Color: " + r + ", " + g + ", " + b);



			trace(random.nextInt(155,255));
			return getColor(r, g, b);
		}
	}
}