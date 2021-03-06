package {
	import mx.core.FontAsset;

	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.text.AntiAliasType;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

	/**
	 * @author Powerflasher
	 */
	public class Runtime extends Sprite {
		public var offset : Number = 0;

		public function Runtime() {
			check_for_fonts();
			load_fonts();
		}

		private function load_fonts() : void {
			var loader : Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, get_fonts);
			loader.load(new URLRequest("MyFonts.swf"));
		}

		private function get_fonts(event : Event) : void {
			FontAsset;
			check_for_fonts();
		}

		private function check_for_fonts() : void {
			if (Font.enumerateFonts().length) {
				for ( var i : int = 0; i < Font.enumerateFonts().length; i++ ) {
					displayEmbeddedFont(String(Font.enumerateFonts()[i].fontName));
				}
			} else {
				var text : TextField = new TextField();
				text.autoSize = TextFieldAutoSize.LEFT;
				text.antiAliasType = AntiAliasType.ADVANCED;
				text.text = '*********** Doh! No Fonts Found ***********';
				addChild(text);
				offset += text.height;
			}
		}

		private function displayEmbeddedFont(fontname : String) : void {
			var text : TextField = new TextField();
			text.embedFonts = true;
			text.autoSize = TextFieldAutoSize.LEFT;
			text.antiAliasType = AntiAliasType.ADVANCED;

			text.defaultTextFormat = new TextFormat(fontname, 20, 0x666666);
			text.text = fontname + " Font Is Pretty Cool";
			text.y = offset;
			addChild(text);
			offset += text.height;
		}
	}
}
