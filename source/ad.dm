0-20 30% cha

40 10% nin+gen

60 15% cha

80 5% nin+gen

100	is 10% cha and sta

120 5% tai

140 15% sta

160 10% tai

180-200 30% sta

cb
sb
tb
nb
gb
Opening Gate 5% tai+sta and speed

Rest Gate	5% sta and health+sta up 10%

Life Gate  10% tai 20% sta speed and dash hit +15%




if(firseal==""&&secseal==""&&thiseal==""&&forseal==""&&fifseal==""&&sixseal=="")
Ox
Tiger
Rabbit
Dragon
Snake
Horse
Ram
Monkey
Bird
Dog
Boar





mob/proc
	Power_Hit2(mob/M as mob in oview(1))
		if(M==src)
			return
		// Here we will move the enemy 2 tiles at a rate of 4 pixels per 1/10 seconds.
		src.PushEnemy(M, 2, 6)
		flick("attack",usr)
		world<<"[usr]"
		src.overlays+="power"
		spawn(5)
		src.overlays-="power"
mob/verb
	Lotus(mob/M as mob in oview(1))
		if(M==src)
			return
		src.frozen=1
		M.frozen=1
		src.dir=NORTH
		M.dir=NORTH
		sleep(10)
		src.loc=M.loc
		sleep(10)
		src.PushEnemy(M, 2, 6)
		src.PushEnemy(src, 2, 6)
		sleep(20)
		src.dir=SOUTH
		M.dir=SOUTH
		flick("loutus2",usr)
		flick("lotus",M)
		src.PushEnemy(M, 3, 3)
		src.PushEnemy(src, 3, 3)
		sleep(5)
		src.loc=M.loc
		src.frozen=0
		M.frozen=0
		world<<"[usr]"
		src.overlays+="power"
		spawn(5)
		src.overlays-="power"