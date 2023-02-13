package;

import lime.app.Promise;
import lime.app.Future;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;
import openfl.utils.Assets;
import lime.utils.Assets as LimeAssets;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import flash.display.BitmapData;
import flixel.graphics.FlxGraphic;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;

import sys.FileSystem;
import sys.io.File;

import haxe.io.Path;

using StringTools;

class LoadingState extends MusicBeatState
{
	inline static var MIN_TIME = 1.0;
	
	var target:FlxState;
	var stopMusic = false;
	var callbacks:MultiCallback;
	

	var loadingBG:FlxSprite;
	var danceLeft = false;

	var toBeDone = 0;
	var done = 0;

	var loaded = false;

	public static var bitmapData:Map<String,FlxGraphic>;

	var images = [];

	public function new(target:FlxState, stopMusic:Bool)
	{
		super();
		this.target = target;
		this.stopMusic = stopMusic;
	}
	
	override function create()
	{ 

		loadingBG = new FlxSprite(-100).loadGraphic(Paths.image('loadingScreen'));
		loadingBG.scrollFactor.x = 0;
		loadingBG.scrollFactor.y = 0.10;
		loadingBG.setGraphicSize(Std.int(loadingBG.width * 1.1));
		loadingBG.updateHitbox();
		loadingBG.screenCenter();
		loadingBG.antialiasing = true;
		add(loadingBG);



        bitmapData = new Map<String,FlxGraphic>();

			if(PlayState.SONG.song == 'Extrication'){

			/*	#if android
				for (i in HSys.readDirectory("assets/shared/images/characters/gopico/"))
				#else
				for (i in FileSystem.readDirectory(FileSystem.absolutePath("assets/shared/images/characters/gopico/")))
				#end     
				{
					if (!i.endsWith(".png"))
						continue;
					images.push(i);
				}*/
			images = ['picod3-2.png', 'picod3-3.png', 'picod3-4.png', 'picod3-5.png', 'gf-3-2.png', 'bf-3-2.png'];
			toBeDone = Lambda.count(images); 
	
			trace('Preloading Pico Character swaps');
			
	
			// cache thread
	
			sys.thread.Thread.create(() -> {
				trace('caching');
				cache();
			});

			}
			if(PlayState.SONG.song == 'Glammed'){

				/*	#if android
					for (i in HSys.readDirectory("assets/shared/images/characters/gopico/"))
					#else
					for (i in FileSystem.readDirectory(FileSystem.absolutePath("assets/shared/images/characters/gopico/")))
					#end     
					{
						if (!i.endsWith(".png"))
							continue;
						images.push(i);
					}*/
				images = ['ANGRYMOM.png', 'ANGRYMOM2.png', 'momd3.png', 'pico3-recorrupt.png', 'picod3.png', 'pico-recorruptfull.png', 'picouncorrupt2.png'];
				toBeDone = Lambda.count(images); 
		
				trace('Preloading Pico Character swaps');
				
		
				// cache thread
		
				sys.thread.Thread.create(() -> {
					trace('caching');
					cache();
				});
				}			


		initSongsManifest().onComplete
		(

			function (lib)
			{
				callbacks = new MultiCallback(onLoad);
				var introComplete = callbacks.add("introComplete");
				checkLoadSong(getSongPath());
				if (PlayState.SONG.needsVoices)
					checkLoadSong(getVocalPath());
				checkLibrary("shared");
				if (PlayState.storyWeek > 0)
					checkLibrary("week" + PlayState.storyWeek);
				else
					checkLibrary("tutorial");
				

				var fadeTime = 0.5;
				FlxG.camera.fade(FlxG.camera.bgColor, fadeTime, true);
				new FlxTimer().start(fadeTime + MIN_TIME, function(_) introComplete());
			}
		);


	}
	
	function cache()
		{
			if (PlayState.SONG.song == "Extrication"){
			for (i in images)
			{
				trace(i);
				var replaced = i.replace(".png","");
				var data:BitmapData = BitmapData.fromFile("assets/shared/images/characters/gopico/" + i);
				trace('id ' + replaced + ' file - assets/shared/images/characters/gopico/' + i + ' ${data.width}');
				var graph = FlxGraphic.fromBitmapData(data);
				graph.persist = true;
				graph.destroyOnNoUse = false;
				trace('working');
				bitmapData.set(replaced,graph);
				trace('possible crash');
				done++;
			}
			}
			else if(PlayState.SONG.song == "Glammed"){
				for (i in images)
					{
						trace(i);
						var replaced = i.replace(".png","");
						var data:BitmapData = BitmapData.fromFile("assets/shared/images/characters/woman/d3/" + i);
						trace('id ' + replaced + ' file - assets/shared/images/characters/woman/d3/' + i + ' ${data.width}');
						var graph = FlxGraphic.fromBitmapData(data);
						graph.persist = true;
						graph.destroyOnNoUse = false;
						trace('working');
						bitmapData.set(replaced,graph);
						trace('possible crash');
						done++;
					}		
			}
			trace("LOADING: " + toBeDone + " OBJECTS.");
	
	
	
			trace("Finished caching...");
	
			LoadingState.loadAndSwitchState(new PlayState(), true);
		}

