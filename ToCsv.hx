import haxe.io.Path;
import sys.io.File;

class ToCsv {
	static function main() {
		var args = Sys.args();
		var homepath = args[0];
		var csv:Array<String> = ["chn1,chn2,chn3,chn4"];
		var order:String = sys.io.File.getContent(Path.join([homepath,"song.txt"]));
		var orderArray:Array<String> = order.split(",");
		for(i in orderArray) {
			var pattern:String = sys.io.File.getContent(Path.join([homepath,"pattern_"+StringTools.lpad(i,"0",2)+".txt"]));
			var patternArray:Array<String> = pattern.split("\n");
			patternArray = patternArray.slice(1);
			for(j in patternArray) {
				var rowArray = j.split("|").slice(1);
				var csvRow = [];
				for(k in rowArray) {
					csvRow.push(k.substring(0,5)+k.substring(8,11));
				}
				var csvRowString = csvRow.join(",");
				csv.push(csvRowString);
			}
		}
		var csvString = csv.join("\n");
		File.saveContent(Path.join([homepath,"out.csv"]),csvString);
	}
}