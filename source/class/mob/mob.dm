mob

	icon = 'icons/mob/male.dmi'

	Login()
		src.icon_state = gender
		usr.client.StartHotkeys()
		..()
		src.start()

	var
		//health
		health=50
		maxHealth=100

		//chakra
		chakra=50
		maxChakra=100
		innerChakra=100
		limitChakra=100

		//stamina
		stamina=50
		maxStamina=100
		innerStamina=100
		limitStamina=100

		//ninjutsu
		ninjutsu=0
		earnedNinjutsu=10
		ninjutsuEndurance=0

		//taijutsu
		taijutsu=0
		earnedTaijutsu=100
		taijutsuEndurance=0

		//genjutsu
		genjutsu=0
		earnedGenjutsu=10
		genjutsuEndurance=0

		endurance=10

		balance=100 // The balance between having a physical or a spirtual body.

		experience=0
		maxExperience=100

		resting=0
		innerChakraRelease=0
		innerStaminaRelease=0
		speed=7
		SPD=7
		frozen=0
		delay=2
		attacking=0
		lotus=0
		power=0
		dash=0
		dash2=0
		start=1
		boost=0

		tai=0
		nin=0
		gen=0

		taib=10
		ninb=0
		genb=0

		tb=0
		nb=0
		gb=0

		tb2=0
		nb2=0
		gb2=0

		sb=10
		cb=10

		sb2=0
		cb2=0

		climit=0
		slimit=0
		Alive=0
		Corpse=0
		gates=0

		jutsulist=list()
		Clonelist=list()

		canMove = 1

	proc
		DeathCheck()
			if(src.health <= 0)
				world << "[src] dies!"
				del src
		start()
			while(src.start)
				src.DeathCheck()
				sleep(15)
				if(src.balance>200)
					src.balance=200
				if(src.balance<0)
					src.balance=0
				src.climit=src.cb2+src.cb
				src.slimit=src.sb2+src.sb
				src.taib=src.tb2+src.tb
				src.ninb=src.nb2+src.nb
				src.genb=src.gb2+src.gb
				src.taijutsu=src.earnedTaijutsu
				src.ninjutsu=src.earnedNinjutsu
				src.genjutsu=src.earnedGenjutsu
				if(taib>0)
					src.taijutsu=earnedTaijutsu+src.earnedTaijutsu/100*taib
				if(ninb>0)
					src.ninjutsu=earnedNinjutsu+src.earnedNinjutsu/100*ninb
				if(genb>0)
					src.genjutsu=earnedGenjutsu+src.earnedGenjutsu/100*genb
				if(src.limitChakra<src.maxChakra/100*climit)
					src.limitChakra=src.maxChakra/100*climit
				if(src.limitStamina<src.maxStamina/100*src.slimit)
					src.limitStamina=src.maxStamina/100*src.slimit
				if(src.limitChakra>src.maxChakra/100*climit)
					src.limitChakra=src.maxChakra/100*climit
				if(src.limitStamina>src.maxStamina/100*src.slimit)
					src.limitStamina=src.maxStamina/100*src.slimit
				if(src.chakra<src.maxChakra)
					src.chakra+=src.maxChakra/150
				else
					src.chakra=src.maxChakra
				if(src.health<src.maxHealth)
					src.health+=src.maxHealth/150
				else
					src.health=src.maxHealth
				if(src.stamina<src.maxStamina)
					src.stamina+=src.maxStamina/150
				else
					src.stamina=src.maxStamina
				if(src.innerChakra<=src.limitChakra)
					src.innerChakra+=src.limitChakra/75
				else
					src.innerChakra=src.limitChakra
				if(src.innerStamina<=src.limitStamina)
					src.innerStamina+=src.limitStamina/75
				else
					src.innerStamina=src.limitStamina
				sleep(15)
				src.levelup()
				if(src.boost==1)
					src.cb=0// %0 Chakra Reserve
					src.sb=20// %20 Stamina Reserve
					src.tb=20// %20 Taijutsu
					src.nb=0
					src.gb=0
				else
					if(src.boost==2)
						src.cb=5 // %5 Chakra Reserve
						src.sb=15 // %15 Stamina Reserve
						src.tb=10 // %10 Taijutsu
						src.nb=0
						src.gb=0
					else
						if(src.boost==3)
							src.cb=5// %5 Charkra Reserve
							src.sb=15// %15 Stamina Reserve
							src.tb=5 // %5 Taijutsu
							src.nb=0
							src.gb=0
						else
							if(src.boost==4)
								src.cb=10// %10 Chakra Reserve
								src.sb=10// % 10 Stamina Reserve
								src.tb=5 // %5 Taijutsu
								src.nb=0
								src.gb=0
							else
								if(src.boost==5)
									src.cb=10 // %10 Chakra Reserve
									src.sb=10 // %10 Stamina Reserve
									src.tb=0
									src.nb=0
									src.gb=0
								else
									if(src.boost==6)
										src.cb=10 // %10 Chakra Reserve
										src.sb=10// %10 Stamina Reserve
										src.tb=0
										src.nb=5// %5 Ninjutsu
										src.gb=5/// %5 Genjutsu
									else
										if(src.boost==7)
											src.cb=15 // %10 Chakra Reserve
											src.sb=5 // %10 Stamina Reserve
											src.tb=0
											src.nb=5// %20 Ninjutsu
											src.gb=5// %20 Genjutsu
										else
											if(src.boost==8)
												src.cb=15 // %10 Chakra Reserve
												src.sb=5 // %10 Stamina Reserve
												src.tb=0
												src.nb=10// %10 Ninjutsu
												src.gb=10// %10 Genjutsu
											else
												if(src.boost==9)
													src.cb=20 // %10 Chakra Reserve
													src.sb=0 // %10 Stamina Reserve
													src.tb=0
													src.nb=20// %20 Ninjutsu
													src.gb=20// %20 Genjutsu
				if(src.balance>=180)
					boost=1
				else
					if(src.balance>=160)
						boost=2
					else
						if(src.balance>=140)
							boost=3
						else
							if(src.balance>=120)
								boost=4
							else
								if(src.balance>=100)
									boost=5
								else
									if(src.balance>=80)
										boost=6
									else
										if(src.balance>=60)
											boost=7
										else
											if(src.balance>=40)
												boost=8
											else
												if(src.balance>=20)
													boost=9


		messageUser(msg as text)
			src <<msg

		messageWorld(msg as text)
			world <<msg

		messageMob(M as null, msg as text)
			M <<msg

		levelup()
			if(src.experience>=src.maxExperience)
				src.experience=0
				src.client.Skills()

		gate()
			while(src.gates)
				sleep(15)
				if(gates==1)
					src.stamina-=src.maxStamina/40
					src.sb2=10
				if(gates==2)
					src.stamina-=src.maxStamina/35
					src.sb2=20
				if(gates==3)
					src.sb2=30
					src.stamina-=src.maxStamina/30
					src.health-=src.maxHealth/40

		resting()
			if(src.resting==1)
				if(src.health<src.maxHealth)
					src.health+=src.maxHealth/19
				else
					src.health=src.maxHealth
				if(src.chakra<src.maxChakra)
					src.chakra+=src.maxChakra/16
					src.innerChakra+=src.limitChakra/65
				else
					src.chakra=src.maxChakra
				if(src.stamina<src.maxStamina)
					src.stamina+=src.maxStamina/13
					src.innerStamina+=src.limitStamina/65
				else
					src.stamina=src.maxStamina
				if(src.health==maxHealth&&src.stamina==maxStamina&&src.chakra==maxChakra)
					src.resting=0
					messageUser("Your done resting.")
				else
					spawn(10)
					resting()

		releaseChakra()
			if(src.innerChakra<=1 || src.chakra >= src.maxChakra || src.innerChakraRelease == 1)
				if (src.innerChakra<=1)
					messageUser("You've ran out of your reserved chakra")
				if (src.chakra >= src.maxChakra)
					messageUser("You've reached the max amount of chakra")
				if (src.innerChakraRelease == 1)
					messageUser("You stopped releasing your reserved chakra")


				src.innerChakraRelease=0
				return
			else
				messageUser("Chakra released")
				innerChakraRelease=1
			while(src.innerChakraRelease==1)
				if(src.innerChakra>=1 && src.chakra < src.maxChakra)
					src.chakra+=src.limitChakra/26.3
					src.innerChakra-=src.limitChakra/26.3
				else
					messageUser("You've stopped releasing your reserved chakra")
					src.innerChakraRelease=0
					src.chakra=src.maxChakra
				sleep(10)

		releaseStamina()
			if(src.innerStamina<=1 || src.stamina >= src.maxStamina || src.innerStaminaRelease == 1)
				if (src.innerStamina<=1)
					messageUser("You've ran out of your reserved stamina")
				if (src.stamina >= src.maxStamina)
					messageUser("You've reached the max amount of stamina")
				if (src.innerStaminaRelease == 1)
					messageUser("You stopped releasing your reserved stamina")


				src.innerStaminaRelease=0
				return
			else
				messageUser("Stamina released")
				innerStaminaRelease=1
			while(src.innerStaminaRelease==1)
				if(src.innerStamina>=1 && src.stamina < src.maxStamina)
					src.stamina+=src.limitStamina/26.3
					src.innerStamina-=src.limitStamina/26.3
				else
					messageUser("You've stopped releasing your reserved stamina")
					src.innerStaminaRelease=0
					src.stamina=src.maxStamina
				sleep(10)

	verb
		add()
			src.balance+=20

		sub()
			experience=100

		rest()
			if(src.resting==1)
				messageUser("You quit Resting.")
				resting=0
			else
				resting=1
				resting()
				messageUser("You begin to rest.")

		Chakra_Release()
			releaseChakra()

		Stamina_Release()
			releaseStamina()


		Attack() //the verb name, look no var/mob/M in oview(1)
			if(src.stamina<=0)
				messageUser("You need to rest.")
				return
			if(src.attacking == 0) //if 0 it attacks if 1 it doesnt
				var/obj/K = new/obj/mark //assigns the sword to K
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
					src.stamina-=src.maxStamina/100/13
					src.balance+=rand(0.09,0.17)
					src.maxStamina+=rand(0.07,0.21)
					src.earnedTaijutsu+=rand(0.06,10.23)
					flick("attack",usr)
					var/damage = rand(src.taijutsu/M.endurance,src.taijutsu/M.endurance*1.25) //assigns a random number between 1 and 5 to damage
					if(prob(60))//You got a 70% chance of it continueing and not going to the else
						messageUser("You attack [M] for [damage] damage!") //says you attack
						messageMob(M, "[src] attacks you for [damage] damage!") //tells the mob (in case that mob is another player) you attacked them
						M.health -= damage //the mobs hp is subtracted by the number in damage
						M.DeathCheck() //deletes mob from world NOT A VALID DEATH CODE WHEN FACING PLAYERS, DO CHANGE
					else //if you didn't hit
						messageUser("You attempt to attack [M] but miss!") //says player miss
						messageMob(M, "[src] attempts to attack you but misses!") //tells the M player missed
				sleep(7) //code sleeps for 7/10 of a second, this is waht keeps marcos for super fast attacks
				src.attacking = 0 //attacking goes to 0, now the usr can attack again

mob
	Click()
		messageWorld("Mob health [src.health] Target[src.clonetgt]")
		if(usr.Owner==src)
			src.Outofbody=0
			usr.Inbody=0
			usr.client.mob=src
		if(src.Clone==1)
			usr.Outofbody=1
			src.Inbody=1
			usr.client.mob=src

	Move()
		if (canMove)
			..()
		if(usr.stamina<=0)
			return
		if(usr.frozen==1)
			return
		else
			usr.frozen=1
			usr.stamina-=usr.maxStamina/100*0.3
			sleep(usr.delay-usr.speed)
			usr.frozen=0
		..()
	enemy
		icon_state = ""
		AOS=1