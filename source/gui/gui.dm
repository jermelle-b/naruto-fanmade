world

/* setting the view to 35 tiles along X axis and 23 tiles Y axis
To make it full-interface, set your view and then open an interface file
and delete all but the map section, stretch the map to cover the whole screen
and then right click it, set anchors at top left and bottom right, or top right
and bottom left and your final step is to, set the winset of the user too winset(usr,"Map","focus=true")
under the Login proc
*/
client
	proc
		StartHotkeys()// This is the proc for actually giving the bare hud as objects to the user, implement this
			new/obj/Numbers/Key0(src)
			new/obj/Numbers/Key1(src)
			new/obj/Numbers/Key2(src)
			new/obj/Numbers/Key3(src)
			new/obj/Numbers/Key4(src)
			new/obj/Numbers/Key5(src)
			new/obj/Numbers/Key6(src)
			new/obj/Numbers/Key7(src)
			new/obj/Numbers/Key8(src)
			new/obj/Numbers/Key9(src)
			new/obj/Numbers/Key10(src)
			new/obj/Numbers/Key11(src)
			new/obj/Numbers/Key12(src)
			new/obj/Keys/Key0(src)
			new/obj/Keys/Key1(src)
			new/obj/Keys/Key2(src)
			new/obj/Keys/Key3(src)
			new/obj/Keys/Key4(src)
			new/obj/Keys/Key5(src)
			new/obj/Keys/Key6(src)
			new/obj/Keys/Key7(src)
			new/obj/Keys/Key8(src)
			new/obj/Keys/Key9(src)
			new/obj/Keys/Key10(src)
			new/obj/Keys/Key11(src)
			new/obj/Keys/Key12(src)
obj
	Hotkeys
		layer = 99
		icon='icons/gui/skills.dmi'
		var/locc
		New(client/C)// Creating on the clients screen, so that no one else can see the hotbars
			screen_loc=locc
			C.screen+=src
		F1
			icon_state = "F1"
			locc = "1,12"
			Click()
				alert("You used the Tiger sign")
		F2
			icon_state = "F2"
			locc = "1,11"
			Click()
				alert("You used the Tiger sign")
		F3
			icon_state = "F3"
			locc = "1,10"
			Click()
				alert("You used the Tiger sign")
		F4
			icon_state = "F4"
			locc = "1,9"
			Click()
				alert("You used the Rabbit sign")
		F5
			icon_state = "F5"
			locc = "1,8"
			Click()
				alert("You used the Dragon sign")
		F6
			icon_state = "F6"
			locc = "1,7"
			Click()
				alert("You used the Snake sign")
		F7
			icon_state = "F7"
			locc = "1,6"
			Click()
				alert("You used the Horse sign")
		F8
			icon_state = "F8"
			locc = "1,5"
			Click()
				alert("You used the Ram sign")
		F9
			icon_state = "F9"
			locc = "1,4"
			Click()
				alert("You used the Monkey sign")
		F10
			icon_state = "F10"
			locc = "1,3"
			Click()
				alert("You used the Bird sign")
		F11
			icon_state = "F11"
			locc = "1,2"
			Click()
				alert("You used the Dog sign")
		F12
			icon_state = "F12"
			locc = "1,1"
			Click()
				alert("You used the Boar sign")

	Keys// Creating blank boxes so that the hotbars 'identity' remains hovering
		layer=10// over skillcards added to the bar
		icon='icons/gui/Hotkeys.dmi'
		icon_state = ""
		var/locc
		New(client/C)
			screen_loc=locc
			C.screen+=src
		Key0
			locc = "2,1"
		Key1
			locc = "3,1"
		Key2
			locc = "4,1"
		Key3
			locc = "5,1"
		Key4
			locc = "6,1"
		Key5
			locc = "7,1"
		Key6
			locc = "8,1"
		Key7
			locc = "9,1"
		Key8
			locc = "10,1"
		Key9
			locc = "11,1"
		Key10
			locc = "12,1"
		Key11
			locc = "13,1"
		Key12
			locc = "14,1"

	Numbers
		layer=25
		icon='icons/gui/Hotkeys.dmi'
		var/locc
		New(client/C)
			screen_loc=locc
			C.screen+=src
		Key0
			icon_state = "~"// The hotbar identities, this is the '~' identity, it will hover over skillcards
			locc = "2,1"
		Key1
			icon_state = "1"
			locc = "3,1"
		Key2
			icon_state = "2"
			locc = "4,1"
		Key3
			icon_state = "3"
			locc = "5,1"
		Key4
			icon_state = "4"
			locc = "6,1"
		Key5
			icon_state = "5"
			locc = "7,1"
		Key6
			icon_state = "6"
			locc = "8,1"
		Key7
			icon_state = "7"
			locc = "9,1"
		Key8
			icon_state = "8"
			locc = "10,1"
		Key9
			icon_state = "9"
			locc = "11,1"
		Key10
			icon_state = "0"
			locc = "12,1"
		Key11
			icon_state = "-"
			locc = "13,1"
		Key12
			icon_state = "+"
			locc = "14,1"