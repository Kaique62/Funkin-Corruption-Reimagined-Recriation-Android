#if sys
package;

import lime.app.Application;
#if windows
import Discord.DiscordClient;
#end
import openfl.display.BitmapData;
import openfl.utils.Assets;
import flixel.ui.FlxBar;
import haxe.Exception;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

import sys.FileSystem;
import sys.io.File;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.text.FlxText;

using StringTools;

class CharPreload extends MusicBeatState
{
	var toBeDone = 0;
	var done = 0;

	var loaded = false;

	public static var bitmapData:Map<String,FlxGraphic>;

	var images = [];


	override function create()
	{
        bitmapData = new Map<String,FlxGraphic>();
			trace("caching images...");

            #if android
			for (i in HSys.readDirectory("assets/shared/images/characters/gopico/"))
            #else
            for (i in FileSystem.readDirectory(FileSystem.absolutePath("assets/shared/images/characters/gopico/")))
            #end     
			{
				if (!i.endsWith(".png"))
					continue;
				images.push(i);
			}
		toBeDone = Lambda.count(images);


		trace('starting caching..');
		

		// cache thread

		sys.thread.Thread.create(() -> {
            trace('caching');
			cache();
		});

		super.create();
	}

	var calledDone = false;

	override function update(elapsed) 
	{
		super.update(elapsed);
	}


	function cache()
	{
		trace("LOADING: " + toBeDone + " OBJECTS.");

		for (i in images)
		{
            trace(i);
			var replaced = i.replace(".png","");
			var data:BitmapData = BitmapData.fromFile("assets/shared/images/characters/gopico/" + i);
			trace('id ' + replaced + ' file - assets/shared/images/characters/gopico/' + i + ' ${data.width}');
			var graph = FlxGraphic.fromBitmapData(data);
            trace('var graph 1');
			graph.persist = true;
            trace('var graph 2');
			graph.destroyOnNoUse = false;
            trace('var graph 3');
			bitmapData.set(replaced,graph);
            trace('var graph 4');
			done++;
		}


		trace("Finished caching...");

        LoadingState.loadAndSwitchState(new PlayState(), true);
	}

}
#end