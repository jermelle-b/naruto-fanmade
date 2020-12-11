mob
	verb
		Close_Gates()
			if(src.gates>=1)
				src<<"You close your chakra gates."
				tb2=0
				gates=0
				speed=SPD

		Open_Gates()
			if(src.gates==2)
				src<<"[name]Third Gate!!!!!.......Gate of Life!!!!!! Ahhhhhhh!!!!!!"
				tb2=10
				gates=3
				speed+=2
			if(src.gates==1)
				src<<"[name]Second Gate!!!!!.......Gate of Rest!!!!!!."
				gates=2
			if(src.gates==0)
				src<<"[name]First Gate!!!!!.......Gate of OpearnedNinjutsug!!!!!!."
				gates=1
				tb2=5
				gate()