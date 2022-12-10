package;

import flixel.FlxG;
import flixel.FlxSprite;

class NoteSplash extends FlxSprite
{
	public function new(xPos:Float, yPos:Float, ?c:Int)
	{
		if (c == null)
			c = 0;
		super(xPos, yPos);
		frames = Paths.getSparrowAtlas('noteSplashes', 'shared');
		animation.addByPrefix("note1-0", "note splash blue 1", 24, false);
		animation.addByPrefix("note2-0", "note splash green 1", 24, false);
		animation.addByPrefix("note0-0", "note splash purple 1", 24, false);
		animation.addByPrefix("note3-0", "note splash red 1", 24, false);

		animation.addByPrefix("note1-1", "note splash blue 2", 24, false);
		animation.addByPrefix("note2-1", "note splash green 2", 24, false);
		animation.addByPrefix("note0-1", "note splash purple 2", 24, false);
		animation.addByPrefix("note3-1", "note splash red 2", 24, false);
		setupNoteSplash(xPos, xPos, c);
	}

	public function setupNoteSplash(xPos:Float, yPos:Float, ?c:Int)
	{
		if (c == null)
			c = 0;
		setPosition(xPos, yPos);
		alpha = 0.6;
		animation.play("note" + c + "-" + FlxG.random.int(0, 1), true);
		animation.curAnim.frameRate = 24 + FlxG.random.int(-2, 2);
		updateHitbox();
		offset.set(0.3 * width, 0.3 * height);
	}

	override public function update(elapsed)
	{
		if (animation.curAnim.finished)
			kill();
		super.update(elapsed);
	}
}