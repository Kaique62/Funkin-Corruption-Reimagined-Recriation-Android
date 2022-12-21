package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		
		loadGraphic(Paths.image('iconGrid'), true, 150, 150);

		antialiasing = true;
		animation.add('bf', [0, 1], 0, false, isPlayer);
		animation.add('bf-pico', [1, 2], 0, false, isPlayer);
		animation.add('bf-pico2', [5, 6], 0, false, isPlayer);
		animation.add('bf-1-3', [9, 11], 0, false, isPlayer);
		animation.add('bf-1-3-2', [5, 6], 0, false, isPlayer);
		animation.add('bf-car', [0, 1], 0, false, isPlayer);
		animation.add('bf-christmas', [0, 1], 0, false, isPlayer);
		animation.add('bf-pixel', [21, 21], 0, false, isPlayer);
		animation.add('spooky', [22, 23], 0, false, isPlayer);
		animation.add('spooky-2', [24, 25], 0, false, isPlayer);
		animation.add('spooky-3', [26, 27], 0, false, isPlayer);
		animation.add('pico', [3, 4], 0, false, isPlayer);
		animation.add('pico2', [7, 8], 0, false, isPlayer);
		animation.add('pico3-1', [12, 13], 0, false, isPlayer);
		animation.add('pico-3-2', [14, 15], 0, false, isPlayer);
		animation.add('pico-3-3', [16, 17], 0, false, isPlayer);
		animation.add('pico-3-4', [18, 19], 0, false, isPlayer);
		animation.add('pico-3-5', [20, 21], 0, false, isPlayer);
		animation.add('pico-spooky', [20, 21], 0, false, isPlayer);
		animation.add('mom', [6, 7], 0, false, isPlayer);
		animation.add('momd1', [1, 2], 0, false, isPlayer);
		animation.add('momd1alt', [1, 2], 0, false, isPlayer);
		animation.add('picod3-1', [12, 13], 0, false, isPlayer);
		animation.add('picod3-2', [12, 13], 0, false, isPlayer);
		animation.add('picod3-3', [14, 15], 0, false, isPlayer);
		animation.add('picod3-4', [20, 21], 0, false, isPlayer);
		animation.add('pico-spooky', [20, 21], 0, false, isPlayer);
		animation.add('mom', [6, 7], 0, false, isPlayer);
		animation.add('momd1', [28, 29], 0, false, isPlayer);
		animation.add('momd2', [30, 31], 0, false, isPlayer);
		animation.add('momd3', [32, 33], 0, false, isPlayer); 
		animation.add('momd3-1', [34, 35], 0, false, isPlayer);
		animation.add('momd3-2', [36, 37], 0, false, isPlayer);
		animation.add('momd3-3', [30, 31], 0, false, isPlayer);
		animation.add('momd3-4', [30, 31], 0, false, isPlayer);
		animation.add('momd1alt', [28, 29], 0, false, isPlayer);
		animation.add('picod1-alt', [1, 2], 0, false, isPlayer);
		animation.add('picod1', [1, 2], 0, false, isPlayer);
		animation.add('momd2', [1, 2], 0, false, isPlayer);
		animation.add('picod2', [1, 2], 0, false, isPlayer);
		animation.add('pico-mom2', [1, 2], 0, false, isPlayer);
		animation.add('mom-car', [6, 7], 0, false, isPlayer);
		animation.play(char);

		switch(char)
		{
			case 'bf-pixel' | 'senpai' | 'senpai-angry' | 'spirit' | 'gf-pixel':
				antialiasing = false;
		}

		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
