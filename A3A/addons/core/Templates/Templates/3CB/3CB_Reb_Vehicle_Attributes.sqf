["attributesVehicles", [
    // smaller plane, AKA cheaper
    ["UK3CB_C_AC500", ["rebCost", 4000]],

    //Civ Cars
    ["UK3CB_C_Golf", ["rebCost", 150]], //No Cargo, 5 Seats, 200 speed
    ["UK3CB_C_Landcruiser", ["rebCost", 180]], //No Cargo, 7 Seats, slow
    ["UK3CB_C_SUV", ["rebCost", 250]], //No Cargo 6 Seats
    ["UK3CB_C_Pickup", ["rebCost", 250]], //Cargo, 9 Seats
    ["UK3CB_C_Hilux_Open", ["rebCost", 250]],//Cargo, 8 Seats
	
	["UK3CB_C_Datsun_Open", ["rebCost", 250]], 
	["UK3CB_C_S1203", ["rebCost", 250]], 
	["UK3CB_C_MMT", ["rebCost", 25]], 
	
    //Civ Trucks
    ["UK3CB_TKC_C_Kamaz_Open", ["rebCost", 800]], //17 Seats 80 Speed
    ["UK3CB_C_Ural_Open", ["rebCost", 650]], //15 Seats 76 Speed
    ["UK3CB_C_Ural_Recovery", ["rebCost", 1200]],
    ["UK3CB_C_V3S_Recovery", ["rebCost", 1000]],
	
	//Rebel cars
	["UK3CB_MDF_I_MB4WD_Unarmed", ["rebCost", 150]],  	//4 seats, slow
	["UK3CB_FIA_I_LR_Open", ["rebCost", 250]],  	//4 seats, slow
	
    //Rebel Boats
    ["UK3CB_I_G_Fishing_Boat_SPG9", ["rebCost", 800]],
    ["UK3CB_CHD_I_Fishing_Boat_Zu23_front", ["rebCost", 1000]],
	
    //Rebel Light Unarmed
    ["UK3CB_ION_B_Winter_M998_2DR", ["rebCost", 500]],
    ["UK3CB_LSM_B_BTR40", ["rebCost", 600]],
	
    //Rebel Light Armed
	["UK3CB_MDF_I_MB4WD_LMG", ["rebCost", 500]],		//5.56 LMG
    ["UK3CB_I_G_LandRover_SF_M2", ["rebCost", 800]],
    ["UK3CB_ION_B_Winter_M1025_M2", ["rebCost", 900]],
    ["UK3CB_ION_B_Winter_SUV_Armed", ["rebCost", 1000]],
    ["UK3CB_LSM_B_Hilux_Mortar", ["rebCost", 1000]],
    ["UK3CB_LSM_B_Hilux_Pkm", ["rebCost", 600]],
    ["UK3CB_LSM_B_BTR40_MG", ["rebCost", 900]],
	
	//Rebel Static
    ["UK3CB_FIA_I_M240_High", ["rebCost", 300]],
    ["UK3CB_FIA_I_M240_Low", ["rebCost", 300]],
    ["UK3CB_NAP_I_PKM_High", ["rebCost", 300]],
    ["UK3CB_NAP_I_PKM_Low", ["rebCost", 300]],
    ["UK3CB_MEI_I_PKM_Low", ["rebCost", 300]],
    ["UK3CB_MEI_I_PKM_High", ["rebCost", 300]]
]] call _fnc_saveToTemplate;