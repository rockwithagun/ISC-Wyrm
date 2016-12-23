//Energy pistol, Energy gun with less shots. Can be put in player's pockets.

/obj/item/weapon/gun/energy/gun/small
	urist_only = 1
	name = "energy pistol"
	desc = "An energy pistol with a wooden handle."
	icon = 'icons/urist/items/guns.dmi'
	icon_state = "senergy"
	item_state = "gun"
	fire_sound = 'sound/weapons/Taser.ogg'
	w_class = 1
	charge_cost = 150 //How much energy is needed to fire.
	projectile_type = /obj/item/projectile/energy/electrode
	origin_tech = "combat=2;magnets=2"
	modifystate = "senergystun"

	firemodes = list(
		list(mode_name="stun", projectile_type=/obj/item/projectile/beam/stun, modifystate="senergystun", fire_sound='sound/weapons/Taser.ogg', fire_delay=null, charge_cost=null),
		list(mode_name="lethal", projectile_type=/obj/item/projectile/beam, modifystate="senergykill", fire_sound='sound/weapons/Laser.ogg', fire_delay=null, charge_cost=null),
		)

	/*suicide_act(mob/user)
		viewers(user) << "<span class='danger'>[user] is unloading the [src.name] into their head!</span>"
		return(BRUTELOSS)*/

//umbrella gun

/obj/item/weapon/gun/projectile/umbrellagun
	urist_only = 1
	name = "Umbrella"
	desc = "An umbrella with a small hole at the end, doesn't seem to open."
	icon = 'icons/urist/items/guns.dmi'
	icon_state = "umbrellagun"
	item_state = "umbrellagun"
	w_class = 2
	max_shells = 2
	caliber = "9mm"
	silenced = 1
	origin_tech = "combat=2;materials=2"
	ammo_type = /obj/item/ammo_casing/c9mm
	load_method = 2

//BANG BANG BANG, BANG BANG

/obj/item/weapon/gag/BANG
	urist_only = 1
	icon_override = 'icons/urist/items/guns.dmi'
	icon = 'icons/urist/items/guns.dmi'
	name = "BANG gun"
	desc = "Shoots out a BANG"
	icon_state = "gun"
	item_state = "gun"
	var/on = 0
	w_class = 2

/obj/item/weapon/gag/BANG/attack_self(mob/user as mob)
	urist_only = 1
	icon_override = 'icons/urist/items/guns.dmi'
	icon = 'icons/urist/items/guns.dmi'
	on = !on
	if(on)
		user.visible_message("<span class='warning'> [user] fires the gun, BANG.</span>",\
		"<span class='warning'> You fire the gun.</span>",\
		"You hear a BANG.")
		icon_state = "gunbang"
		item_state = "gunbang"
		w_class = 2
		force = 3
		attack_verb = list("smacked", "struck", "slapped")
	else
		user.visible_message("<span class='notice'> [user] pushes the BANG back into the barrel.</span>",\
		"<span class='notice'> You push the BANG back into the barrel.</span>",\
		"You hear a click.")
		icon_state = "gun"
		item_state = "gun"
		w_class = 2
		force = 3
		attack_verb = list("smacked", "struck", "slapped")

	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		H.update_inv_l_hand()
		H.update_inv_r_hand()

/*plasma pistol. does toxic damage. I want to add this to research soonish. icons by Susan from BS12, editing and projectile by Glloyd
--Okay, they implemented this on BS12, and I dislike how they did it. The top is green, and shoots a green pulse. It also has different values then the one I coded.
The point is that theirs is closer to the X-COM plasma pistol, despite the fact that all depictions of plasma in SS13 are purple, thus my choice to edit
the sprite and make my own projectile -Glloyd*/

/obj/item/weapon/gun/energy/plasmapistol
	urist_only = 1
	name = "phoron pistol"
	desc = "An experimental weapon that works by ionizing phoron and firing it in a particular direction, poisoning someone."
	icon = 'icons/urist/items/guns.dmi'
	icon_state = "plasmapistol"
	item_state = "gun"
	fire_sound = 'sound/weapons/Genhit.ogg'
	w_class = 1
	charge_cost = 150 //How much energy is needed to fire.
	projectile_type = /obj/item/projectile/energy/plasma2
	origin_tech = "combat=3;magnets=2"
	modifystate = "plasmapistol"
	cell_type = /obj/item/weapon/cell/crap

