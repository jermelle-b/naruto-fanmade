world
	hub ="DarkerEmerald.TM"
	name="Topic Menu v.2"
	New()
		..()
	Del()
		..()

var/const/BGCOLORWINDOW="#000000"		// topic background color
var/const/TEXTCOLORWINDOW="#000000"		// topic text color
var/const/SUBBGCOLORWINDOW="#D3D3D3"	// topic sub-background color
var/const/MESSAGECOLORWINDOW="#D3D3D3"	// topic message color
var/const/LINKCOLORWINDOW="#FF0000"		// topic link color
var/const/HOVERLINKCOLORWINDOW="#0000FF"// topic hoverLink color

mob
    icon = 'icons/male.dmi'

    Login()
        src.icon_state = gender
        usr.client.StartHotkeys()
        ..()
        src.start()

    proc
        DeathCheck()
            if (src.health <= 0)
                world << "[src] dies!"
                del src
obj
	sword //the pic of the sword that appears when you attack
		icon = 'icons/1.dmi'
		icon_state = ""
mob
	verb
		Attack() //the verb name, look no var/mob/M in oview(1)
			if(src.stamina<=0)
				src<<"You need to rest."
				return
			if(src.attacking == 0) //if 0 it attacks if 1 it doesnt
				var/obj/K = new/obj/sword //assigns the sword to K
				// PLEASE keep in mind that the sword is a visual effec it does no real damage
				src.attacking = 1 //makes it so you cant attack while it equals 1
				K.dir = src.dir //make the direction of K(sword) the direction of the player
				K.loc = src.loc //gives the loc of K(sword) the same as the player
				step(K, dir) //K(sword) take a step in the direction of the player
				var/turf/X = K.loc //the turf the sword is on
				spawn(3)//this nifty thing sleeps for the lines underneath it but continues the rest of the code as normal
					del(K) //deletes the visual sword
				for(var/mob/M as mob in X) //the mob (if any) that is in the loc of the sword
					if(M == src) //if that mob is the player, it continues out of the loop
						continue
					src.stamina-=src.maxsta/100/13
					src.mb+=rand(0.09,0.17)
					src.maxsta+=rand(0.07,0.21)
					src.etai+=rand(0.06,10.23)
					flick("attack",usr)
					var/damage = rand(src.taijutsu/M.endurance,src.taijutsu/M.endurance*1.25) //assigns a random number between 1 and 5 to damage
					if(prob(60))//You got a 70% chance of it continueing and not going to the else
						src<<"You attack [M] for [damage] damage!" //says you attack
						M<<"[src] attacks you for [damage] damage!" //tells the mob (in case that mob is another player) you attacked them
						M.health -= damage //the mobs hp is subtracted by the number in damage
						M.DeathCheck() //deletes mob from world NOT A VALID DEATH CODE WHEN FACING PLAYERS, DO CHANGE
					else //if you didn't hit
						src<<"You attempt to attack [M] but miss!" //says player miss
						M<<"[src] attempts to attack you but misses!" //tells the M player missed
				sleep(7) //code sleeps for 7/10 of a second, this is waht keeps marcos for super fast attacks
				src.attacking = 0 //attacking goes to 0, now the usr can attack again


turf
    grass
        icon = 'icons/grass.dmi'

