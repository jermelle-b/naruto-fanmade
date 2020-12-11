mob
	var
		AOS=0 //Attack On Sight
		AWA=0 //Attack When Attacked
		walks=0 //Walks
		Mdmg=0  //Maximum damage
		mdmg=0  //Minimum damage
		view=3   //how far a monter can look for a player
		wspeed=5  //walk speed
		aspeed=5  //attack speed
		attacked=0
		def
		mob/attacker


	New()
		if(!src.client)
			if(AOS)
				src.AosLoop()
				return
			if(AWA)
				src.AwaLoop()
				return
			if(walks)
				src.walks()
				return
	proc
		AosLoop()
			if(src.client)return
			var
				list/piv  //piv=People In View
				mob/attack  //remeberd attacker
			while(health>0)
				piv = list()
				while(piv.len<=0)    //if there's nobody in view
					if(walks)
						step_rand(src)//take a random step
					sleep(wspeed)//wait walkspeed
					for(var/mob/m in oview(src))//for all mobs in view(excuding itself)
						if(m.client&&m.key)//if M is a player...
							piv+=m  //it adds that to people in view)
				attack=pick(piv)//pick a rand person 2 atk. remember them.
				while(get_dist(attack,src)<=view)//if its in src's view
					if(get_dist(attack,src)==1)//if it is right next to the person
						step_towards(src,attack)
						Attack()
					else //too far away to attack just yet
						step_towards(src,attack) //step towards attacker
						sleep(wspeed)   //sleep walkspeed
				if(walks)
					step_rand(src)
				sleep(wspeed)//sleep walk speed


		AwaLoop()
			if(src.client)return
			while(src.health>0)
				while(src.attacked)
					if(attacker in view(src))
						if(get_dist(src,attacker)<=1)
							step_towards(src,attacker)
							Attack()
							sleep(src.aspeed)//waits attack speed
						else //too far away to attack just yet
							step_towards(src,attacker) //step towards attacker
							sleep(src.wspeed)   //sleep walkspeed
					else  //lost attacker
						attacked=0
						attacker=null
						sleep(src.wspeed)//wait walk speed
				if(src.walks) //if it walks
					step_rand(src)//take a random step
				sleep(src.wspeed)//wait walkspeed

		walks()
			while(src.health>0)
				step_rand(src.)
				sleep(src.wspeed)


mob
	Clone
		icon='icons/mob/male.dmi'
		health=80
		maxHealth=100
		chakra=100
		maxChakra=100
		stamina=100
		maxStamina=100
		ninjutsu=0
		taijutsu=0
		genjutsu=0
		earnedTaijutsu=100
		earnedNinjutsu=10
		earnedGenjutsu=10
		endurance=10
		Clone=1
		AWA=1