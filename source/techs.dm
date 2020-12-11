mob
	verb
		rest()
			if(src.resting==1)
				src<<"You quit Resting."
				resting=0
			else
				resting=1
				resting()
				src<<"You begin to rest."
mob
	verb
		Inner_chakra()
			if(src.inc==1)
				src<<"You quit releasing your inner chakra."
				inc=0
			else
				inc=1
				innerc()
				src<<"You begin to release your stored chakra."
mob
	verb
		Inner_Strength()
			if(src.ins==1)
				src<<"You quit releasing your inner energy."
				ins=0
			else
				ins=1
				inners()
				src<<"You begin to release your stored energy."

mob
	verb
		add()
			src.mb+=20
mob
	verb
		sub()
			exp=100
mob
	verb
		Close_Gates()
			if(src.gates>=1)
				src<<"You close your chakra gates."
				tb2=0
				gates=0
				speed=SPD
mob
	verb
		Open_Gates()
			if(src.gates==2)
				src<<"[name]Third Gate!!!!!.......Gate of Life!!!!!! Ahhhhhhh!!!!!!"
				tb2=10
				gates=3
				speed+=2
			if(src.gates==1)
				src<<"[name]Second Gate!!!!!.......Gate of Rest!!!!!!."
				gates=2
			if(src.gates==0)
				src<<"[name]First Gate!!!!!.......Gate of Opening!!!!!!."
				gates=1
				tb2=5
				gate()
mob
	proc
		Power_Hit() //the verb name, look no var/mob/M in oview(1)
			if(src.stamina<stamina/maxsta*15)
				src<<"You need to rest."
				return
			if(src.power == 0) //if 0 it attacks if 1 it doesnt
				var/obj/K = new/obj/sword //assigns the sword to K
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
					src.stamina-=stamina/maxsta*15
					src.mb+=rand(0.18,0.34)
					src.maxsta+=rand(0.14,0.42)
					src.etai+=rand(0.12,0.46)
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


mob
	proc
		Primary_Lotus() //the verb name, look no var/mob/M in oview(1)
			if(src.stamina<stamina/maxsta*30)
				src<<"You need to rest."
				return
			if(src.lotus==0) //if 0 it attacks if 1 it doesnt
				var/obj/K = new/obj/sword //assigns the sword to K
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
					src.stamina-=stamina/maxsta*30
					src.mb+=rand(0.36,0.68)
					src.maxsta+=rand(0.28,0.84)
					src.etai+=rand(0.24,0.92)
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

mob
	verb
		Wind()
			var/obj/O = new /obj/Wind(usr.loc)
			src.chakra-=src.chakra/100/1
			src.mb-=rand(0.09,0.17)
			src.maxcha+=rand(0.07,0.21)
			src.enin+=rand(0.06,10.23)
			O.owner=usr
			O:dir = usr.dir
			while(O)
				sleep(1)
				step(O,O:dir)//Moves the object in question.
mob
	verb
		Clone()
			var/A = new/mob/Clone(locate(usr.x+1,usr.y+1,usr.z))
			usr.clonetgt=A
			usr.Clonelist+=A
			usr.Numofclones+=1
			world<<"1[usr.clonetgt]"
			Clone_Stats()
			spawn(60)
				for(var/mob/m in world)
					if(m == A:Owner&m.Outofbody==1)
						m.Outofbody=0
						A:Inbody=0
						A:client.mob=m
				if(A in world)
					usr.Clonelist-=A
					usr.Numofclones-=1
					del(A)
mob
	proc
		Clone_Stats()
			var/mob/Tgt
			Tgt=usr.clonetgt
			Tgt.health=usr.health
			Tgt.maxhp=usr.maxhp
			Tgt.chakra=usr.chakra
			Tgt.maxcha=usr.maxcha
			Tgt.stamina=usr.stamina
			Tgt.maxsta=usr.maxsta
			Tgt.ninjutsu=usr.ninjutsu
			Tgt.taijutsu=usr.taijutsu
			Tgt.genjutsu=usr.genjutsu
			Tgt.etai=usr.etai
			Tgt.enin=usr.enin
			Tgt.egen=usr.egen
			Tgt.endurance=usr.endurance
			Tgt.speed=usr.speed
			Tgt.SPD=usr.SPD
			Tgt.tai=usr.tai
			Tgt.nin=usr.nin
			Tgt.gen=usr.gen
			Tgt.taib=usr.taib
			Tgt.ninb=usr.ninb
			Tgt.genb=usr.genb
			Tgt.tb=usr.tb
			Tgt.nb=usr.nb
			Tgt.gb=usr.gb
			Tgt.tb2=usr.tb2
			Tgt.nb2=usr.nb2
			Tgt.gb2=usr.gb2
			Tgt.Owner=usr
			if(usr in Clonelist)
			else
				usr.Clonelist+=usr
			Tgt.jutsulist=usr.jutsulist
			Tgt.Clonelist=usr.Clonelist

mob
	Click()
		if(usr.Owner==src)
			src.Outofbody=0
			usr.Inbody=0
			usr.client.mob=src
		if(src.Clone==1)
			usr.Outofbody=1
			src.Inbody=1
			usr.client.mob=src
