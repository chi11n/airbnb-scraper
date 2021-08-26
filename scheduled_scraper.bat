@echo off

setlocal enabledelayedexpansion 

SET current_year=%date:~-4%
SET current_month=%date:~7,2%
SET current_day=%date:~4,2%
set cal_search_month_count=3

REM length to max index number
SET length=10

SET locations[0]=Hunter Valley, New South Wales
SET locations[1]=Central Coast,New South Wales
SET locations[2]=South Coast,New South Wales
SET locations[3]=Blue Mountains, NSW
SET locations[4]=Wollongong, New South Wales
SET locations[5]=ShoalHaven,New South Wales
SET locations[6]=Richmond Valley, NSW
SET locations[7]=Southern Highlands, NSW
SET locations[8]=Mid North Coast, New South Wales
SET locations[9]=Southern Tablelands,NSW
SET locations[10]=Northern Rivers,NSW

echo %date% %time% Scheduled scraper started 

for /l %%n in (0,1,%length%) do ( 
	
	SET queryString=!locations[%%n]! 
	
	REM strip the comma and whitespace
	set filename=!queryString: =!
	set filename=!filename:,=_!_%current_year%_%current_month%_%current_day%T%time:~0,2%_%time:~3,2%.csv

	echo %date% %time% Running scraper for location !queryString! and outputing to file !filename!

	scrapy crawl airbnb -a query="!queryString!" -a cal_month=%current_month% -a cal_year=%current_year% -a cal_count=%cal_search_month_count% -o !filename!  
	
	echo %date% %time% Finished scraping !queryString! 
)

echo %date% %time% Scheduled scraper finished 


timeout /t 300

REM Put computer to sleep
REM Rundll32.exe Powrprof.dll,SetSuspendState Sleep

pause