mob
	var
		health=100
		maxhp=100
		chakra=100
		maxcha=100

		stamina=100
		maxsta=100

		ninjutsu=0 // The amount of ninjutsu the user has
		taijutsu=0 // The amount of taijutsu the user has
		genjutsu=0 // the amount of genjutsu the user has

		etai=100
		enin=10
		egen=10

		endurance=10
		tendurance=0
		nendurance=0
		gendurance=0

		incha=100
		insta=100

		limitcha=100
		limitsta=100

		mb=100 // The balance between having a physical or a spirtual body.

		exp=0
		maxexp=100

		resting=0
		inc=0
		ins=0
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
		firseal=""
		secseal=""
		thiseal=""
		forseal=""
		fifseal=""
		sixseal=""
		lfirseal=""
		lsecseal=""
		lthiseal=""
		lforseal=""
		lfifseal=""
		lsixseal=""
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
		jutsulist=list()
		Clonelist=list()
		Clone=0
		Numofclones=0
		Owner=""
		Outofbody=0
		Inbody=0
		clonetgt=""
mob/Stat()
	statpanel("Character")
	stat("Name: [src.key]")
	stat("Healh:[src.health]/[maxhp] [health/maxhp*100]%")
	stat("Chakra:[src.chakra]/[maxcha] [chakra/maxcha*100]%")
	stat("Stamina:[src.stamina]/[maxsta] [stamina/maxsta*100]%")
	stat("inner chakra:[src.incha]/[limitcha]")
	stat("inner stamina:[src.insta]/[limitsta]")
	stat("Mind/Body:[src.mb]%")
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