client
	proc
		Skills()
			if(usr.earnedTaijutsu>=100)
				if("Power Hit" in usr.jutsulist)
					return
				else
					new/obj/Skillcards/Taijutsu/Power_Hit(usr)
					usr.jutsulist+="Power Hit"
			if(usr.earnedTaijutsu>=100)
				if(usr.jutsulist=="Primary Lotus")
					return
				else
					new/obj/Skillcards/Taijutsu/Primary_Lotus(usr)
					usr.jutsulist+="Primary Lotus"
					usr<<"[usr.jutsulist]"

	Click(O)
		usr << "You clicked [O]"
		..() // do default action
		walk_to (usr, O)