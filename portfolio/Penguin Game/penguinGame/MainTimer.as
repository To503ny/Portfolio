package  
{
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import flash.display.MovieClip;
	import flash.display3D.IndexBuffer3D;
	
	
	public class MainTimer extends MovieClip 
	{
		//init vars for class
		private var currentMin:int;
		private var currentSec:int;
		
		//Create one-second timer from Flash's Timer Class
		private var oneSecondTimer:Timer = new Timer (1000,1);
		public var timerHasStopped:Boolean = false;
		
		public function MainTimer() 
		{
			trace("the main timer is here");
			currentMin = 1;
			currentSec = 5;
			
			minBox.text = String(currentMin);
			
			if(currentSec < 10)
			{
				secBox.text = "0" + String(currentSec);
			}
			else
			{
				secBox.text = String(currentSec);
			}
			
			oneSecondTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
			oneSecondTimer.start();
			
		}//end default constructor
		
		private function onTimerComplete (event:TimerEvent) :void
			{
				currentSec = currentSec -1;
				if (currentSec<0)
				{
					currentSec = 59;
					currentMin -= 1;
				}
				//end if
				if(currentMin <0)
				{
					currentMin = 0;
					currentSec = 0;
					timerHasStopped = true;
				}
				else
				{
					oneSecondTimer.start();
				}//end else
				
				//update
				minBox.text = String(currentMin);
				secBox.text = String(currentSec);
				
				//Adjust displa for seconds less than 10
				if(currentSec <10)
				{
					secBox.text = "0" + String(currentSec);
				}//end if
			}//end of onTimerComplete
			
			public function resetTimer():void
			{
				currentMin = 1;
				currentSec = 5;
				minBox.text = String(currentMin);
				secBox.text = String(currentSec);
				
				if (currentSec < 10)
				{
					secBox.text = "0" + String(currentSec);
				}//end if
				timerHasStopped = false;
				oneSecondTimer.start();
			}//end function resetTimer
		
	}// MainTimer Class
	
}//End Package
