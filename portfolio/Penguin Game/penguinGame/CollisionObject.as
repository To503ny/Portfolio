package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class CollisionObject extends MovieClip
	{
		protected var downwardVelocity:Number;
		protected var isRunning:Boolean;
		protected var isJumping:Boolean;

		public function CollisionObject()
		{
			// constructor code
			trace("i am any object that collides with the boundary");
			
			//initialize object to zero velocity and is not running
			downwardVelocity = 0;
			isRunning = false;
			
			//add an event listener for when the Flash playback head enters a frame
			addEventListener(Event.ENTER_FRAME, handleEnterFrame);
		}//end constructor
		
		//create the function that handles the ENTER_FRAME event
		private function handleEnterFrame(event:Event):void
		{
			//update by increasing the value of the velocity variable
			downwardVelocity += 2;
			
			//update the actual y- position of the object
			this.y += downwardVelocity;
			
		}//end handleEnterFrame function
		
		public function incrementUpward ()
		{
			//increment the y position up until not colliding
			this.y -= 0.1;
		}//end function incrementUpward
		
		public function keepOnBoundary ()
		{
			downwardVelocity = 0; //stops object from falling
			
			positionOnLanding(); // calls function
		}// end keepOnBoundary function
		
		public function positionOnLanding()
		{
			//overridden by subclass
			
		}//end positionOnLanding function

	}//end CollisionObject Class

}//end package