	function checkLoadSong(path:String)
	{
		if (!Assets.cache.hasSound(path))
		{
			var library = Assets.getLibrary("songs");
			final symbolPath = path.split(":").pop();
			// @:privateAccess
			// library.types.set(symbolPath, SOUND);
			// @:privateAccess
			// library.pathGroups.set(symbolPath, [library.__cacheBreak(symbolPath)]);
			var callback = callbacks.add("song:" + path);
			Assets.loadSound(path).onComplete(function (_) { callback(); });
		}
	}
	// function preloadCharacters(event:FileListEvent):Void {
	// var list:Array = events.files;
	// var images = [];
	// if (!list.endsWith(".png"))
	// 	continue;
	// images.push();
	// trace(images);
	// }
	function checkLibrary(library:String)
	{

		trace(Assets.hasLibrary(library));
		if (Assets.getLibrary(library) == null)
		{

			@:privateAccess
			if (!LimeAssets.libraryPaths.exists(library))
				throw "Missing library: " + library;
			
			var callback = callbacks.add("library:" + library);
			Assets.loadLibrary(library).onComplete(function (_) { callback(); });

			//preloadCharacters('assets/shared/images/characters/gopico');
		}
	}
	
	override function beatHit()
	{
		super.beatHit();
		
		danceLeft = !danceLeft;
		
	}
	
	override function update(elapsed:Float)
	{
		super.update(elapsed);
		#if debug
		if (FlxG.keys.justPressed.SPACE)
			trace('fired: ' + callbacks.getFired() + " unfired:" + callbacks.getUnfired());
		#end
	}
	
	function onLoad()
	{
		if (stopMusic && FlxG.sound.music != null)
			FlxG.sound.music.stop();
		
			FlxG.switchState(target);

	}
	
	static function getSongPath()
	{
		return Paths.inst(PlayState.SONG.song);
	}
	
	static function getVocalPath()
	{
		return Paths.voices(PlayState.SONG.song);
	}
	
	inline static public function loadAndSwitchState(target:FlxState, stopMusic = false)
	{
			FlxG.switchState(getNextState(target, stopMusic));
	}
	
	static function getNextState(target:FlxState, stopMusic = false):FlxState
	{
		Paths.setCurrentLevel("week" + PlayState.storyWeek);
		//#if NO_PRELOAD_ALL
		var loaded = isSoundLoaded(getSongPath())
			&& (!PlayState.SONG.needsVoices || isSoundLoaded(getVocalPath()))
			&& isLibraryLoaded("shared");
		
		if (!loaded)
			return new LoadingState(target, stopMusic);
		//#end
		if (stopMusic && FlxG.sound.music != null)
			FlxG.sound.music.stop();
		
		return target;
	}
	
	//#if NO_PRELOAD_ALL
	static function isSoundLoaded(path:String):Bool
	{
		return Assets.cache.hasSound(path);
	}
	
	static function isLibraryLoaded(library:String):Bool
	{
		return Assets.getLibrary(library) != null;
	}
	//#end
	
	override function destroy()
	{
		super.destroy();
		
		callbacks = null;
	}
	
	static function initSongsManifest()
	{
		var id = "songs";
		var promise = new Promise<AssetLibrary>();

		var library = LimeAssets.getLibrary(id);

		if (library != null)
		{
			return Future.withValue(library);
		}

		var path = id;
		var rootPath = null;

		@:privateAccess
		var libraryPaths = LimeAssets.libraryPaths;
		if (libraryPaths.exists(id))
		{
			path = libraryPaths[id];
			rootPath = Path.directory(path);
		}
		else
		{
			if (StringTools.endsWith(path, ".bundle"))
			{
				rootPath = path;
				path += "/library.json";
			}
			else
			{
				rootPath = Path.directory(path);
			}
			@:privateAccess
			path = LimeAssets.__cacheBreak(path);
		}

		AssetManifest.loadFromFile(path, rootPath).onComplete(function(manifest)
		{
			if (manifest == null)
			{
				promise.error("Cannot parse asset manifest for library \"" + id + "\"");
				return;
			}

			var library = AssetLibrary.fromManifest(manifest);

			if (library == null)
			{
				promise.error("Cannot open library \"" + id + "\"");
			}
			else
			{
				@:privateAccess
				LimeAssets.libraries.set(id, library);
				library.onChange.add(LimeAssets.onChange.dispatch);
				promise.completeWith(Future.withValue(library));
			}
		}).onError(function(_)
		{
			promise.error("There is no asset library with an ID of \"" + id + "\"");
		});

		return promise.future;
	}
}

class MultiCallback
{
	public var callback:Void->Void;
	public var logId:String = null;
	public var length(default, null) = 0;
	public var numRemaining(default, null) = 0;
	
	var unfired = new Map<String, Void->Void>();
	var fired = new Array<String>();
	
	public function new (callback:Void->Void, logId:String = null)
	{
		this.callback = callback;
		this.logId = logId;
	}
	
	public function add(id = "untitled")
	{
		id = '$length:$id';
		length++;
		numRemaining++;
		var func:Void->Void = null;
		func = function ()
		{
			if (unfired.exists(id))
			{
				unfired.remove(id);
				fired.push(id);
				numRemaining--;
				
				if (logId != null)
					log('fired $id, $numRemaining remaining');
				
				if (numRemaining == 0)
				{
					if (logId != null)
						log('all callbacks fired');
					callback();
				}
			}
			else
				log('already fired $id');
		}
		unfired[id] = func;
		return func;
	}
	
	inline function log(msg):Void
	{
		if (logId != null)
			trace('$logId: $msg');
	}
	
	public function getFired() return fired.copy();
	public function getUnfired() return [for (id in unfired.keys()) id];
}
