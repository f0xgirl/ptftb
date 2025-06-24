using Godot;
using System;

public partial class Errorhandler : Node
{
   public static bool CheckIfExists(int id, PackedScene[] thing)
   {
      try
      {
         thing[id].CanInstantiate();
      }
      catch (IndexOutOfRangeException)
      {
         return false;
      }
      return true;
   }
}