/*	suicide_act(mob/user)
		viewers(user) << "<span class='danger'>[user] is unloading the [src.name] into their head! Their skin turns purple and starts to melt!</span>"
		return(BRUTELOSS)*/

/obj/item/projectile/energy/plasma2
	name = "ionized phoron"
	icon = 'icons/urist/items/guns.dmi'
	icon_state = "plasma"
	damage = 20
	damage_type = TOX
	irradiate = 20

//Knight .45 - suppressed PDW

/obj/item/weapon/gun/projectile/silenced/knight
	urist_only = 1
	name = "Knight .45"
	desc = "A lightweight, suppressed weapon. Uses .45 rounds and is intended for operations where subtlety is preferred, if only for a little while."
	icon = 'icons/urist/items/guns.dmi'
	icon_state = "knight45"
	fire_sound = 'sound/urist/suppshot.ogg'
	w_class = 2
	max_shells = 7
	slot_flags = SLOT_BELT
	load_method = MAGAZINE
	caliber = ".45"
	ammo_type = /obj/item/ammo_casing/c45
	magazine_type = /obj/item/ammo_magazine/c45m
	auto_eject = 1

/obj/item/weapon/gun/projectile/silenced/knight/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "knight45"
	else
		icon_state = "knight45-empty"

///// Deckard .44 - old Bay custom item rip for UMcS Blueshields
/obj/item/weapon/gun/projectile/revolver/detective/deckard
	urist_only = 1
	name = "Deckard .38" //changed from .44 for internal consistency - it takes .38 bullets
	desc = "A custom autorevolver chambered in .38 Special issued to high-ranking specialists, based on the obsoleted Detective Special forensics issue models. For some reason, the caliber feels like it should be bigger..."
	//what do you know, it was restored-ish in revolver.dm
	icon_state = "deckard-empty"

/obj/item/weapon/gun/projectile/revolver/detective/deckard/update_icon()
	..()
	if(loaded.len)
		icon_state = "deckard-loaded"
	else
		icon_state = "deckard-empty"

/obj/item/weapon/gun/projectile/revolver/detective/deckard/load_ammo(var/obj/item/A, mob/user)
	if(istype(A, /obj/item/ammo_magazine))
		flick("deckard-reloading",src)
	..()

//NamERT

/obj/item/weapon/gun/projectile/automatic/l6_saw/m60
	urist_only = 1
	name = "M60 Machinegun"
	desc = "The general-purpose machinegun and the main firearm for the Machinegunner. Chambered in 7.62mm , it is fed through a 75-round belt. Fires in short and long bursts, perfect for support and suppresive fire."
	icon = 'icons/urist/items/guns.dmi'
	icon_state = "M60closed75"
	item_state = "l6closedmag"
	max_shells = 75
	allowed_magazines = list(/obj/item/ammo_magazine/box/a762/m60)
	magazine_type = /obj/item/ammo_magazine/box/a762/m60
	requires_two_hands = 6
	wielded_item_state = "genericLMG-wielded"
	caliber = "a762"

/obj/item/weapon/gun/projectile/automatic/l6_saw/m60/update_icon()
	icon_state = "M60[cover_open ? "open" : "closed"][ammo_magazine ? round(ammo_magazine.stored_ammo.len, 15) : "-empty"]"

/obj/item/ammo_magazine/box/a762/m60
	name = "M60 magazine box (7.62mm)"
	icon = 'icons/urist/items/guns.dmi'
	icon_state = "M60MAG"
	max_ammo = 75
	multiple_sprites = 0

/obj/item/ammo_magazine/box/a762/m60/empty
	initial_ammo = 0

