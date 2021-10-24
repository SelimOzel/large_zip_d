import std.csv: csvReader;
import std.mmfile;
import std.stdio;
import selim.zip;
import std.zlib;
import std.conv : to;
import std.algorithm.iteration : map;

void main()
{
	import std.file: write;
	auto mmfile = new MmFile("EOD.partial.zip");
	auto zipData = new ZipArchive(mmfile[]);

	foreach (name, am; zipData.directory) {
		string rawtext = cast(string)zipData.expand(am);
		write("EOD.partial.csv", rawtext);
		destroy(mmfile);
	}
}