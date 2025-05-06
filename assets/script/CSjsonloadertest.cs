using Godot;
using System;
using System.IO;

public partial class CSjsonloadertest : Resource
{
	//this literally only exists so i can solve an issue in editor, this does not exist when you export the game
	public Godot.Collections.Dictionary saved_data = new Godot.Collections.Dictionary();
	
	public void save_level_data(string level_name, int score)
	{
		//TODO: add shit
	}

	public int load_level_data(string level_name)
	{
		//TODO: watch that video and figure out how tf to write and load json files
	}
}