/obj/item/weapon/gun/projectile/automatic/m14
	urist_only = 1
	name = "\improper M14 Rifle"
	desc = "A selective-fire rifle for when you need more stopping power. Has a 15-round magazine of 7.62mm. Unlike the M16s that have the ability to fire in bursts or semi-auto, the M14 can only fire in either long bursts or semi-auto."
	icon = 'icons/urist/items/guns.dmi'
	icon_state = "M14"
	item_state = "arifle"
	w_class = 4
	force = 10
	caliber = "a762"
	origin_tech = "combat=6;materials=1;syndicate=2"
	slot_flags = SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a762
	fire_sound = 'sound/weapons/gunshot/gunshot3.ogg'
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a762mm/m14
	requires_two_hands = 4
	wielded_item_state = "woodarifle-wielded"

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=0, requires_two_hands = 4, move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="long bursts",	burst=8, fire_delay=null, move_delay=8, requires_two_hands = 3, burst_accuracy = list(0,-1,-1,-2,-2,-2,-3,-3), dispersion = list(1.0, 1.0, 1.0, 1.0, 1.2)),
		)

/obj/item/weapon/gun/projectile/automatic/m14/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "M14"
	else
		icon_state = "M14-empty"
	return

/obj/item/ammo_magazine/a762mm/m14
	name = "M14 magazine box (7.62mm)"
	icon = 'icons/urist/items/guns.dmi'
	icon_state = "M14MAG"
	max_ammo = 15

/obj/item/ammo_magazine/a762mm/m14/empty
	initial_ammo = 0

/obj/item/weapon/gun/projectile/automatic/m16
	urist_only = 1
	name = "\improper M16 Assault Rifle"
	desc = "25 rounds of 5.56mm. Staple rifle for the Nanotrasen Servicemen. A 2557AD spin on the classic rifle."
	icon = 'icons/urist/items/guns.dmi'
	icon_state = "M16"
	item_state = "arifle"
	w_class = 4
	force = 10
	caliber = "a556"
	origin_tech = "combat=6;materials=1;syndicate=4"
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a556/m16
	requires_two_hands = 4
	fire_sound = 'sound/weapons/gunshot/gunshot2.ogg'
	wielded_item_state = "genericrifle-wielded"

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=0, requires_two_hands = 4, move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, move_delay=6, fire_delay=null, requires_two_hands = 5, burst_accuracy = list(0,-1,-1,-2,-2), dispersion = list(0.0, 0.6, 0.6)),
		list(mode_name="short bursts", 	burst=5, move_delay=6, fire_delay=null, requires_two_hands = 6, burst_accuracy = list(0,-1,-1,-2,-2), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2)),
		)

/obj/item/weapon/gun/projectile/automatic/m16/update_icon()
	..()
	if(icon_state == "M16-GL")
		icon_state = (ammo_magazine)? "M16-GL" : "M16-GL-empty"
	else
		icon_state = (ammo_magazine)? "M16" : "M16-empty"
	update_held_icon()

/obj/item/weapon/gun/projectile/automatic/m16/gl
	name = "\improper M16-GL Assault Rifle"
	desc = "25 rounds of 5.56mm. Staple rifle for the Nanotrasen Servicemen. A 2557AD spin on the classic rifle, complete with underslung grenade launcher."
	icon_state = "M16-GL"
	var/use_launcher = null

	firemodes = list(
		list(mode_name="semiauto", burst=1, use_launcher=null, fire_delay=0, requires_two_hands = 4, move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, use_launcher=null, move_delay=6, fire_delay=null, requires_two_hands = 5, burst_accuracy = list(0,-1,-1,-2,-2), dispersion = list(0.0, 0.6, 0.6)),
		list(mode_name="short bursts", burst=5, use_launcher=null, move_delay=6, fire_delay=null, requires_two_hands = 6, burst_accuracy = list(0,-1,-1,-2,-2), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2)),
		list(mode_name="fire grenades", burst=null, fire_delay=null, move_delay=null, use_launcher=1,  burst_accuracy=null, dispersion=null)
		)

	var/obj/item/weapon/gun/launcher/grenade/underslung/launcher

/obj/item/weapon/gun/projectile/automatic/m16/gl/New()
	..()
	launcher = new(src)

