mob
	Stat()
		statpanel("Character")
		stat("Name: [src.key]")
		stat("Healh:[src.health]/[maxHealth] [health/maxHealth*100]%")
		stat("Chakra:[src.chakra]/[maxChakra] [chakra/maxChakra*100]%")
		stat("Stamina:[src.stamina]/[maxStamina] [stamina/maxStamina*100]%")
		stat("inner chakra:[src.innerChakra]/[limitChakra]")
		stat("inner stamina:[src.innerStamina]/[limitStamina]")
		stat("Mind/Body:[src.balance]%")
		if(CantuseSigns==1)
			stat("Cant use Seals")
		stat("[firseal],[secseal],[thiseal],[forseal],[fifseal],[sixseal]")
		stat("_______Skills___[]___")
		stat("Ninjutsu:[src.ninjutsu]")
		stat("Taijutsu:[src.taijutsu]")
		stat("Genjutsu[src.genjutsu]")
		stat("")
		stat("")
		statpanel("Inventory")	//MAkes a new stat panel called inventory
		stat(contents)	//this is where the contents will go
		if(Numofclones>=1||Clone==1)
			statpanel("Clones")	//MAkes a new stat panel called inventory
			stat(Clonelist)
		statpanel("Jutsus")	//MAkes a new stat panel called inventory
		stat(jutsulist)