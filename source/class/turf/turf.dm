turf
	grass
		icon = 'icons/turf/grass.dmi'

	Click(i)//(Walk)
		if(usr.stamina<=usr.maxStamina/100*2.5)
			return
		if(usr.dash==1)
			return
		if(i:density)
			return
		if(usr.gates>3||usr.gates<1)
			return
		else
			var/mob/M=usr
			if(usr == M.loc)
				return
			usr.stamina-=usr.maxStamina/100*2.5
			usr.dash=1
			usr.speed+=3 // Changes your speed to the default 6
			walk_to(usr,i,0,0) //Moves the player to i with the lag as the player's speed
			flick("dash",usr)
			sleep(15)
			usr.speed-=2
			sleep(15)
			usr.dash=0

	DblClick(i)//(Run)
		if(usr.stamina<=usr.maxStamina/100*5.0)
			return
		if(usr.dash2==1)
			return
		if(i:density)
			return
		if(usr.gates<3)
			return
		else
			var/mob/M=usr
			if(usr == M.loc)
				return
			usr.dash2=1
			usr.speed+=2 // Changes your speed to the default 6
			usr.stamina-=usr.maxStamina/100*0.9
			usr.health-=usr.maxHealth/100*0.9
			walk_to(usr,i,0,0) //Moves the player to i with the lag as the player's speed
			flick("dash",usr)
			sleep(15)
			usr.speed-=2
			sleep(15)
			usr.dash2=0