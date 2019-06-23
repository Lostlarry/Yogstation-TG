// yogs file
/obj/machinery/portable_atmospherics/canister/bluespace
	name = "bluespace canister"
	desc = "A canister for storing adn moving all of the gas."
	icon_state = "yellow"

	volume = 3000

/obj/machinery/portable_atmospherics/canister/bluespace/update_icon()
	if(stat & BROKEN)
		cut_overlays()
		icon_state = "[icon_state]-1"
		add_overlay("bluespace-1")
		return

	..()
	add_overlay("bluespace")


/obj/machinery/portable_atmospherics/canister/bluespace/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(!(stat & BROKEN))
			canister_break()
		if(disassembled)
			new /obj/item/canister_bluespace_parts (loc, 1)
		else
			new /obj/item/stack/sheet/metal (loc, 5)
	qdel(src)

/obj/item/canister_bluespace_parts
	name = "bluespace canister parts"
	desc = "Used to build a bluespace canister."
	icon = 'icons/obj/assemblies.dmi'
	icon_state = "canister_bluespace_parts"
	force = 5 //the same as a metal sheet
	throwforce = 10 //the same as a metal sheet

/obj/item/canister_bluespace_parts/attack_self(mob/user)
	if(do_after(user, 30, target = user))
		new /obj/machinery/portable_atmospherics/canister/bluespace(get_turf(user))
		qdel(src)