/obj/item/weapon/gun/projectile/automatic/m16/gl/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/grenade)))
		launcher.load(I, user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/m16/gl/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && src.use_launcher)
		launcher.unload(user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/m16/gl/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(src.use_launcher)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
	else
		..()

/obj/item/weapon/gun/projectile/automatic/m16/gl/examine(mob/user)
	..()
	if(launcher.chambered)
		user << "\The [launcher] has \a [launcher.chambered] loaded."
	else
		user << "\The [launcher] is empty."

/obj/item/ammo_magazine/a556/m16
	name = "M16 magazine (5.56mm)"
	icon = 'icons/urist/items/guns.dmi'
	icon_state = "M16MAG"
	max_ammo = 25

/obj/item/ammo_magazine/a556/m16/empty
	initial_ammo = 0

/obj/item/weapon/gun/projectile/shotgun/pump/combat/ithaca
	name = "Ithaca 37 combat shotgun"
	desc = "A standard Nanotrasen combat shotgun. Holds 7 rounds (8 with one in the chamber). Pump-action, it's perfect for CQB and tight hallway clearing."
	icon = 'icons/urist/items/guns.dmi'
	icon_state = "ithaca"

/obj/item/weapon/gun/projectile/automatic/m3
	urist_only = 1
	name = "M3 Grease Gun"
	desc = "The submachine gun for medical personnel and infantrymen. Only fires in short and long bursts. Takes magazines of 32 .45 rounds."
	icon = 'icons/urist/items/guns.dmi'
	icon_state = "M3"
	item_state = "arifle"
	w_class = 3
	force = 10
	caliber = ".45"
	origin_tech = "combat=6;materials=1;syndicate=4"
	slot_flags = SLOT_BELT
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/c45m/m3
	requires_two_hands = 1
	fire_sound = 'sound/weapons/gunshot/gunshot_pistol.ogg'
	firemodes = list(
		list(mode_name="short bursts",	burst=4, fire_delay=null, move_delay=6, requires_two_hands = 2, burst_accuracy = list(0,-1,-1,-2,-2,-2,-3,-3), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2)),
		list(mode_name="long bursts",	burst=8, fire_delay=null, move_delay=8, requires_two_hands = 3, burst_accuracy = list(0,-1,-1,-2,-2,-2,-3,-3), dispersion = list(1.0, 1.0, 1.0, 1.0, 1.2)),
		)

/obj/item/weapon/gun/projectile/automatic/m3/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "M3"
	else
		icon_state = "M3-empty"
	return

/obj/item/ammo_magazine/c45m/m3
	name = "M3 magazine (.45)"
	icon = 'icons/urist/items/guns.dmi'
	icon_state = "M3MAG"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/c45
	matter = list(DEFAULT_WALL_MATERIAL = 525) //metal costs are very roughly based around 1 .45 casing = 75 metal
	caliber = ".45"
	max_ammo = 32

/obj/item/ammo_magazine/c45m/m3/empty
	initial_ammo = 0

/obj/item/weapon/gun/projectile/bhp9mm
	name = "\improper Browning HP pistol"
	desc = "The NCO's sidearm. 15 rounds of 9mm. Less power than a .45, but almost double the capacity. May be issued to medical units as well."
	icon = 'icons/urist/items/guns.dmi'
	icon_state = "brownhp"
	item_state = "pistol"
	w_class = 2
	caliber = "9mm"
	origin_tech = "combat=2;materials=2;syndicate=2"
	fire_sound = 'sound/weapons/gunshot/Gunshot_pistol.ogg'
	slot_flags = SLOT_BELT
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/mc9mm/bhp

/obj/item/weapon/gun/projectile/bhp9mm/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "brownhp"
	else
		icon_state = "brownhp-empty"
	return

/obj/item/ammo_magazine/mc9mm/bhp
	icon = 'icons/urist/items/guns.dmi'
	name = "Browning HP magazine (9mm)"
	icon_state = "BROWNHPMAG"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/c9mm
	max_ammo = 15

/obj/item/ammo_magazine/mc9mm/bhp/empty
	initial_ammo = 0

