import std.csv: csvReader;
import std.mmfile;
import std.stdio;
import selim.zip;

struct quandl_row_layout {
	string symbol;
	string date;
	string open;
	string high;
	string low;
	string close;
	string volume;
	string dividend;
	string split;
	string adj_open;
	string adj_high;
	string adj_low;
	string adj_close;
	string adj_volume;
}

void main()
{
	import std.file: write;
	auto mmfile = new MmFile("EOD.complete.zip");
	auto zipData = new ZipArchive(mmfile[]);
	string csvPath_to = "";

	ulong number_of_lines = 0;

	foreach (name, am; zipData.directory) {
		string rawtext = cast(string)zipData.expand(am);
		//auto records = rawtext.csvReader!quandl_row_layout(',');
		// abcdefghijklmnopqrstuvyzx
		// B works
		// L does not work. Row length does not match.
		// D Row 4798184's length 13 does not match previous length of 14.
		/*
		foreach (record; records) {
			if(record.symbol[0] == 'D') writeln(record);
			number_of_lines++;
			if(number_of_lines % 500000 == 0) writeln(record);			
		}
		*/
		destroy(mmfile);
	}
}