package  
{
	
	import flash.display.MovieClip;
	import CollisionObject;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class player extends CollisionObject 
	{
		//variable for player x movement
		private var xMovement: Number;
		public var isAttacking:Boolean;
		private var attackTimer:Timer = new Timer(500,1);
		
		public function player() 
		{
			// constructor code
			trace("I am the player");
			//initalize the variable
			xMovement = 0;
			isAttacking = false;
			
			//add event listener for player movement
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}//end constructor
		
		private function enterFrameHandler (event:Event):void
		{
			this.x += xMovement;
		}
		
		//method to control left movement
		public function moveLeft():void
		{
			xMovement =-7;
			this.scaleX =-1;
			this.gotoAndStop("run");
			isRunning = true;
		}//end function moveLeft
		
		//function to controll right movement
		public function moveRight():void
		{
			xMovement =7;
			this.scaleX = 1;
			this.gotoAndStop("run");
			isRunning = true;
		}//end function moveRight
		
		//Function to control non movement
		public function standStill():void
		{
			xMovement = 0;
			isRunning = false;
		}//end function standStill
		
		override public function positionOnLanding()
		{
			isJumping = false;
			if (isAttacking == true)
			{
				//do nothing
			}//end if
			else if(isRunning == true)
			{
				this.gotoAndStop("run");
			}//end else if
			else
			{
				this.gotoAndStop("stop");
			}//end else
		}//end override function positionOnLanding
		
		//attack function
		public function attack()
		{
			//set boolean varible for attacking to true
			isAttacking = true;
			//call the animation for attack
			this.gotoAndStop("attack");
			//set up eventlistener for when the timer stops
			attackTimer.addEventListener(TimerEvent.TIMER_COMPLETE, doneAttacking);
			//start the attack timer
			attackTimer.start();
			
		}//end attack function
		
		public function startJumping()
		{
			if(isJumping == false)
			{
				//set boolean variable to true
				isJumping = true;
				//call jump animation
				this.gotoAndStop("jump");
				//set landing speed
				downwardVelocity = -20;
			}//end if
		}//end startJumping function
		
		public function doneAttacking (event:TimerEvent):void
		{
			//set boolean attack var to false
			isAttacking = false;
			//call stop animation
			this.gotoAndStop("stop");
		}//end doneAttacking function
		
	}//end player class
	
}//end package