//adminfuckery gun slash proof of concept
/obj/item/weapon/gun/projectile/automatic/shotmachinegun
	urist_only = 1
	name = "Shotmachinegun"
	desc = "A product of a warped imagination, a fully automatic machine-shotgun."
	icon = 'icons/urist/items/guns.dmi'
	icon_state = "M60closed75"
	item_state = "M60closed"
	caliber = "shotgun"
	max_shells = 75
	allowed_magazines = list(/obj/item/ammo_magazine/shotmachinegun)
	magazine_type = /obj/item/ammo_magazine/shotmachinegun
	requires_two_hands = 6
	wielded_item_state = "genericLMG-wielded"
	fire_sound = 'sound/weapons/gunshot/shotgun.ogg'
	load_method = MAGAZINE
	firemodes = list(
		list(mode_name="short bursts",	burst=5, move_delay=12, requires_two_hands=8, burst_accuracy = list(0,-1,-1,-2,-2),          dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2)),
		list(mode_name="long bursts",	burst=8, move_delay=15, requires_two_hands=9, burst_accuracy = list(0,-1,-1,-2,-2,-2,-3,-3), dispersion = list(1.0, 1.0, 1.0, 1.0, 1.2)),
		)

/obj/item/ammo_magazine/shotmachinegun
	caliber = "shotgun"
	ammo_type = /obj/item/ammo_casing/shotgun
	initial_ammo = 75
	matter = list(DEFAULT_WALL_MATERIAL = 1200)
	mag_type = MAGAZINE
	multiple_sprites = 0

/obj/item/weapon/gun/projectile/manualcycle
	var/bolt_open = 0

/obj/item/weapon/gun/projectile/manualcycle/update_icon()
	if(bolt_open)
		icon_state = "[initial(icon_state)]_alt"
	else
		icon_state = "[initial(icon_state)]"

/obj/item/weapon/gun/projectile/manualcycle/attack_self(mob/user as mob)
	playsound(src.loc, 'sound/weapons/flipblade.ogg', 50, 1)
	bolt_open = !bolt_open
	if(bolt_open)
		if(chambered)
			user << "<span class='notice'>You work the bolt open, ejecting [chambered]!</span>"
			chambered.loc = get_turf(src)
			loaded -= chambered
			chambered = null
		else
			user << "<span class='notice'>You work the bolt open.</span>"
	else
		user << "<span class='notice'>You work the bolt closed.</span>"
		bolt_open = 0
	add_fingerprint(user)
	update_icon()

/obj/item/weapon/gun/projectile/manualcycle/special_check(mob/user)
	if(bolt_open)
		user << "<span class='warning'>You can't fire [src] while the bolt is open!</span>"
		return 0
	return ..()

/obj/item/weapon/gun/projectile/manualcycle/load_ammo(var/obj/item/A, mob/user)
	if(!bolt_open)
		return
	..()

/obj/item/weapon/gun/projectile/manualcycle/unload_ammo(mob/user, var/allow_dump=1)
	if(!bolt_open)
		return
	..()

/obj/item/weapon/gun/projectile/manualcycle/imprifle
	name = "improvised rifle"
	icon = 'icons/urist/items/guns.dmi'
	desc = "A shoddy 7.62 improvised rifle."
	wielded_item_state = "woodarifle-wielded"
	icon_state = "308bolt"
	item_state = "dshotgun" //placeholder
	w_class = 5
	requires_two_hands = 4
	force = 10
	slot_flags = SLOT_BACK
	origin_tech = "combat=2;materials=1"
	caliber = "a762"
	//fire_sound = 'sound/weapons/sniper.ogg'
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING
	max_shells = 3
	ammo_type = /obj/item/ammo_casing/a762
	accuracy = -1
	jam_chance = 5


/obj/item/weapon/gun/projectile/manualcycle/imprifle/impriflesawn
	name = "improvised short rifle"
	icon = 'icons/urist/items/guns.dmi'
	desc = "A crudely cut down 7.62 improvised rifle."
	icon_state = "308boltsawed"
	item_state = "sawnshotgun" //placeholder
	w_class = 4
	requires_two_hands = 0
	force = 4
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	origin_tech = "combat=1"
	caliber = "a762"
	//fire_sound = 'sound/weapons/sniper.ogg'
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING
	max_shells = 3
	ammo_type = /obj/item/ammo_casing/a762
	accuracy = -2
	jam_chance = 20

