package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Character extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';

	public var holdTimer:Float = 0;

	public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false)
	{
		super(x, y);

		animOffsets = new Map<String, Array<Dynamic>>();
		curCharacter = character;
		this.isPlayer = isPlayer;

		var tex:FlxAtlasFrames;
		antialiasing = true;

		switch (curCharacter)
		{
			case 'gf':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('characters/GF_assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');

			case 'gf-blank':
				tex = Paths.getSparrowAtlas('characters/gfBlank');
				frames = tex;

				animation.addByPrefix('cheer', 'GF Dancing Beat Hair blowing CAR', 24, false);
				animation.addByPrefix('singLEFT', 'GF Dancing Beat Hair blowing CAR', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Dancing Beat Hair blowing CAR', 24, false);
				animation.addByPrefix('singUP', 'GF Dancing Beat Hair blowing CAR', 24, false);
				animation.addByPrefix('singDOWN', 'GF Dancing Beat Hair blowing CAR', 24, false);
				animation.addByIndices('sad', 'GF Dancing Beat Hair blowing CAR', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat Hair blowing CAR', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat Hair blowing CAR', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing CAR", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair blowing CAR", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF Dancing Beat Hair blowing CAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');
	
			case 'null':
				tex = Paths.getSparrowAtlas('characters/gfBlank');
				frames = tex;

				animation.addByPrefix('cheer', 'GF Dancing Beat Hair blowing CAR', 24, false);
				animation.addByPrefix('singLEFT', 'GF Dancing Beat Hair blowing CAR', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Dancing Beat Hair blowing CAR', 24, false);
				animation.addByPrefix('singUP', 'GF Dancing Beat Hair blowing CAR', 24, false);
				animation.addByPrefix('singDOWN', 'GF Dancing Beat Hair blowing CAR', 24, false);
				animation.addByIndices('sad', 'GF Dancing Beat Hair blowing CAR', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat Hair blowing CAR', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat Hair blowing CAR', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing CAR", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair blowing CAR", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF Dancing Beat Hair blowing CAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');
	

			case 'gf-pico':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('characters/gopico/gf-1-1');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');		

			case 'gf-pico2alt':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('characters/gopico/gf-1-2alt');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');			

		  case 'gf-1-3-2':
		   tex = Paths.getSparrowAtlas('characters/gopico/gf-3-1');
		   frames = tex;

		   animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
		   animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

		   addOffset('danceLeft', 0, -53);
		   addOffset('danceRight', 0, -53);

		   playAnim('danceRight');

		  case 'gf-1-3':
		   tex = Paths.getSparrowAtlas('characters/gopico/gf-3-2');
		   frames = tex;

		   animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
		   animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

		   addOffset('danceLeft', 0, -50);
		   addOffset('danceRight', 0, -50);

		   playAnim('danceRight');

			case 'gf-pixel':
				tex = Paths.getSparrowAtlas('characters/gfPixel');
				frames = tex;
				animation.addByIndices('singUP', 'GF IDLE', [2], "", 24, false);
				animation.addByIndices('danceLeft', 'GF IDLE', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF IDLE', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');

				setGraphicSize(Std.int(width * PlayState.daPixelZoom));
				updateHitbox();
				antialiasing = false;

			case 'dad':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/DADDY_DEAREST', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24);

				addOffset('idle');
				addOffset("singUP", -6, 50);
				addOffset("singRIGHT", 0, 27);
				addOffset("singLEFT", -10, 10);
				addOffset("singDOWN", 0, -30);

				playAnim('idle');
			case 'spooky':
				tex = Paths.getSparrowAtlas('characters/picoisacriminal/spooky-3-1');
				frames = tex;
				animation.addByPrefix('singUP', 'spooky UP NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
				animation.addByPrefix('singLEFT', 'note sing left', 24, false);
				animation.addByPrefix('singRIGHT', 'spooky sing right', 24, false);
				animation.addByIndices('danceLeft', 'spooky dance idle', [0, 2, 4, 6], "", 12, false);
				animation.addByIndices('danceRight', 'spooky dance idle', [8, 10, 12, 14], "", 12, false);

				addOffset('danceLeft');
				addOffset('danceRight');

				addOffset("singUP", 19, 89);
				addOffset("singLEFT", 181, 50);
				addOffset("singRIGHT", -84, 53);
				addOffset("singDOWN", 32, -76);

				playAnim('danceRight');
			
			case 'spooky-2':
				tex = Paths.getSparrowAtlas('characters/picoisacriminal/spooky-3-2');
				frames = tex;
				animation.addByPrefix('singUP', 'spooky UP NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
				animation.addByPrefix('singLEFT', 'note sing left', 24, false);
				animation.addByPrefix('singRIGHT', 'spooky sing right', 24, false);
				animation.addByIndices('danceLeft', 'spooky dance idle', [0, 2, 4, 6], "", 12, false);
				animation.addByIndices('danceRight', 'spooky dance idle', [8, 10, 12, 14], "", 12, false);

				addOffset('danceLeft');
				addOffset('danceRight');

				addOffset("singUP", 19, 89);
				addOffset("singLEFT", 181, 50);
				addOffset("singRIGHT", -84, 53);
				addOffset("singDOWN", 32, -76);

				playAnim('danceRight');
				
			case 'spooky-3':
				tex = Paths.getSparrowAtlas('characters/picoisacriminal/spooky-3-3');
				frames = tex;
				animation.addByPrefix('singUP', 'spooky UP NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
				animation.addByPrefix('singLEFT', 'note sing left', 24, false);
				animation.addByPrefix('singRIGHT', 'spooky sing right', 24, false);
				animation.addByIndices('danceLeft', 'spooky dance idle', [0, 2, 4, 6], "", 12, false);
				animation.addByIndices('danceRight', 'spooky dance idle', [8, 10, 12, 14], "", 12, false);

				addOffset('danceLeft');
				addOffset('danceRight');

				addOffset("singUP", 19, 89);
				addOffset("singLEFT", 181, 50);
				addOffset("singRIGHT", -84, 53);
				addOffset("singDOWN", 32, -76);

				playAnim('danceRight');				
			case 'mom':
				tex = Paths.getSparrowAtlas('characters/Mom_Assets');
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				addOffset('idle');
				addOffset("singUP", 14, 71);
				addOffset("singRIGHT", 10, -60);
				addOffset("singLEFT", 250, -23);
				addOffset("singDOWN", 20, -160);

				playAnim('idle');

			case 'mom-car':
				tex = Paths.getSparrowAtlas('characters/momCar');
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				addOffset('idle');
				addOffset("singUP", 14, 71);
				addOffset("singRIGHT", 10, -60);
				addOffset("singLEFT", 250, -23);
				addOffset("singDOWN", 20, -160);

				playAnim('idle');

			case 'momd1':
				tex = Paths.getSparrowAtlas('characters/woman/d1/momd1');
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				addOffset('idle', 50, 60);
				addOffset("singUP", 68, 130);
				addOffset("singRIGHT", -6, -4);
				addOffset("singLEFT", 321, 33);
				addOffset("singDOWN", 51, -110);

				playAnim('idle');
			case 'momd1alt':
				tex = Paths.getSparrowAtlas('characters/woman/d1/momd1-2');
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				addOffset('idle', 50, 60);
				addOffset("singUP", 68, 130);
				addOffset("singRIGHT", -6, -4);
				addOffset("singLEFT", 321, 33);
				addOffset("singDOWN", 52, -110);

				playAnim('idle');
			case 'momd2':
				tex = Paths.getSparrowAtlas('characters/woman/d2/momd2');
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				addOffset('idle', 50, 60);
				addOffset("singUP", 68, 130);
				addOffset("singRIGHT", -6, -4);
				addOffset("singLEFT", 321, 33);
				addOffset("singDOWN", 52, -110);

				playAnim('idle');	
															
			case 'monster':
				tex = Paths.getSparrowAtlas('characters/Monster_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'monster idle', 24, false);
				animation.addByPrefix('singUP', 'monster up note', 24, false);
				animation.addByPrefix('singDOWN', 'monster down', 24, false);
				animation.addByPrefix('singLEFT', 'Monster left note', 24, false);
				animation.addByPrefix('singRIGHT', 'Monster Right note', 24, false);

				addOffset('idle');
				addOffset("singUP", -20, 50);
				addOffset("singRIGHT", -51);
				addOffset("singLEFT", -30);
				addOffset("singDOWN", -30, -40);
				playAnim('idle');

			case 'pico':
				tex = Paths.getSparrowAtlas('characters/gopico/pico-1-1');
				frames = tex;
				animation.addByPrefix('idle', "Pico Idle Dance", 24);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('reload', 'Pico Reloading Gun', 24, false);
				animation.addByPrefix('shoot', 'Pico Shoot', 24, false);
				if (isPlayer)
				{
					animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
					animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Pico Note Right Miss', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Pico NOTE LEFT miss', 24, false);
				}
				else
				{
					// Need to be flipped! REDO THIS LATER!
					animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
					animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Pico NOTE LEFT miss', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Pico Note Right Miss', 24, false);
				}

				animation.addByPrefix('singUPmiss', 'pico Up note miss', 24);
				animation.addByPrefix('singDOWNmiss', 'Pico Down Note MISS', 24);

				addOffset('idle');
				addOffset('reload', 20, 0);
				addOffset('shoot', 16,40);
				addOffset("singUP", 11, 17);
				addOffset("singRIGHT", -39, -11);
				addOffset("singLEFT", 31, -6);
				addOffset("singDOWN", 237, -80);
				addOffset("singUPmiss", -19, 67);
				addOffset("singRIGHTmiss", -60, 41);
				addOffset("singLEFTmiss", 62, 64);
				addOffset("singDOWNmiss", 210, -28);

				playAnim('idle');

				flipX = true;

			case 'pico2':
				tex = Paths.getSparrowAtlas('characters/gopico/pico-1-2');
				frames = tex;
				animation.addByPrefix('idle', "Pico Idle Dance", 24);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('reload', 'Pico Reloading Gun', 24, false);
				animation.addByPrefix('shoot', 'Pico Shoot0', 24, false);
				animation.addByPrefix('gf-shoot', 'Pico Shoot Gf', 24, false);
				animation.addByPrefix('gf-reload', 'Look Gf Pico Reloading Gun', 24, false);
				if (isPlayer)
				{
					animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
					animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Pico Note Right Miss', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Pico NOTE LEFT miss', 24, false);
				}
				else
				{
					// Need to be flipped! REDO THIS LATER!
					animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
					animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Pico NOTE LEFT miss', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Pico Note Right Miss', 24, false);
				}

				animation.addByPrefix('singUPmiss', 'pico Up note miss', 24);
				animation.addByPrefix('singDOWNmiss', 'Pico Down Note MISS', 24);

				addOffset('idle');
				addOffset('reload', 20, 0);
				addOffset('gf-reload', 36, 0);
				addOffset('shoot', 15, 100);
				addOffset('gf-shoot', 15,28);
				addOffset("singUP", 11, 17);
				addOffset("singRIGHT", -39, -11);
				addOffset("singLEFT", 31, -6);
				addOffset("singDOWN", -25, -82);
				addOffset("singUPmiss", -19, 67);
				addOffset("singRIGHTmiss", -60, 41);
				addOffset("singLEFTmiss", 62, 64);
				addOffset("singDOWNmiss", 210, -28);

				playAnim('idle');

				flipX = true;	
								

       case 'pico3-1':
		    frames = Paths.getSparrowAtlas('characters/gopico/picod3');

				animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);

				addOffset('idle', 0);
				addOffset('singLEFT', 30, -5);
				addOffset('singDOWN', 246, -75);
				addOffset('singUP', 11, 27);
				addOffset('singRIGHT', -35, -9);

				playAnim('idle');
				flipX = true;

       case 'pico-3-2':
		    frames = Paths.getSparrowAtlas('characters/gopico/picod3-2');

				animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
				animation.addByPrefix('shoot', 'Pico Shoot0', 24, false);
				animation.addByPrefix('RELOAD', 'Pico Reload Gun0', 24, false);
				animation.addByPrefix('gf-shoot', 'Pico Shoot Gf', 25, false);
				animation.addByPrefix('gf-reload', 'Look Gf Pico Reloading Gun', 24, false);

				addOffset('idle', 0);
				addOffset('singLEFT', 31, -4);
				addOffset('singDOWN', -5, -75);
				addOffset('singUP', 11, 27);
				addOffset('singRIGHT', -35, -9);
				addOffset('shoot', 14, 28);
				addOffset('RELOAD', 20, 0);
				addOffset('gf-shoot', 15, 28);
				addOffset('gf-reload', 36, 0);

				playAnim('idle');
				flipX = true;

       case 'pico-3-3':
		    frames = Paths.getSparrowAtlas('characters/gopico/picod3-3');

				animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
				animation.addByPrefix('shoot', 'Pico Shoot0', 24, false);
				animation.addByPrefix('RELOAD', 'Pico Reload Gun0', 24, false);
				animation.addByPrefix('gf-shoot', 'Pico Shoot Gf', 25, false);
				animation.addByPrefix('gf-reload', 'Look Gf Pico Reloading Gun', 24, false);

				addOffset('idle', 0);
				addOffset('singLEFT', 31, -4);
				addOffset('singDOWN', -5, -75);
				addOffset('singUP', 11, 27);
				addOffset('singRIGHT', -35, -9);
				addOffset('shoot', 14, 28);
				addOffset('RELOAD', 20, 0);
				addOffset('gf-shoot', 15, 28);
				addOffset('gf-reload', 36, 0);

				playAnim('idle');
				flipX = true;
				
       case 'pico-3-4':
		    frames = Paths.getSparrowAtlas('characters/gopico/picod3-4');

				animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
				animation.addByPrefix('shoot', 'Pico Shoot0', 24, false);
				animation.addByPrefix('RELOAD', 'Pico Reload Gun0', 24, false);
				animation.addByPrefix('gf-shoot', 'Pico Shoot Gf', 25, false);
				animation.addByPrefix('gf-reload', 'Look Gf Pico Reloading Gun', 24, false);
				animation.addByPrefix('singUP-alt', 'pico Up note ALT', 24, false);

				addOffset('idle', 0);
				addOffset('singLEFT', 35, -5);
				addOffset('singDOWN', -5, -75);
				addOffset('singUP', 11, 27);
				addOffset('singRIGHT', -35, -9);
				addOffset('shoot', 14, 28);
				addOffset('RELOAD', 20, 0);
				addOffset('gf-shoot', 15, 28);
				addOffset('gf-reload', 36, 0);
				addOffset('singUP-alt', 10, 25);

				playAnim('idle');
				flipX = true;
				
       case 'pico-3-5':
		    frames = Paths.getSparrowAtlas('characters/gopico/picod3-5');

				animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
				animation.addByPrefix('shoot', 'Pico Shoot0', 24, false);
				animation.addByPrefix('RELOAD', 'Pico Reload Gun0', 24, false);
				animation.addByPrefix('gf-shoot', 'Pico Shoot Gf', 25, false);
				animation.addByPrefix('gf-reload', 'Look Gf Pico Reloading Gun', 24, false);
				

				addOffset('idle', 0);
				addOffset('singLEFT', 69, 19);
				addOffset('singDOWN', 249, -29);
				addOffset('singUP', 7, 52);
				addOffset('singRIGHT', -35, -11);
				addOffset('shoot', 17, -40);
				addOffset('RELOAD', 20, 0);
				addOffset('gf-shoot', 15, 28);
				addOffset('gf-reload', 36, 0);

				playAnim('idle');
				flipX = true;

		    case 'picod1-alt':
		       frames = Paths.getSparrowAtlas('characters/woman/d1/picod1-shadow');

				animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
				animation.addByPrefix('reload', 'Pico RELOAD', 24, false);
				animation.addByPrefix('shoot', 'Pico Shoot', 24, false);

				addOffset('idle', 23, 60);
				addOffset('singLEFT', 72, 55);
				addOffset('singDOWN', 58, -16);
				addOffset('singUP', -22, 106);
				addOffset('singRIGHT', -74, 63);
				addOffset('reload', -30, 38);
				addOffset('shoot', 466, 55);

				playAnim('idle');
				flipX = true;

			case 'picod1':
		       frames = Paths.getSparrowAtlas('characters/woman/d1/picod1');

				animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
				animation.addByPrefix('reload', 'Pico RELOAD', 12, false);
				animation.addByPrefix('shoot', 'Pico Shoot', 24, false);

				addOffset('idle', 23, 60);
				addOffset('singLEFT', 103, 50);
				addOffset('singDOWN', 88, 28);
				addOffset('singUP', 48, 110);
				addOffset('singRIGHT', -14, 80);
				addOffset('reload', -48, 0);
				addOffset('shoot', 466, 82);

				playAnim('idle');
				flipX = true;

			case 'picod2':
		        frames = Paths.getSparrowAtlas('characters/woman/d2/picod2');

				animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
				animation.addByPrefix('reload', 'Pico RELOAD', 24, false);
				animation.addByPrefix('shoot', 'Pico Shoot', 24, false);

				addOffset('idle', 23, 60);
				addOffset('singLEFT', 103, 50);
				addOffset('singDOWN', 88, 28);
				addOffset('singUP', 48, 111);
				addOffset('singRIGHT', -14, 80);
				addOffset('reload', -48, 0);
				addOffset('shoot', 466, 82);

				playAnim('idle');
				flipX = true;

			case 'pico-mom2':
		        frames = Paths.getSparrowAtlas('characters/woman/pico2');

				animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
				animation.addByPrefix('reload', 'Pico RELOAD', 24, true);
				animation.addByPrefix('shoot', 'Pico Shoot', 24, true);

				addOffset('idle', 3, 0);
				addOffset('singLEFT', 50, -7);
				addOffset('singDOWN', 55, -85);
				addOffset('singUP', -42, 37);
				addOffset('singRIGHT', -96, 2);
				addOffset('reload', -76, 0);
				addOffset('shoot', -96, 2);

				playAnim('idle');
				flipX = true;

			case 'pico-spooky':
		       frames = Paths.getSparrowAtlas('characters/picoisacriminal/pico-3');

				animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
				animation.addByPrefix('reload', 'Pico RELOAD', 24, false);
				animation.addByPrefix('shoot', 'Pico Shoot', 24, false);


				addOffset('idle', 23, 60);
				addOffset('singLEFT', 73, 53);
				addOffset('singDOWN', 57, -17);
				addOffset('singUP', -13, 105);
				addOffset('singRIGHT', -74, 63);
				addOffset('reload', -54, 38);
				addOffset('shoot', -74, 63);

				playAnim('idle');
				flipX = true;
				case 'momd3-1':
					tex = Paths.getSparrowAtlas('characters/woman/d3/ANGRYMOM');
					frames = tex;
	
					animation.addByPrefix('idle', "Mom Idle", 24, false);
					animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
					animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
					animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
					animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);
	
					addOffset('idle', 50, 60);
					addOffset("singUP", 68, 130);
					addOffset("singRIGHT", -6, -4);
					addOffset("singLEFT", 321, 33);
					addOffset("singDOWN", 52, -110);
	
					playAnim('idle');	
				case 'momd3-2':
					tex = Paths.getSparrowAtlas('characters/woman/d3/ANGRYMOM2');
					frames = tex;
	
					animation.addByPrefix('idle', "Mom Idle", 24, false);
					animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
					animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
					animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
					animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);
	
					addOffset('idle', 50, 60);
					addOffset("singUP", 68, 130);
					addOffset("singRIGHT", -6, -4);
					addOffset("singLEFT", 321, 33);
					addOffset("singDOWN", 52, -110);
	
					playAnim('idle');	
				case 'momd3-3':
					tex = Paths.getSparrowAtlas('characters/woman/d2/momd2');
					frames = tex;
	
					animation.addByPrefix('idle', "Mom Idle", 24, false);
					animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
					animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
					animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
					animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);
	
					addOffset('idle', 50, 60);
					addOffset("singUP", 68, 130);
					addOffset("singRIGHT", -6, -4);
					addOffset("singLEFT", 321, 33);
					addOffset("singDOWN", 52, -110);
	
					playAnim('idle');	
				case 'momd3-4':
					tex = Paths.getSparrowAtlas('characters/woman/d3/momd3');
					frames = tex;
	
					animation.addByPrefix('idle', "Mom Idle", 24, false);
					animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
					animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
					animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
					animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);
	
					addOffset('idle', 50, 60);
					addOffset("singUP", 68, 130);
					addOffset("singRIGHT", -6, -4);
					addOffset("singLEFT", 321, 33);
					addOffset("singDOWN", 52, -110);
	
					playAnim('idle');								

					case 'picod3-1':
						frames = Paths.getSparrowAtlas('characters/woman/d3/picod3');
			
							animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);
							animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
							animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
							animation.addByPrefix('singUP', 'pico Up note0', 24, false);
							animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
							animation.addByPrefix('reload', 'Pico RELOAD', 24, false);
							animation.addByPrefix('shoot', 'Pico Shoot', 24, false);
			
							addOffset('idle', 23, 60);
							addOffset('singLEFT', 73, 53);
							addOffset('singDOWN', 57, -17);
							addOffset('singUP', -13, 105);
							addOffset('singRIGHT', -74, 63);
							addOffset('reload', -54, 38);
							addOffset('shoot', -74, 63);
			
							playAnim('idle');
							flipX = true;
				   case 'picod3-2':
						frames = Paths.getSparrowAtlas('characters/woman/d3/picouncorrupt2');
			
							animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);
							animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
							animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
							animation.addByPrefix('singUP', 'pico Up note0', 24, false);
							animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
							animation.addByPrefix('reload', 'Pico RELOAD', 24, false);
							animation.addByPrefix('shoot', 'Pico Shoot', 24, false);
			
							addOffset('idle', 23, 60);
							addOffset('singLEFT', 73, 53);
							addOffset('singDOWN', 57, -17);
							addOffset('singUP', -13, 105);
							addOffset('singRIGHT', -74, 63);
							addOffset('reload', -54, 38);
							addOffset('shoot', -74, 63);
			
							playAnim('idle');
							flipX = true;					
				   case 'picod3-3':
						frames = Paths.getSparrowAtlas('characters/woman/d3/pico3-recorrupt');
			
							animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);
							animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
							animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
							animation.addByPrefix('singUP', 'pico Up note0', 24, false);
							animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
							animation.addByPrefix('reload', 'Pico RELOAD', 24, false);
							animation.addByPrefix('shoot', 'Pico Shoot', 24, false);
			
							addOffset('idle', 23, 60);
							addOffset('singLEFT', 73, 53);
							addOffset('singDOWN', 57, -17);
							addOffset('singUP', -13, 105);
							addOffset('singRIGHT', -74, 63);
							addOffset('reload', -54, 38);
							addOffset('shoot', -74, 63);
			
							playAnim('idle');
							flipX = true;	
				   case 'picod3-4':
						frames = Paths.getSparrowAtlas('characters/woman/d3/pico-recorruptfull');
			
							animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);
							animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
							animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
							animation.addByPrefix('singUP', 'pico Up note0', 24, false);
							animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
							animation.addByPrefix('reload', 'Pico RELOAD', 24, false);
							animation.addByPrefix('shoot', 'Pico Shoot', 24, false);
			
							addOffset('idle', 23, 60);
							addOffset('singLEFT', 73, 53);
							addOffset('singDOWN', 57, -17);
							addOffset('singUP', -13, 105);
							addOffset('singRIGHT', -74, 63);
							addOffset('reload', -54, 38);
							addOffset('shoot', 464, 101);
			
							playAnim('idle');
							flipX = true;		


			case 'bf':
				var tex = Paths.getSparrowAtlas('characters/BOYFRIEND', 'shared');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);

				playAnim('idle');

				flipX = true;
		
			case 'bf-pico':
				var tex = Paths.getSparrowAtlas('characters/gopico/bf-1-1', 'shared');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);

				playAnim('idle');

				flipX = true;	
			
			case 'bf-pico2':
				var tex = Paths.getSparrowAtlas('characters/gopico/bf-1-2', 'shared');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);

				playAnim('idle');

				flipX = true;					

		  case 'bf-1-3':
		    frames = Paths.getSparrowAtlas('characters/gopico/bf-1-3');

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);

				addOffset('idle', -5, 10);
				addOffset('singLEFT', 12, 4);
				addOffset('singDOWN', -10, -39);
				addOffset('singUP', -37, 42);
				addOffset('singRIGHT', -46, 4);

				playAnim('idle');
				flipX = true;

      case 'bf-1-3-2':
		    frames = Paths.getSparrowAtlas('characters/gopico/bf-3-2');

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);

				addOffset('idle', -5, 10);
				addOffset('singLEFT', 19, -5);
				addOffset('singDOWN', -9, -53);
				addOffset('singUP', -34, 34);
				addOffset('singRIGHT', -43, 3);

				playAnim('idle');
				flipX = true;

			case 'bf-pixel':
				frames = Paths.getSparrowAtlas('characters/bfPixel');
				animation.addByPrefix('idle', 'BF IDLE', 24, false);
				animation.addByPrefix('singUP', 'BF UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'BF LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'BF RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);

				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				addOffset("singUPmiss");
				addOffset("singRIGHTmiss");
				addOffset("singLEFTmiss");
				addOffset("singDOWNmiss");

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;
			case 'bf-pixel-dead':
				frames = Paths.getSparrowAtlas('characters/bfPixelsDEAD');
				animation.addByPrefix('singUP', "BF Dies pixel", 24, false);
				animation.addByPrefix('firstDeath', "BF Dies pixel", 24, false);
				animation.addByPrefix('deathLoop', "Retry Loop", 24, true);
				animation.addByPrefix('deathConfirm', "RETRY CONFIRM", 24, false);
				animation.play('firstDeath');

				addOffset('firstDeath');
				addOffset('deathLoop', -37);
				addOffset('deathConfirm', -37);
				playAnim('firstDeath');
				// pixel bullshit
				setGraphicSize(Std.int(width * 6));
				updateHitbox();
				antialiasing = false;
				flipX = true;

			case 'senpai':
				frames = Paths.getSparrowAtlas('characters/senpai');
				animation.addByPrefix('idle', 'Senpai Idle', 24, false);
				animation.addByPrefix('singUP', 'SENPAI UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'SENPAI LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'SENPAI RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'SENPAI DOWN NOTE', 24, false);

				addOffset('idle');
				addOffset("singUP", 5, 37);
				addOffset("singRIGHT");
				addOffset("singLEFT", 40);
				addOffset("singDOWN", 14);

				playAnim('idle');

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				antialiasing = false;
			case 'senpai-angry':
				frames = Paths.getSparrowAtlas('characters/senpai');
				animation.addByPrefix('idle', 'Angry Senpai Idle', 24, false);
				animation.addByPrefix('singUP', 'Angry Senpai UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'Angry Senpai LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'Angry Senpai RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'Angry Senpai DOWN NOTE', 24, false);

				addOffset('idle');
				addOffset("singUP", 5, 37);
				addOffset("singRIGHT");
				addOffset("singLEFT", 40);
				addOffset("singDOWN", 14);
				playAnim('idle');

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				antialiasing = false;

			case 'spirit':
				frames = Paths.getPackerAtlas('characters/spirit');
				animation.addByPrefix('idle', "idle spirit_", 24, false);
				animation.addByPrefix('singUP', "up_", 24, false);
				animation.addByPrefix('singRIGHT', "right_", 24, false);
				animation.addByPrefix('singLEFT', "left_", 24, false);
				animation.addByPrefix('singDOWN', "spirit down_", 24, false);

				addOffset('idle', -220, -280);
				addOffset('singUP', -220, -240);
				addOffset("singRIGHT", -220, -280);
				addOffset("singLEFT", -200, -280);
				addOffset("singDOWN", 170, 110);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				antialiasing = false;

			case 'bf-4-1':
				frames = Paths.getSparrowAtlas('characters/alley/bf-4-1');

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);

				addOffset('idle', -5, 10);
				addOffset('singLEFT', 19, -5);
				addOffset('singDOWN', -9, -53);
				addOffset('singUP', -34, 34);
				addOffset('singRIGHT', -43, 3);

				playAnim('idle');
				flipX = true;		

			case 'bf-4-2':
				frames = Paths.getSparrowAtlas('characters/alley/bf-4-2');

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);

				addOffset('idle', -5, 10);
				addOffset('singLEFT', 19, -5);
				addOffset('singDOWN', -9, -53);
				addOffset('singUP', -34, 34);
				addOffset('singRIGHT', -43, 3);

				playAnim('idle');
				flipX = true;		
				
			case 'bf-4-2-alt':
				frames = Paths.getSparrowAtlas('characters/alley/bf-4-2-alt');

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);

				addOffset('idle', -5, 10);
				addOffset('singLEFT', 19, -5);
				addOffset('singDOWN', -9, -53);
				addOffset('singUP', -34, 34);
				addOffset('singRIGHT', -43, 3);

				playAnim('idle');
				flipX = true;		
				
			case 'bf-4-3':
				frames = Paths.getSparrowAtlas('characters/alley/bf-4-3');

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);

				addOffset('idle', -5, 10);
				addOffset('singLEFT', 19, -5);
				addOffset('singDOWN', -9, -53);
				addOffset('singUP', -34, 34);
				addOffset('singRIGHT', -43, 3);

				playAnim('idle');
				flipX = true;	
		
			case 'bf-4-3-alt':
				frames = Paths.getSparrowAtlas('characters/alley/bf-4-3-alt');

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('idle-alt', 'BF idle dance', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);

				addOffset('idle', -5, 10);
				addOffset('idle-alt', -5, 10);
				addOffset('singLEFT', 19, -5);
				addOffset('singDOWN', -9, -53);
				addOffset('singUP', -34, 34);
				addOffset('singRIGHT', -43, 3);

				playAnim('idle');
				flipX = true;	
				
			case 'bf-4-4':
				frames = Paths.getSparrowAtlas('characters/alley/bf-4-4');

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);

				addOffset('idle', 335, 29);
				addOffset('singUP', 32, 153);

				playAnim('idle');
				flipX = true;					
				
			case 'mom-valor':
				tex = Paths.getSparrowAtlas('characters/alley/mom-4-valor');
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				addOffset('idle');
				addOffset("singUP", 14, 71);
				addOffset("singRIGHT", 10, -60);
				addOffset("singLEFT", 250, -23);
				addOffset("singDOWN", 20, -160);

				playAnim('idle');	
				
			case 'mom-wolf-alt':
				tex = Paths.getSparrowAtlas('characters/alley/mom-4-wolf');
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				addOffset('idle');
				addOffset("singUP", 14, 71);
				addOffset("singRIGHT", 10, -60);
				addOffset("singLEFT", 250, -23);
				addOffset("singDOWN", 20, -160);

				playAnim('idle');	
			case 'mom-wolf':
				tex = Paths.getSparrowAtlas('characters/alley/mom-4-wolfAlt');
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				addOffset('idle');
				addOffset("singUP", 14, 71);
				addOffset("singRIGHT", 10, -60);
				addOffset("singLEFT", 250, -23);
				addOffset("singDOWN", 20, -160);

				playAnim('idle');									
		}

		dance();

		if (isPlayer)
		{
			flipX = !flipX;

			// Doesn't flip for BF, since his are already in the right place???
			if (!curCharacter.startsWith('bf'))
			{
				// var animArray
				var oldRight = animation.getByName('singRIGHT').frames;
				animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
				animation.getByName('singLEFT').frames = oldRight;

				// IF THEY HAVE MISS ANIMATIONS??
				if (animation.getByName('singRIGHTmiss') != null)
				{
					var oldMiss = animation.getByName('singRIGHTmiss').frames;
					animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
					animation.getByName('singLEFTmiss').frames = oldMiss;
				}
			}
		}
	}

	override function update(elapsed:Float)
	{
		if (!curCharacter.startsWith('bf'))
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;

			if (curCharacter == 'dad')
				dadVar = 6.1;
			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				trace('dance');
				dance();
				holdTimer = 0;
			}
		}

		switch (curCharacter)
		{
			case 'gf':
				if (animation.curAnim.name == 'hairFall' && animation.curAnim.finished)
					playAnim('danceRight');
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR GF DANCING SHIT
	 */
	public function dance()
	{
		if (!debugMode)
		{
			switch (curCharacter)
			{
				case 'gf':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				case 'gf-blank':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				case 'gf-pico':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}				
				case 'gf-pico2alt':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}//gf-1-3-2' 
				case 'gf-1-3':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}//gf-1-3-2' 					
				case 'gf-1-3-2':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}					
				case 'gf-christmas':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-car':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				case 'gf-pixel':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'spooky' | 'spooky-2' | 'spooky-3':
					danced = !danced;

					if (danced)
						playAnim('danceRight');
					else
						playAnim('danceLeft');
				default:
					playAnim('idle');
			}
		}
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);

		if (curCharacter == 'gf')
		{
			if (AnimName == 'singLEFT')
			{
				danced = true;
			}
			else if (AnimName == 'singRIGHT')
			{
				danced = false;
			}

			if (AnimName == 'singUP' || AnimName == 'singDOWN')
			{
				danced = !danced;
			}
		}
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}
}
