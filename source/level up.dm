mob
	proc
		levelup()
			if(src.exp>=src.maxexp)
				src.exp=0
				src.client.Skills()




client/proc/Skills()
	if(usr.etai>=100)
		if("Power Hit" in usr.jutsulist)
			return
		else
			new/obj/Skillcards/Taijutsu/Power_Hit(usr)
			usr.jutsulist+="Power Hit"
	if(usr.etai>=100)
		if(usr.jutsulist=="Primary Lotus")
			return
		else
			new/obj/Skillcards/Taijutsu/Primary_Lotus(usr)
			usr.jutsulist+="Primary Lotus"
			usr<<"[usr.jutsulist]"