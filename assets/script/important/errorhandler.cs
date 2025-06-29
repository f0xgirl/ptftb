using Godot;
using System;

public partial class errorhandler : Node
{
   public bool CheckIfExists(int id, PackedScene[] thing)
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
