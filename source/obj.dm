obj
	var
		owner=""
obj/Wind
	icon = 'icons/male.dmi'
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