/obj/item/weapon/gun/projectile/manualcycle/imprifle/impriflesawn/update_icon()
	if(bolt_open)
		icon_state = "308boltsawed_alt"
	else
		icon_state = "308boltsawed"
//rifle construction

/obj/item/weapon/imprifleframe/imprifleframesawn
	name = "unfinished improvised short rifle"
	desc = "An almost-complete improvised short rifle."
	icon = 'icons/urist/items/guns.dmi'
	icon_state = "308boltsawed"
	item_state = "sawnshotgun"

/obj/item/weapon/imprifleframe
	name = "improvised rifle stock"
	desc = "A half-finished improvised rifle."
	icon = 'icons/urist/items/guns.dmi'
	icon_state = "308boltframe0"
	item_state = "sawnshotgun"
	var/buildstate = 0

/obj/item/weapon/imprifleframe/update_icon()
	icon_state = "308boltframe[buildstate]"

/obj/item/weapon/imprifleframe/examine(mob/user)
	..(user)
	switch(buildstate)
		if(1) user << "It has an unfinished pipe barrel in place on the wooden furniture."
		if(2) user << "It has an unfinished pipe barrel wired in place."
		if(3) user << "It has an unfinished reinforced pipe barrel wired in place."
		if(4) user << "It has a reinforced pipe barrel secured on the wooden furniture."
		if(5) user << "It has an unsecured reciever in place."
		if(6) user << "It has a secured reciever in place."
		if(7) user << "It has an unfinished pipe bolt in place."
		if(8) user << "It has a finished unsecured pipe bolt in place."
		if(9) user << "It has a finished secured bolt in place."

/obj/item/weapon/imprifleframe/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/pipe))
		if(buildstate == 0)
			user.drop_from_inventory(W)
			qdel(W)
			user << "<span class='notice'>You place the piping on the stock.</span>"
			buildstate++
			update_icon()
			return
		if(buildstate == 7)
			user.drop_from_inventory(W)
			qdel(W)
			user << "<span class='notice'>You install a bolt on the frame.</span>"
			buildstate++
			playsound(src.loc, 'sound/items/syringeproj.ogg', 100, 1)
			update_icon()
			return
	else if(istype(W,/obj/item/stack/cable_coil))
		var/obj/item/stack/cable_coil/C = W
		if(buildstate == 1)
			if(C.use(10))
				user << "<span class='notice'>You secure the barrel to the wooden furniture with wire.</span>"
				buildstate++
				update_icon()
			else
				user << "<span class='notice'>You need at least ten segments of cable coil to complete this task.</span>"
			return
	else if(istype(W,/obj/item/weapon/screwdriver))
		if(buildstate == 2)
			user << "<span class='notice'>You further secure the barrel to the wooden furniture.</span>"
			buildstate++
			playsound(src.loc, 'sound/items/Screwdriver2.ogg', 100, 1)
			return
		if(buildstate == 6)
			user << "<span class='notice'>You secure the metal reciever.</span>"
			buildstate++
			playsound(src.loc, 'sound/items/Screwdriver.ogg', 100, 1)
			return
	else if(istype(W,/obj/item/stack/material) && W.get_material_name() == "plasteel")
		if(buildstate == 3)
			var/obj/item/stack/material/P = W
			if(P.use(5))
				user << "<span class='notice'>You reinforce the barrel with plasteel.</span>"
				buildstate++
				playsound(src.loc, 'sound/items/Deconstruct.ogg', 100, 1)
			else
				user << "<span class='notice'>You need at least five plasteel sheets to complete this task.</span>"
			return
	else if(istype(W,/obj/item/weapon/wrench))
		if(buildstate == 4)
			user << "<span class='notice'>You secure the reinforced barrel.</span>"
			buildstate++
			playsound(src.loc, 'sound/items/Ratchet.ogg', 100, 1)
			return
	else if(istype(W,/obj/item/stack/material) && W.get_material_name() == DEFAULT_WALL_MATERIAL)
		if(buildstate == 5)
			var/obj/item/stack/material/P = W
			if(P.use(10))
				user << "<span class='notice'>You assemble and install a metal reciever onto the frame</span>"
				buildstate++
				update_icon()
				playsound(src.loc, 'sound/items/Crowbar.ogg', 100, 1)
			else
				user << "<span class='notice'>You need at least ten steel sheets to complete this task.</span>"
			return
	else if(istype(W,/obj/item/stack/rods))
		if(buildstate == 8)
			var/obj/item/stack/rods/R = W
			if(R.use(3))
				user << "<span class='notice'>You attach the rods to the bolt.</span>"
				buildstate++
				playsound(src.loc, 'sound/items/Wirecutter.ogg', 100, 1)
			else
				user << "<span class='notice'>You need at least 3 rods to complete this task.</span>"
			return
	else if(istype(W,/obj/item/weapon/weldingtool))
		if(buildstate == 9)
			var/obj/item/weapon/weldingtool/T = W
			if(T.remove_fuel(5,user))
				if(!src || !T.isOn()) return
				playsound(src.loc, 'sound/items/Welder2.ogg', 100, 1)
			user << "<span class='notice'>You secure the improvised rifle's various parts.</span>"
			var/obj/item/weapon/gun/projectile/manualcycle/imprifle/emptymag = new /obj/item/weapon/gun/projectile/manualcycle/imprifle(get_turf(src))
			emptymag.loaded = list()
			qdel(src)
		return
	else if(istype(W,/obj/item/weapon/circular_saw))
		if(buildstate == 9)
			user << "<span class='notice'>You saw the barrel on the unfinished improvised rifle down.</span>"
			new /obj/item/weapon/imprifleframe/imprifleframesawn(get_turf(src))
			playsound(src.loc, 'sound/weapons/circsawhit.ogg', 100, 1)
			qdel(src)
		return
	else
