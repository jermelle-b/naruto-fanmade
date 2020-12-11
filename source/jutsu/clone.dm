mob
	var
		Clone1=""
		Clone2=""
		Clone3=""
		Clone4=""
		Clone5=""
		Clone6=""
		Clone7=""
		Clone8=""
		Clone9=""
		Clone10=""

		CantuseSigns=0
		Clone=0
		Numofclones=0
		Owner=""
		Outofbody=0
		Inbody=0
		clonetgt=""

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
	proc
		Clone_Stats()
			var/mob/Tgt
			Tgt=usr.clonetgt
			Tgt.health=usr.health
			Tgt.maxHealth=usr.maxHealth
			Tgt.chakra=usr.chakra
			Tgt.maxChakra=usr.maxChakra
			Tgt.stamina=usr.stamina
			Tgt.maxStamina=usr.maxStamina
			Tgt.ninjutsu=usr.ninjutsu
			Tgt.taijutsu=usr.taijutsu
			Tgt.genjutsu=usr.genjutsu
			Tgt.earnedTaijutsu=usr.earnedTaijutsu
			Tgt.earnedNinjutsu=usr.earnedNinjutsu
			Tgt.earnedGenjutsu=usr.earnedGenjutsu
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