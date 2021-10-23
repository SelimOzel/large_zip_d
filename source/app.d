import std.mmfile;
import std.stdio;
import std.zip;

void main()
{
	import std.file: write;
	auto mmfile = new MmFile("EOD.complete.zip");
	auto zipData = new ZipArchive(mmfile[]);
	string csvPath_to = "";
	foreach (name, am; zipData.directory) {
		write(name, zipData.expand(am));
		destroy(mmfile);
	}
}
