mob
	proc
		Primary_Lotus() //the verb name, look no var/mob/M in oview(1)
			if(src.stamina<stamina/maxStamina*30)
				src<<"You need to rest."
				return
			if(src.lotus==0) //if 0 it attacks if 1 it doesnt
				var/obj/K = new/obj/mark //assigns the sword to K
				// PLEASE keep in mind that the sword is a visual effec it does no real damage
				src.lotus=1 //makes it so you cant attack while it equals 1
				K.dir = src.dir //make the direction of K(sword) the direction of the player
				K.loc = src.loc //gives the loc of K(sword) the same as the player
				step(K, dir) //K(sword) take a step in the direction of the player
				var/turf/X = K.loc //the turf the sword is on
				spawn(3)//this nifty thing sleeps for the lines underneath it but continues the rest of the code as normal
					del(K) //deletes the visual sword
				for(var/mob/M as mob in X) //the mob (if any) that is in the loc of the sword
					if(M == src) //if that mob is the player, it continues out of the loop
						continue
					src.stamina-=stamina/maxStamina*30
					src.balance+=rand(0.36,0.68)
					src.maxStamina+=rand(0.28,0.84)
					src.earnedTaijutsu+=rand(0.24,0.92)
					src.frozen=1
					M.frozen=1
					src.dir=NORTH
					M.dir=NORTH
					sleep(10)
					src.loc=M.loc
					sleep(10)
					src.PushEnemy(M, 2, 6)
					src.PushEnemy(src, 2, 6)
					flick("loutus2",usr)
					sleep(20)
					flick("lotus",M)
					src.dir=SOUTH
					M.dir=SOUTH
					src.PushEnemy(M, 2, 6)
					src.PushEnemy(src, 2, 6)
					sleep(30)
					src.frozen=0
					M.frozen=0
					var/damage = rand(src.taijutsu/M.endurance*5.95,src.taijutsu/M.endurance*6.25) //assigns a random number between 1 and 5 to damage
					src<<"You attack [M] for [damage] damage!" //says you attack
					M<<"[src] attacks you for [damage] damage!" //tells the mob (in case that mob is another player) you attacked them
					if(src.gates>=3)
						damage+=damage/100*15
					M.health -= damage //the mobs hp is subtracted by the number in damage
					M.DeathCheck() //deletes mob from world NOT A VALID DEATH CODE WHEN FACING PLAYERS, DO CHANGE
					sleep(150) //code sleeps for 7/10 of a second, this is waht keeps marcos for super fast attacks
					src.lotus=0 //attacking goes to 0, now the usr can attack again