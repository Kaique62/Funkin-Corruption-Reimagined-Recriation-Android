package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class BackgroundDancer extends FlxSprite
{
	public function new(x:Float, y:Float)
	{
		super(x, y);
		frames = Paths.getSparrowAtlas("limo/limoDancer",'week4');
		if(PlayState.SONG.song == "Glammed"){
			frames = Paths.getSparrowAtlas("limo3/henchmen",'week4');
			animation.addByIndices('idle', 'henchmen', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
			animation.play('idle');
			antialiasing = true;
		}
		else{
			frames = Paths.getSparrowAtlas("limo/limoDancer",'week4');
			animation.addByIndices('danceLeft', 'bg dancer sketch PINK', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
			animation.addByIndices('danceRight', 'bg dancer sketch PINK', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
			animation.play('danceLeft');
			antialiasing = true;
		}
	}

	var danceDir:Bool = false;

	public function dance():Void
	{
		danceDir = !danceDir;

		if (danceDir)
			animation.play('danceRight', true);
		else
			animation.play('danceLeft', true);
	}
}
