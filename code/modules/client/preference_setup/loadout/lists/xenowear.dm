// Alien clothing.

// Unathi clothing
/datum/gear/suit/unathi/
	sort_category = "Xenowear"
	category = /datum/gear/suit/unathi/
	whitelisted = list(SPECIES_UNATHI)

/datum/gear/suit/unathi/mantle
	display_name = "hide mantle (Unathi)"
	path = /obj/item/clothing/suit/unathi/mantle
	cost = 1

/datum/gear/suit/unathi/robe
	display_name = "roughspun robe (Unathi)"
	path = /obj/item/clothing/suit/unathi/robe
	cost = 1

/datum/gear/suit/unathi/knifeharness
	display_name = "decorated harness"
	path = /obj/item/clothing/accessory/storage/knifeharness
	cost = 5

//Skrell Chains
/datum/gear/ears/skrell/
	sort_category = "Xenowear"
	category = /datum/gear/ears/skrell/
	whitelisted = list(SPECIES_SKRELL)

/datum/gear/ears/skrell/chains
	display_name = "headtail chain selection (Skrell)"
	path = /obj/item/clothing/ears/skrell/chain
	flags = GEAR_HAS_SUBTYPE_SELECTION

/datum/gear/ears/skrell/colored/chain
	display_name = "colored headtail chain, colour select (Skrell)"
	path = /obj/item/clothing/ears/skrell/colored/chain
	flags = GEAR_HAS_COLOR_SELECTION

//Skrell Bands
/datum/gear/ears/skrell/bands
	display_name = "headtail band selection (Skrell)"
	path = /obj/item/clothing/ears/skrell/band
	flags = GEAR_HAS_SUBTYPE_SELECTION

/datum/gear/ears/skrell/colored/band
	display_name = "headtail bands, colour select (Skrell)"
	path = /obj/item/clothing/ears/skrell/colored/band
	flags = GEAR_HAS_COLOR_SELECTION

//Skrell Cloth
/datum/gear/ears/skrell/cloth/male
	display_name = "men's headtail cloth (Skrell)"
	path = /obj/item/clothing/ears/skrell/cloth_male

/datum/gear/ears/skrell/cloth/male/New()
	..()
	var/list/valid_colors = list("#c20c00", "#0227f7", "#6262ff", "#454545", "#009900", "#e17291")
	gear_tweaks = list(new/datum/gear_tweak/color(valid_colors))

/datum/gear/ears/skrell/cloth/female
	display_name = "women's headtail cloth (Skrell)"
	path = /obj/item/clothing/ears/skrell/cloth_female

/datum/gear/ears/skrell/cloth/female/New()
	..()
	var/list/valid_colors = list("#c20c00", "#0227f7", "#6262ff", "#454545", "#009900", "#e17291")
	gear_tweaks = list(new/datum/gear_tweak/color(valid_colors))

/datum/gear/suit/lab_veymed_skrell
	display_name = "Vey-Med labcoat"
	path = /obj/item/clothing/suit/storage/toggle/labcoat/corp/veymed
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_SKRELL)

// IPC clothing
/datum/gear/mask/ipc_monitor
	display_name = "display monitor (IPC)"
	path = /obj/item/clothing/mask/monitor
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_IPC)
	cost = 0

/datum/gear/suit/lab_xyn_machine
	display_name = "Xynergy labcoat"
	path = /obj/item/clothing/suit/storage/toggle/labcoat/xyn_machine
	slot = slot_wear_suit
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_IPC)

// Misc clothing
/datum/gear/uniform/harness
	display_name = "gear harness (Full Body Prosthetic, Diona, Giant Armoured Serpentid)"
	path = /obj/item/clothing/under/harness
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_IPC,SPECIES_DIONA, SPECIES_NABBER)

/datum/gear/shoes/toeless
	display_name = "toeless jackboots"
	path = /obj/item/clothing/shoes/jackboots/unathi
	sort_category = "Xenowear"

/datum/gear/shoes/wrk_toeless
	display_name = "toeless workboots"
	path = /obj/item/clothing/shoes/workboots/toeless
	sort_category = "Xenowear"

/datum/gear/accessory/capes/New()
	..()
	var/capes = list()
	capes["simple cape"] = /obj/item/clothing/accessory/shouldercape/grunt
	capes["decorated cape"] = /obj/item/clothing/accessory/shouldercape/officer
	capes["government cape"] = /obj/item/clothing/accessory/shouldercape/command
	gear_tweaks += new/datum/gear_tweak/path(capes)

// Pre-modified gloves

/datum/gear/gloves/colored/modified
	display_name = "modified gloves, colored"
	path = /obj/item/clothing/gloves/color/modified
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_TAJARA, SPECIES_UNATHI)

/datum/gear/gloves/latex/modified
	display_name = "modified gloves, latex"
	path = /obj/item/clothing/gloves/latex/modified
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_TAJARA, SPECIES_UNATHI)

/datum/gear/gloves/nitrile/modified
	display_name = "modified gloves, nitrile"
	path = /obj/item/clothing/gloves/latex/nitrile/modified
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_TAJARA, SPECIES_UNATHI)

/datum/gear/gloves/rainbow/modified
	display_name = "modified gloves, rainbow"
	path = /obj/item/clothing/gloves/rainbow/modified
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_TAJARA, SPECIES_UNATHI)

/datum/gear/gloves/evening/modified
	display_name = "modified gloves, evening"
	path = /obj/item/clothing/gloves/color/evening/modified
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_TAJARA, SPECIES_UNATHI)

/datum/gear/gloves/botany/modified
	display_name = "modified gloves, botany"
	path = /obj/item/clothing/gloves/thick/botany/modified
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_TAJARA, SPECIES_UNATHI)

/datum/gear/gloves/work/modified
	display_name = "modified gloves, work"
	path = /obj/item/clothing/gloves/thick/modified
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_TAJARA, SPECIES_UNATHI)

// Vox clothing
/datum/gear/mask/gas/vox
	display_name = "vox breathing mask"
	path = /obj/item/clothing/mask/gas/vox
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_VOX)