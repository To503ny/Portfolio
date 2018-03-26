package
{

	//import flash.display.MovieClip;
	import CollisionObject;
	import flash.events.Event;
	import MainDocument;

	public class Enemy extends CollisionObject
	{
		private var enemyAboutToDie: Boolean;
		private var xMovement: Number;
		private var speedVar: int;
		public var enemyIsAttacking: Boolean;

		public function Enemy(speed: int)
		{
			//trace statement to test
			trace("I am the Enemy");
			enemyAboutToDie = false;
			enemyIsAttacking = false;
			speedVar = speed;
			xMovement = speedVar; //listen for Enter_Frame Event
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			//listen for ENTER_FRAME event
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		} //end constructor

		private function enterFrameHandler(e: Event): void
		{
				this.x -= xMovement; //this moves enemy across the stage to the left
		}

		override public function positionOnLanding()
		{
			if (enemyAboutToDie == true)
			{
				this.gotoAndStop("dead");
			} //end if
			else if (enemyIsAttacking == true)
			{
				this.gotoAndStop("attack");
			} //end else if
			else
			{
				this.gotoAndStop("run");
			} //end else
		} //end function positionOnLanding

		public function makeEnemyDie()
		{
			this.gotoAndStop("dead");
			enemyAboutToDie = true;
			xMovement = 0;
		} //end function makeEnemyDie

		public function makeEnemyAttack()
		{
			this.gotoAndStop("attack");
			enemyIsAttacking = true;
			xMovement = 0;
		} //end function makeEnemyAttack

		public function makeEnemyStopAttacking()
		{
			this.gotoAndStop("stop");
			enemyIsAttacking = true;
			xMovement = speedVar;
		} //end function makeEnemyStopAttacking

	} //end Enemy class

} //end package