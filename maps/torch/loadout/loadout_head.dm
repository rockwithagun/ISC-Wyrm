/datum/gear/head/solberet
	display_name = "SolGov beret selection"
	description = "A beret denoting service in an organization within SolGov."
	path = /obj/item/clothing/head/beret/solgov
	allowed_roles = SOLGOV_ROLES

/datum/gear/head/solberet/New()
	..()
	var/berets = list()
	berets["peacekeeper beret"] = /obj/item/clothing/head/beret/solgov
	berets["home guard beret"] = /obj/item/clothing/head/beret/solgov/homeguard
	berets["gateway administration beret"] = /obj/item/clothing/head/beret/solgov/gateway
	berets["customs and trade beret"] = /obj/item/clothing/head/beret/solgov/customs
	berets["government research beret"] = /obj/item/clothing/head/beret/solgov/research
	berets["health service beret"] = /obj/item/clothing/head/beret/solgov/health
	berets["diplomatic security beret"] = /obj/item/clothing/head/beret/solgov/diplomatic
	berets["border security beret"] = /obj/item/clothing/head/beret/solgov/borderguard
	gear_tweaks += new/datum/gear_tweak/path(berets)

/datum/gear/head/veteranhat
	display_name = "veteran hat"
	path = /obj/item/clothing/head/soft/solgov/veteranhat
	allowed_roles = NON_MILITARY_ROLES

/datum/gear/head/solhat
	display_name = "sol central government hat"
	path = /obj/item/clothing/head/soft/solgov
	allowed_roles = SOLGOV_ROLES

/datum/gear/head/fleethat
	display_name = "fleet cap"
	path = /obj/item/clothing/head/solgov/utility/fleet
	cost = 0
	allowed_roles = SOLGOV_ROLES

/datum/gear/head/echat
	display_name = "EC cap"
	path = /obj/item/clothing/head/soft/solgov/expedition
	cost = 0
	allowed_roles = SOLGOV_ROLES

/datum/gear/head/veteranhat
	display_name = "veteran hat"
	path = /obj/item/clothing/head/soft/solgov/veteranhat
	allowed_roles = NON_MILITARY_ROLES

/datum/gear/head/surgical
	allowed_roles = STERILE_ROLES

/datum/gear/head/whitentberet
	allowed_roles = list(/datum/job/guard)

/datum/gear/head/beret
	allowed_roles = NON_MILITARY_ROLES

/datum/gear/mask/bandana
	allowed_roles = NON_MILITARY_ROLES
	
/datum/gear/head/bandana
	allowed_roles = NON_MILITARY_ROLES

/datum/gear/head/bow
	allowed_roles = NON_MILITARY_ROLES

/datum/gear/head/cap
	display_name = "cap selection"
	path = /obj/item/clothing/head
	allowed_roles = NON_MILITARY_ROLES

/datum/gear/head/hairflower
	allowed_roles = NON_MILITARY_ROLES

/datum/gear/head/hardhat
	allowed_roles = TECHNICAL_ROLES

/datum/gear/head/formalhat
	display_name = "formal hat selection"
	path = /obj/item/clothing/head
	allowed_roles = FORMAL_ROLES

/datum/gear/head/informalhat
	allowed_roles = SEMIFORMAL_ROLES

/datum/gear/head/welding
	allowed_roles = TECHNICAL_ROLES