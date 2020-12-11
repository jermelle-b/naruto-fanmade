mob
	proc
		start()
			while(src.start)
				src.DeathCheck()
				sleep(15)
				if(src.mb>200)
					src.mb=200
				if(src.mb<0)
					src.mb=0
				src.climit=src.cb2+src.cb
				src.slimit=src.sb2+src.sb
				src.taib=src.tb2+src.tb
				src.ninb=src.nb2+src.nb
				src.genb=src.gb2+src.gb
				src.taijutsu=src.etai
				src.ninjutsu=src.enin
				src.genjutsu=src.egen
				if(taib>0)
					src.taijutsu=etai+src.etai/100*taib
				if(ninb>0)
					src.ninjutsu=enin+src.enin/100*ninb
				if(genb>0)
					src.genjutsu=egen+src.egen/100*genb
				if(src.limitcha<src.maxcha/100*climit)
					src.limitcha=src.maxcha/100*climit
				if(src.limitsta<src.maxsta/100*src.slimit)
					src.limitsta=src.maxsta/100*src.slimit
				if(src.limitcha>src.maxcha/100*climit)
					src.limitcha=src.maxcha/100*climit
				if(src.limitsta>src.maxsta/100*src.slimit)
					src.limitsta=src.maxsta/100*src.slimit
				if(src.chakra<src.maxcha)
					src.chakra+=src.maxcha/150
				else
					src.chakra=src.maxcha
				if(src.health<src.maxhp)
					src.health+=src.maxhp/150
				else
					src.health=src.maxhp
				if(src.stamina<src.maxsta)
					src.stamina+=src.maxsta/150
				else
					src.stamina=src.maxsta
				if(src.incha<=src.limitcha)
					src.incha+=src.limitcha/75
				else
					src.incha=src.limitcha
				if(src.insta<=src.limitsta)
					src.insta+=src.limitsta/75
				else
					src.insta=src.limitsta
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
				if(src.mb>=180)
					boost=1
				else
					if(src.mb>=160)
						boost=2
					else
						if(src.mb>=140)
							boost=3
						else
							if(src.mb>=120)
								boost=4
							else
								if(src.mb>=100)
									boost=5
								else
									if(src.mb>=80)
										boost=6
									else
										if(src.mb>=60)
											boost=7
										else
											if(src.mb>=40)
												boost=8
											else
												if(src.mb>=20)
													boost=9


mob
	Click()
		world<<"Mob health [src.health] Target[src.clonetgt]"
mob
	proc
		resting()
			if(src.resting==1)
				if(src.health<src.maxhp)
					src.health+=src.maxhp/19
				else
					src.health=src.maxhp
				if(src.chakra<src.maxcha)
					src.chakra+=src.maxcha/16
					src.incha+=src.limitcha/65
				else
					src.chakra=src.maxcha
				if(src.stamina<src.maxsta)
					src.stamina+=src.maxsta/13
					src.insta+=src.limitsta/65
				else
					src.stamina=src.maxsta
				if(src.health==maxhp&&src.stamina==maxsta&&src.chakra==maxcha)
					src.resting=0
					src<<"Your done resting."
				else
					spawn(10)
					resting()



mob
	proc
		innerc()
			if(src.incha<=5)
				src<<"You dont have enough chakra Stored"
				src.inc=0
				return
			if(src.inc==1)
				if(src.chakra<src.maxcha)
					src.chakra+=src.incha/28.4
					src.incha-=src.incha/28.4
					spawn(15)
					innerc()
				else
					src.chakra=src.maxcha
mob
	proc
		inners()
			if(src.insta<=5)
				src<<"You dont have enough energy Stored"
				src.ins=0
				return
			if(src.ins==1)
				if(src.stamina<src.maxsta)
					src.stamina+=src.insta/26.3
					src.insta-=src.insta/26.3
					spawn(15)
					inners()
				else
					src.chakra=src.maxcha


mob
	proc
		gate()
			while(src.gates)
				sleep(15)
				if(gates==1)
					src.stamina-=src.maxsta/40
					src.sb2=10
				if(gates==2)
					src.stamina-=src.maxsta/35
					src.sb2=20
				if(gates==3)
					src.sb2=30
					src.stamina-=src.maxsta/30
					src.health-=src.maxhp/40
