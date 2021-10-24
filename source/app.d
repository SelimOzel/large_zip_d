import std.process;
import std.stdio;

void main()
{
	string path_7z = "\"C:\\Program Files\\7-Zip\\\"7z";
	string command_7z = " e ";
	string zip_file_destination = "\"C:\\Software\\large_zip_d\\EOD.complete.zip\"";
	auto result = executeShell(path_7z~command_7z~zip_file_destination);
	writeln(result.output);
}