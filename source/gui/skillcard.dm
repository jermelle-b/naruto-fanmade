mob/proc/SkillsUpdate()
	for(var/obj/Skillcards/Z in src.contents)// if you have the skill card in your inventory
		if(Z.SlotLoc!=0)
			if(Z.JutsuType=="Taijutsu")
				src << output(Z, "TaiAttacks.tai[Z.SlotLoc]")
				src << output(Z.name, "TaiAttacks.tainame[Z.SlotLoc]")
			else
				src << output(Z, "NinAttacks.nin[Z.SlotLoc]")
				src << output(Z.name, "NinAttacks.ninname[Z.SlotLoc]")

obj
	var
		screenlocation
		SlotLoc = 0
		JutsuType = "None"
	Skillcards
		layer = 12
		New()
			..()
			src.mouse_drag_pointer = icon(src.icon,src.icon_state)// Changes the mouse's icon when holding a technique tile
	DblClick()
		usr.SkillsUpdate()//using the technique/looking at the output
	MouseDrop(obj/Slot)
		if(Slot)// must be dropped in a slot, must be on your screen due it having to be in a slot etc.
			usr.client.screen += src
			src.screen_loc=Slot.screen_loc
			src.screenlocation = src.screen_loc
			if(istype(Slot,/obj/Skillcards))
				usr.client.screen -= Slot
				Slot.screenlocation = null
		else
			..()
	MouseDrop(src)
		if(istype(src,/obj/Keys)||istype(src,/obj/Skillcards/Taijutsu))// must be a skillcard being dropped onto a key
			..()
		if(istype(src,/obj/Keys)||istype(src,/obj/Skillcards/Ninjutsu))// as i named my 'hud slots' under obj/Keys its making sure that they're being dropped onto the right area's
			..()													// and as i named my skillcard sections obj/Skillcards then further divided them into Ninjutsu and Taijutsu, it's making sure
		else														// that they are defined skill cards
			return
	Skillcards
		Taijutsu
			icon = 'icons/gui/skills.dmi'
			JutsuType = "Taijutsu"
			Power_Hit
				icon_state = "Power"
				name = "Power Hit"
				screen_loc="1,12"
				Click()
					usr.Power_Hit()
			Primary_Lotus
				icon_state = "Lotus"
				name = "Primary Lotus"
				Click()
					usr.Primary_Lotus()
		Ninjutsu
			icon = 'icons/gui/skills.dmi'
			JutsuType = "Ninjutsu"
			Kawa
				icon_state = "Kawa"
				name = "Kawarimi"
				Click()
					alert("You would be using Kawarimi if this was N-X!")
			Chidori
				icon_state = "Chidori"
				name = "Chidori"
				Click()
					alert("You would be using Chidori if this was N-X!")