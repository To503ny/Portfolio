package
{
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.system.fscommand;
	import flash.events.MouseEvent;

	//our class
	import MainTimer;
	import flash.events.MouseEvent;

	public class MainDocument extends MovieClip
	{
		private var currentNumberOfEnemiesOnstage: int;
		private var initialNumberOfEnemiesToCreate: int = 2;
		private var enemyKills: int;
		private var childToRemove: int;
		private var level: int = 1;
		private var makeNewEnemyTimer: Timer = new Timer(3000, 1);
		private var finishOffEnemy: Timer = new Timer(300, 1);
		private var gameTimer: MainTimer;
		private var thePlayer: player;
		private var theEnemy: Enemy;
		private var maxEnemies: int = 3;
		private var e: int = 0;
		private var childrenOnStage: int;
		private var lastX: int;
		//flag var for scrolling
		private var theStageNeedsToScroll: Boolean = false;
		private var numChildrenInGameStage: int;
		private var jump: JumpSound = new JumpSound();
		private var slap: SlapSound = new SlapSound();
		private var token: TokenSound = new TokenSound();

		//my var additions to the game
		private var maxHealth: int = 280;
		private var increaseHealth: int = 6;
		private var maxLives = 3;
		public var outOfLives: Boolean = false;

		public function MainDocument()
		{
			// constructor code
			trace("the main document is alive");

			makeNewEnemyTimer.addEventListener(TimerEvent.TIMER_COMPLETE, makeNewEnemyHandler);

			makeNewEnemyTimer.start();

			//create instance of the MainTimer class
			gameTimer = new MainTimer();

			//add the timer to the stage
				addChild(gameTimer);

			//position timer on stage
			gameTimer.x = 20;
			gameTimer.y = 20;

			//add the player
			thePlayer = new player();
			addChild(thePlayer);

			//adjust its position on the stage
			thePlayer.x = stage.stageWidth * 0.5;
			//assign the name property
			thePlayer.name = "player";

			while (e < initialNumberOfEnemiesToCreate)
			{
				createEnemy();
				e++;
				enemyKills = 0;
				killScoreBox.text = String(enemyKills) + " KILLS";
			} //end while

			//update this variable ever time a child is added to the stage
			childrenOnStage = this.numChildren;

			numOfLives.text = maxLives;

			//add an event listener to control timing of main game loop
			addEventListener(Event.ENTER_FRAME, mainGameLoop);

			stage.focus = stage;

			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);

			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);

			playAgainBtn.addEventListener(MouseEvent.CLICK, playAgainBtnHandler);
			quitBtn.addEventListener(MouseEvent.CLICK, quitBtnHandler);

			gameOver.visible = false;
			playAgainBtn.visible = false;
			quitBtn.visible = false;

		} //end constructor


		private function keyDownHandler(e: KeyboardEvent): void
		{
			if (outOfLives == false)
			{
				switch (e.keyCode)
				{
					case 37: //left
						thePlayer.moveLeft();
						break;
					case 38: //up
						jump.play();
						thePlayer.startJumping();
						break;
					case 39: //right
						thePlayer.moveRight();
						break;
					case 40: //down to attack
						slap.play();
						thePlayer.attack();
						break;
				} //end switch
			} //end if outOfLives ==false
		} //end function keyDownHandler

		private function keyUpHandler(e: KeyboardEvent): void
		{
			switch (e.keyCode)
			{
				case 37:
				case 39:
					thePlayer.standStill();
					break;
				case 38: //jump
					break;
				case 40: //down to attack
					break;
				default:
			} //end switch
		} //end function keyUpHandler

		private function playAgainBtnHandler(e: MouseEvent): void
		{
			trace("play again button clicked");
			outOfLives = false;
			resetBoard();
		}

		private function quitBtnHandler(e: MouseEvent): void
		{
			trace("quit button clicked");
			fscommand('quit');
		}

		private function createEnemy(): void
		{
			if (outOfLives == false)
			{
				trace("create enemy ");
				// pass in a random speed between 1 and 5
				theEnemy = new Enemy((Math.random() * 5) + 1);
				addChild(theEnemy);

				theEnemy.x = (Math.random() * stage.stageWidth);
				theEnemy.y = 0;
				//assign the name property
				theEnemy.name = "enemy";
			} //end outoflives

			//update this variable every time a child is added to the stage
			childrenOnStage = this.numChildren;

		} //end creatEnemy function

		private function subtractPlayerLifeAndCheckForEndGame(): void
		{
			if (maxLives > 0)
			{
				trace("life lost")
				maxLives -= 1;
				numOfLives.text = maxLives;
			}
			if (maxLives < 1)
			{
				outOfLives = true;
				gameOver.visible = true;
				playAgainBtn.visible = true;
				quitBtn.visible = true;
			}

		} //end function createLives


		//the main loop for the game
		private function mainGameLoop(event: Event): void
		{
			checkForGameReset();

			removeOrCreateNewEnemies();

			processCollisions();

			scrollStage();
		} //end function mainGameLoop

		private function checkForGameReset(): void
		{
			if (gameTimer.timerHasStopped == true)
			{
				resetBoard();
			}
			else if (thePlayer.y > stage.stageHeight)
			{
				resetBoard();
				subtractPlayerLifeAndCheckForEndGame();
			}
			else if (theGameStage.theFish.hitTestPoint(thePlayer.x, thePlayer.y, true))
			{
				trace("touching fish");
				if (maxLives <= 2 && outOfLives == false)
				{
					maxLives += 1;
				}
				else
				{
					numOfLives.text = maxLives;
					resetBoard();
				}
			}
			else if (health.width <= 2)
			{
				resetBoard();
				subtractPlayerLifeAndCheckForEndGame();
			}
		} //end function checkForGameReset

		private function resetBoard(): void
		{
			if (maxLives <= 3 && outOfLives == false)
			{
				health.width = 300;
				thePlayer.x = stage.stageWidth * 0.5;
				theGameStage.x = stage.stageWidth * 0.5;
				thePlayer.y = 0;
				theGameStage.y = 0;
				enemyKills = 0;
				killScoreBox.text = String(enemyKills) + " KILLS";
				gameTimer.resetTimer();
				quitBtn.visible = false;
				playAgainBtn.visible = false;
				gameOver.visible = false;

				if (maxLives <= 0)
				{
					maxLives = 3;
					numOfLives.text = maxLives;
				} //end if
			}



		} //end resetBoard function

		private function processCollisions(): void
		{
			//set up main loop to look through all collidable object on stage
			for (var c: int; c < childrenOnStage; c++)
			{
				//test for a player or enemy child on stage
				if (getChildAt(c).name == "player" || getChildAt(c).name == "enemy")
				{
					//see if object is touching the game stage
					if (theGameStage.hitTestPoint(getChildAt(c).x, getChildAt(c).y, true))
					{
						//While it is still touching inch it up just until it stops
						while (theGameStage.hitTestPoint(getChildAt(c).x, getChildAt(c).y, true) == true)
						{
							//called from CollisionObject class, so force the connection
							CollisionObject(getChildAt(c)).incrementUpward();
							if (theGameStage.hitTestPoint(getChildAt(c).x, getChildAt(c).y, true) == false)
							{
								CollisionObject(getChildAt(c)).keepOnBoundary(); //make it stick
							} //end if
						} //end while loop
					} //end if hitTestPoint

				} // end if
				if (outOfLives == false)
				{
					if (getChildAt(c).name == "enemy")
					{
						if (getChildAt(c).hitTestPoint(thePlayer.x, thePlayer.y, true))
						{
							if (thePlayer.isAttacking == false)
							{
								//we are being attacked
								health.width = health.width - 2;
								Enemy(getChildAt(c)).makeEnemyAttack();
							}
							else
							{
								//we are attacking the enemy
								childToRemove = c;
								Enemy(getChildAt(c)).makeEnemyDie();
								finishOffEnemy.start();
								finishOffEnemy.addEventListener(TimerEvent.TIMER_COMPLETE, finishOffEnemyComplete);
							} //end else

						} //end if hitTestPoint thePlayer.x, thePlayer.y
						else if (Enemy(getChildAt(c)).enemyIsAttacking == true)
						{
							Enemy(getChildAt(c)).makeEnemyStopAttacking();
						} //end else enemy is attacking
					} //end if
				} //end if outoflives
			} //end for

			numChildrenInGameStage = theGameStage.numChildren;

			for (var d: int = 0; d < numChildrenInGameStage; d++)
			{
				if (theGameStage.getChildAt(d).hasOwnProperty("isToken") && theGameStage.getChildAt(d).visible == true)
				{
					if (thePlayer.hitTestObject(theGameStage.getChildAt(d)))
					{
						trace("hit token");
						//paly sound
						token.play();
						theGameStage.removeChildAt(d);

						if (health.width < maxHealth)
						{
							health.width = health.width + increaseHealth;
						} //end if

						numChildrenInGameStage = theGameStage.numChildren;
					} //end if
				} //end if
			} //end for
		} //end function processCollisions

		private function scrollStage(): void
		{
			if (thePlayer.x != lastX)
			{
				theStageNeedsToScroll = true;
			}
			else
			{
				theStageNeedsToScroll = false;
			} //end if
			if (theStageNeedsToScroll = true)
			{
				for (var b: int = 0; b < childrenOnStage; b++)
				{
					if (getChildAt(b).name == "enemy")
					{
						getChildAt(b).x += (stage.stageWidth * 0.5) - thePlayer.x;
					} //end if
				} //end for
				theGameStage.x += (stage.stageWidth * 0.5) - thePlayer.x;
			} //end if

			thePlayer.x = stage.stageWidth * 0.5;
			lastX = thePlayer.x;

		} //end function scrollStage

		private function removeOrCreateNewEnemies(): void
		{
			for (var c: int = 0; c < childrenOnStage; c++)
			{
				if (getChildAt(c).name == "enemy" && getChildAt(c).y > stage.stageHeight)
				{
					removeChildAt(c);
					createEnemy();
				} //end if
				if (getChildAt(c).name == "enemy" && getChildAt(c).x < thePlayer.x - stage.stageWidth)
				{
					removeChildAt(c);
					createEnemy();
				} //end if				
			} //end for loop
		} //end function removeOrCreateNewEnemies 

		private function makeNewEnemyHandler(event: TimerEvent): void
		{
			currentNumberOfEnemiesOnstage = 0;
			for (var c: int = 0; c < childrenOnStage; c++)
			{
				if (getChildAt(c).name == "enemy")
				{
					currentNumberOfEnemiesOnstage++;
				} //end if
			} //end for
			if (currentNumberOfEnemiesOnstage < maxEnemies)
			{
				trace("not enough enemies onstage, make more");
				createEnemy();
			} //end if
			makeNewEnemyTimer.start();
		} //end function makeNewEnemyHandler

		public function finishOffEnemyComplete(event: TimerEvent): void
		{
			enemyKills++;
			killScoreBox.text = String(enemyKills) + " KILLS";
			removeChildAt(childToRemove);
			childrenOnStage = this.numChildren;
		} //end function finishOffEnemyComplete


	} //end MainDocument class

} //end package