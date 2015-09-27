package com.Akoot.util
{
	public class Random
	{
		public function Random()
		{
			// constructor code
		}

		public function nextInt(min:Number, max:Number):Number
		{
			return Math.round(Math.random()*(max-min)+min);
		}
	}
}