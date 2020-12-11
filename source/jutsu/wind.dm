obj
	Wind
		icon = 'icons/mob/male.dmi'
		icon_state="Dual"
		density = 1 //This object must be dense for this to work!
		Bump(atom/a) //If the object hits anything.
			if(ismob(a)) //Checks to see if the object the object hit is a character.
				var/mob/M=a
				var/mob/A=owner
				var/damage = rand(A.ninjutsu/M.endurance,A.ninjutsu/M.endurance*2.25)
				M.health-=damage
				M.DeathCheck()
				A<<"You attack [M] for [damage] damage!" //says you attack
				M<<"[A] attacks you for [damage] damage!" //tells the mob (in case that mob is another player) you attacked them
				del(src) //Deletes the object.
			else
				del(src)

mob
	verb
		Wind()
			var/obj/O = new /obj/Wind(usr.loc)
			src.chakra-=src.chakra/100/1
			src.balance-=rand(0.09,0.17)
			src.maxChakra+=rand(0.07,0.21)
			src.earnedNinjutsu+=rand(0.06,10.23)
			O.owner=usr
			O:dir = usr.dir
			while(O)
				sleep(1)
				step(O,O:dir)//Moves the object in question.