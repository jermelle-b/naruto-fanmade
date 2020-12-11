mob
	proc
		Power_Hit() //the verb name, look no var/mob/M in oview(1)
			if(src.stamina<stamina/maxStamina*15)
				src<<"You need to rest."
				return
			if(src.power == 0) //if 0 it attacks if 1 it doesnt
				var/obj/K = new/obj/mark //assigns the sword to K
				// PLEASE keep in mind that the sword is a visual effec it does no real damage
				src.power = 1 //makes it so you cant attack while it equals 1
				K.dir = src.dir //make the direction of K(sword) the direction of the player
				K.loc = src.loc //gives the loc of K(sword) the same as the player
				step(K, dir) //K(sword) take a step in the direction of the player
				var/turf/X = K.loc //the turf the sword is on
				spawn(3)//this nifty thing sleeps for the lines underneath it but continues the rest of the code as normal
					del(K) //deletes the visual sword
				for(var/mob/M as mob in X) //the mob (if any) that is in the loc of the sword
					if(M == src) //if that mob is the player, it continues out of the loop
						continue
					src.stamina-=stamina/maxStamina*15
					src.balance+=rand(0.18,0.34)
					src.maxStamina+=rand(0.14,0.42)
					src.earnedTaijutsu+=rand(0.12,0.46)
					src.PushEnemy(M, 2, 6)
					flick("attack",usr)
					src.overlays+="power"
					M.frozen=1
					src.frozen=1
					sleep(5)
					src.overlays-="power"
					M.frozen=0
					src.frozen=0
					sleep(15)
					var/damage = rand(src.taijutsu/M.endurance*1.95,src.taijutsu/M.endurance*2.12) //assigns a random number between 1 and 5 to damage
					if(prob(90))//You got a 70% chance of it continueing and not going to the else
						if(src.gates>=3)
							damage+=damage/100*15
						src<<"You attack [M] for [damage] damage!" //says you attack
						M<<"[src] attacks you for [damage] damage!" //tells the mob (in case that mob is another player) you attacked them
						M.health -= damage //the mobs hp is subtracted by the number in damage
						M.DeathCheck() //deletes mob from world NOT A VALID DEATH CODE WHEN FACING PLAYERS, DO CHANGE
					else //if you didn't hit
						src<<"You attempt to attack [M] but miss!" //says player miss
						M<<"[src] attempts to attack you but misses!" //tells the M player missed
				sleep(30) //code sleeps for 7/10 of a second, this is waht keeps marcos for super fast attacks
				src.power = 0 //attacking goes to 0, now the usr can attack again