/obj/item/weapon/imprifleframe/imprifleframesawn/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/weapon/weldingtool))
		if(buildstate == 0)
			var/obj/item/weapon/weldingtool/T = W
			if(T.remove_fuel(5,user))
				if(!src || !T.isOn()) return
				playsound(src.loc, 'sound/items/Welder2.ogg', 100, 1)
			user << "<span class='notice'>You secure the improvised rifle's various parts.</span>"
			var/obj/item/weapon/gun/projectile/manualcycle/imprifle/impriflesawn/emptymag = new /obj/item/weapon/gun/projectile/manualcycle/imprifle/impriflesawn(get_turf(src))
			emptymag.loaded = list()
			qdel(src)
		return
	..()
/*
/obj/item/weapon/gun/projectile/revolver/shotrevolver
	name = "shot revolver"
	desc = "The Lumoco Arms HE Colt is a choice revolver for when you absolutely, positively need to put a hole in the other guy. Uses .357 ammo."
	icon_state = "revolver"
	item_state = "revolver"
	caliber = "shotgun"
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 1)
	handle_casings = CYCLE_CASINGS
	max_shells = 4
	ammo_type = /obj/item/ammo_casing/shotgun/


/obj/item/weapon/gun/projectile/revolver/shotrevolver/consume_next_projectile()
	if(chamber_offset)
		chamber_offset--
		return
	return ..()

/obj/item/weapon/gun/projectile/revolver/shotrevolver/load_ammo(var/obj/item/A, mob/user)
	chamber_offset = 0
	return ..()
*/

/obj/item/weapon/gun/projectile/manualcycle/mosinnagant
	urist_only = 1
	name = "Mosin-Nagant"
	icon = 'icons/urist/items/guns.dmi'
	desc = "The standard bolt action rifle of the Red Army. The glorious Soviet Moist Nugget is chambered in 7.62 and holds 5 rounds, fed by a stripper clip."
	wielded_item_state = "rifle2"
	icon_state = "huntrifle"
	item_state = "rifle2" //maybe change this
	w_class = 5
	requires_two_hands = 4
	force = 10
	slot_flags = SLOT_BACK
	caliber = "a762"
	handle_casings = HOLD_CASINGS
//	load_method = SINGLE_CASING
	max_shells = 5
	ammo_type = /obj/item/ammo_casing/a762
//	accuracy = -1
//	jam_chance = 5
	fire_sound = 'sound/weapons/gunshot/gunshot_strong.ogg'
