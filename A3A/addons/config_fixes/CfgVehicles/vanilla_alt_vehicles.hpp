//Black/dark grey
class O_LSV_02_AT_F;				//
class B_LSV_01_AT_F;				//
class I_C_Offroad_02_unarmed_F;		//
class I_C_Offroad_02_AT_F;			//
class I_C_Offroad_02_LMG_F;			//
class O_MBT_04_cannon_F;			//
class O_MBT_04_command_F; 			//
class I_C_Heli_Light_01_civil_F; 	//
class I_Heli_Transport_02_F; 		//
class B_Heli_Light_01_F;
class B_Heli_Light_01_dynamicLoadout_F;

//lower profile Civilian-ish paintjobs
class O_Truck_02_Ammo_F;			//
class O_Truck_02_Fuel_F;	        //
class O_Truck_02_box_F;	            //
class O_Truck_02_transport_F;	    //
class O_Truck_02_covered_F;	        //
class O_Truck_02_medical_F;	        //
class I_Truck_02_MRL_F;				//

//blufor paintjob
class O_Boat_Armed_01_hmg_F; 				//
class I_MRAP_03_F;                          //
class I_MRAP_03_gmg_F;                      //
class I_MRAP_03_hmg_F;                      //
class I_Heli_light_03_dynamicLoadout_F;     //
class I_APC_Wheeled_03_cannon_F;            //
class I_Plane_Fighter_03_dynamicLoadout_F;	//
class I_Plane_Fighter_04_F; 				//

//militia offroads
class B_G_Offroad_01_armed_F;
class B_G_Offroad_01_F;
class B_G_Offroad_01_AT_F;
class I_E_Offroad_01_comms_F;
class I_E_Offroad_01_covered_F;
class C_Offroad_01_comms_F;
class C_Offroad_01_covered_F;

//Black - Any/ION
class a3a_Offroad_01_black_F	:	B_G_Offroad_01_F
{
	hiddenSelectionsTextures[] = {"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_blk_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_blk_co.paa"};
	textureList[] = {};
};
class a3a_Offroad_01_black_armed_F	:	B_G_Offroad_01_armed_F
{
	hiddenSelectionsTextures[] = {"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_blk_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_blk_co.paa"};
	textureList[] = {};
};
class a3a_Offroad_01_black_AT_F : B_G_Offroad_01_AT_F
{
	hiddenSelectionsTextures[] = {"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_blk_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_blk_co.paa"};
	textureList[] = {};
};
class a3a_Offroad_01_comms_black_F	:	C_Offroad_01_comms_F
{
	crew = "B_G_Soldier_F";
	faction = "BLU_G_F";
	side = 1;
};
class a3a_Offroad_01_covered_black_F : C_Offroad_01_covered_F
{
	crew = "B_G_Soldier_F";
	faction = "BLU_G_F";
	side = 1;
};

//Greens - Temperate
class a3a_Offroad_01_green_F	:	B_G_Offroad_01_F
{
	hiddenSelectionsTextures[] = {"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa"};
	textureList[] = {"Green",1};
};
class a3a_Offroad_01_green_armed_F	:	B_G_Offroad_01_armed_F
{
	hiddenSelectionsTextures[] = {"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa"};
	textureList[] = {"Green",1};
};
class a3a_Offroad_01_green_AT_F : B_G_Offroad_01_AT_F
{
	hiddenSelectionsTextures[] = {"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa"};
	textureList[] = {"Green",1};
};
class a3a_Offroad_01_comms_green_F	:	I_E_Offroad_01_comms_F
{
	crew = "B_G_Soldier_F";
	faction = "BLU_G_F";
	side = 1;
	hiddenSelectionsTextures[] = {"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_cover_grn_co.paa"};
	textureList[] = {"Green",1};
};
class a3a_Offroad_01_covered_green_F : I_E_Offroad_01_covered_F
{
	crew = "B_G_Soldier_F";
	faction = "BLU_G_F";
	side = 1;
	hiddenSelectionsTextures[] = {"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_cover_grn_co.paa"};
	textureList[] = {"Green",1};
};

//Tans - Arid
class a3a_Offroad_01_tan_F	:	B_G_Offroad_01_F
{
	hiddenSelectionsTextures[] = {"a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa","a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa"};
	textureList[] = {};
};
class a3a_Offroad_01_tan_armed_F	:	B_G_Offroad_01_armed_F
{
	hiddenSelectionsTextures[] = {"a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa","a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa"};
	textureList[] = {};
};
class a3a_Offroad_01_tan_AT_F : B_G_Offroad_01_AT_F
{
	hiddenSelectionsTextures[] = {"a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa","a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa"};
	textureList[] = {};
};
class a3a_Offroad_01_comms_tan_F	:	I_E_Offroad_01_comms_F
{
	crew = "B_G_Soldier_F";
	faction = "BLU_G_F";
	side = 1;
	hiddenSelectionsTextures[] = {"a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa","a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_cover_blk_co.paa"};
	textureList[] = {};
};
class a3a_Offroad_01_covered_tan_F : I_E_Offroad_01_covered_F
{
	crew = "B_G_Soldier_F";
	faction = "BLU_G_F";
	side = 1;
	hiddenSelectionsTextures[] = {"a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa","a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_cover_blk_co.paa"};
	textureList[] = {};
};

//LDF Camo - LDF
class a3a_Offroad_01_ldf_armed_F	:	B_G_Offroad_01_armed_F
{
	hiddenSelectionsTextures[] = {"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_eaf_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_eaf_co.paa"};
	textureList[] = {"EAF",1};
};
class a3a_Offroad_01_ldf_AT_F : B_G_Offroad_01_AT_F
{
	hiddenSelectionsTextures[] = {"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_eaf_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_eaf_co.paa"};
	textureList[] = {"EAF",1};
};

class a3a_ion_Truck_02_MRL_F : I_Truck_02_MRL_F
{
	hiddenSelectionsTextures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_blue_co.paa","a3\soft_f_beta\truck_02\data\truck_02_int_co.paa","a3\soft_f_gamma\truck_02\data\truck_02_mrl_co.paa"};
};

class a3a_Heli_Light_01_ION_F : B_Heli_Light_01_F
{
	hiddenSelectionsTextures[] = {"a3\air_f\heli_light_01\data\heli_light_01_ext_ion_co.paa",""};
};
class a3a_Heli_Light_01_dynamicLoadout_ION_F : B_Heli_Light_01_dynamicLoadout_F
{
	hiddenSelectionsTextures[] = {"a3\air_f\heli_light_01\data\heli_light_01_ext_ion_co.paa","a3\air_f\heli_light_01\data\heli_light_01_dot_ca.paa"};
};

class a3a_MRAP_03_grey_F	:	I_MRAP_03_F
{ 
	hiddenSelectionsTextures[] = {"a3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa","a3\data_f\vehicles\turret_co.paa"};
};
class a3a_MRAP_03_gmg_grey_F	:	I_MRAP_03_gmg_F
{ 
	hiddenSelectionsTextures[] = {"a3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa","a3\data_f\vehicles\turret_co.paa"};
};
class a3a_MRAP_03_hmg_grey_F	:	I_MRAP_03_hmg_F
{ 
	hiddenSelectionsTextures[] = {"a3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa","a3\data_f\vehicles\turret_co.paa"};
};
class a3a_Heli_light_03_dynamicLoadout_green_F	:	I_Heli_light_03_dynamicLoadout_F
{ 
	hiddenSelectionsTextures[] = {"a3\air_f_epb\heli_light_03\data\heli_light_03_base_co.paa","a3\weapons_f\ammoboxes\data\ammobox_co.paa","a3\weapons_f\ammoboxes\data\ammobox_signs_ca.paa"};
};
class a3a_APC_Wheeled_03_cannon_tan_F	:	I_APC_Wheeled_03_cannon_F
{
	textureList[] = {"Guerilla_02",1,"Guerilla_01",0,"Guerilla_03",0,"Indep",0};
	hiddenSelectionsTextures[] = {"a3\data_f_tacops\data\apc_wheeled_03_ext_ig_02_co.paa","a3\data_f_tacops\data\apc_wheeled_03_ext2_ig_02_co.paa","a3\data_f_tacops\data\rcws30_ig_02_co.paa","a3\data_f_tacops\data\apc_wheeled_03_ext_alpha_ig_02_co.paa","a3\armor_f\data\camonet_aaf_fia_desert_co.paa","a3\armor_f\data\cage_sand_co.paa"};
};

class a3a_Plane_Fighter_04_grey_F : I_Plane_Fighter_04_F
{
	textureList[] = {"CamoGrey",1,"DigitalCamoGreen",0,"DigitalCamoGrey",0};
	hiddenSelectionsTextures[] = {"a3\air_f_jets\plane_fighter_04\data\fighter_04_fuselage_01_co.paa","a3\air_f_jets\plane_fighter_04\data\fighter_04_fuselage_02_co.paa","a3\air_f_jets\plane_fighter_04\data\fighter_04_misc_01_co.paa","a3\air_f_jets\plane_fighter_04\data\numbers\fighter_04_number_04_ca.paa","a3\air_f_jets\plane_fighter_04\data\numbers\fighter_04_number_04_ca.paa","a3\air_f_jets\plane_fighter_04\data\numbers\fighter_04_number_08_ca.paa"};
};
class a3a_Plane_Fighter_03_dynamicLoadout_grey_F : I_Plane_Fighter_03_dynamicLoadout_F
{
	textureList[] = {"Grey",1,"Green",0,"Hex",0};
	hiddenSelectionsTextures[] = {"a3\air_f_gamma\plane_fighter_03\data\plane_fighter_03_body_1_greyhex_co.paa","a3\air_f_gamma\plane_fighter_03\data\plane_fighter_03_body_2_greyhex_co.paa"};
};
class a3a_ION_Heli_Transport_02_F : I_Heli_Transport_02_F
{
	textureList[] = {"ION",1,"AAF",0,"IDAP",0,"Dahoman",0};
	hiddenSelectionsTextures[] = {"a3\air_f_beta\heli_transport_02\data\skins\heli_transport_02_1_ion_co.paa","a3\air_f_beta\heli_transport_02\data\skins\heli_transport_02_2_ion_co.paa","a3\air_f_beta\heli_transport_02\data\skins\heli_transport_02_3_ion_co.paa","a3\air_f_beta\heli_transport_02\data\heli_transport_02_int_02_co.paa"};
};
class a3a_Boat_Armed_01_hmg_black_F : O_Boat_Armed_01_hmg_F
{
	textureList[] = {"Blufor",1,"Indep",0,"Opfor",0};
	hiddenSelectionsTextures[] = {"a3\boat_f\boat_armed_01\data\boat_armed_01_ext_co.paa","a3\boat_f\boat_armed_01\data\boat_armed_01_int_co.paa","a3\boat_f\boat_armed_01\data\boat_armed_01_crows_blufor_co.paa"};
};
class a3a_LSV_02_AT_black_F	:	O_LSV_02_AT_F
{
	textureList[] = {"Black",1,"GreenHex",0,"Arid",0};
};
class a3a_LSV_01_AT_black_F	:	B_LSV_01_AT_F
{
	textureList[] = {"Black",1,"Olive",0,"Sand",0};
};
class a3a_Offroad_02_unarmed_black_F	:	I_C_Offroad_02_unarmed_F
{
	textureList[] = {"Black",1,"Blue",0,"Green",0,"Orange",0,"Red",0,"White",0,"Brown",0,"Olive",0,"IDAP",0};
};
class a3a_Offroad_02_black_AT_F	:	I_C_Offroad_02_AT_F
{
	textureList[] = {"Black",1,"Blue",0,"Green",0,"Orange",0,"Red",0,"White",0,"Brown",0,"Olive",0,"IDAP",0};
};
class a3a_Offroad_02_LMG_black_F	:	I_C_Offroad_02_LMG_F
{
	textureList[] = {"Black",1,"Blue",0,"Green",0,"Orange",0,"Red",0,"White",0,"Brown",0,"Olive",0,"IDAP",0};
};
class a3a_MBT_04_cannon_black_F	:	O_MBT_04_cannon_F
{
	textureList[] = {"Grey",1,"Jungle",0,"GreenHex",0,"Hex",0};
};
class a3a_MBT_04_command_black_F	:	O_MBT_04_command_F
{
	textureList[] = {"Grey",1,"Jungle",0,"GreenHex",0,"Hex",0};
};
class a3a_ION_Heli_Light_01_civil_F	:	I_C_Heli_Light_01_civil_F
{
	textureList[] = {"Red",0,"Blue",0,"Ion",1,"BlueLine",0,"Digital",0,"Elliptical",0,"Furious",0,"Graywatcher",0,"Jeans",0,"Light",0,"Shadow",0,"Sheriff",0,"Speedy",0,"Sunset",0,"Vrana",0,"Wasp",0,"Wave",0};
};
class a3a_ION_Truck_02_Ammo_F	:	O_Truck_02_Ammo_F
{

	class TextureSources{
		class BlueGreen {author = "Bohemia Interactive";
		displayName = "Blue & Green";
		textures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_blue_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_repair_green_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
		class BlueOrange {author = "Bohemia Interactive";
		displayName = "Blue & Orange";
		textures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_blue_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_repair_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
		class EAF {author = "Bohemia Interactive";
		displayName = "LDF";
		textures[] = {"\A3\soft_f_Enoch\Truck_02\Data\Truck_02_kab_EAF_co.paa","\A3\soft_f_Enoch\Truck_02\Data\Truck_02_repair_EAF_co.paa","\A3\soft_f_Enoch\Truck_02\Data\Truck_02_int_EAF_co.paa","\A3\soft_f_Enoch\Truck_02\Data\truck_02_chassis_EAF_CO.paa"};
		};
		class GreenHex {author = "Bohemia Interactive";
		displayName = "Green Hex";
		textures[] = {"\A3\soft_f_exp\Truck_02\Data\Truck_02_kab_GHEX_co.paa","\A3\soft_f_exp\Truck_02\Data\Truck_02_repair_GHEX_co.paa","\A3\soft_f_beta\Truck_02\Data\Truck_02_int_co.paa","\A3\Soft_F_Beta\Truck_02\data\truck_02_chassis_OPFOR_CO.paa"};
		};
		class Indep {author = "Bohemia Interactive";
		displayName = "AAF";
		textures[] = {"\A3\soft_f_beta\Truck_02\Data\Truck_02_kab_indp_co.paa","\A3\soft_f_beta\Truck_02\Data\Truck_02_repair_indp_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
		class Opfor {author = "Bohemia Interactive";
		displayName = "OPFOR";
		textures[] = {"\A3\soft_f_beta\Truck_02\Data\Truck_02_kab_opfor_co.paa","\A3\soft_f_beta\Truck_02\Data\Truck_02_repair_OPFOR_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
		class OrangeGreen {author = "Bohemia Interactive";
		displayName = "Orange & Green";
		textures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_repair_green_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
		class OrangeOrange {author = "Bohemia Interactive";
		displayName = "Orange";
		textures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_repair_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
	};
	textureList[] = {"BlueGreen",1,"BlueOrange",0,"EAF",0,"GreenHex",0,"Opfor",0,"OrangeGreen",0,"OrangeOrange",0};
	hiddenSelectionsTextures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_blue_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_repair_green_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
};
class a3a_ION_Truck_02_Fuel_F	:	O_Truck_02_Fuel_F
{

	class TextureSources{
		class Blue {
			author = "Bohemia Interactive";
			displayName = "Blue";
			textures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_blue_CO.paa","\a3\soft_f_beta\Truck_02\data\truck_02_fuel_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
		class EAF {
			author = "Bohemia Interactive";
			displayName = "LDF";
			textures[] = {"\A3\soft_f_Enoch\Truck_02\Data\Truck_02_kab_EAF_co.paa","\A3\soft_f_Enoch\Truck_02\Data\Truck_02_fuel_EAF_co.paa","\A3\soft_f_Enoch\Truck_02\Data\Truck_02_int_EAF_co.paa","\A3\soft_f_Enoch\Truck_02\Data\truck_02_chassis_EAF_CO.paa"};
		};
		class GreenHex {
			author = "Bohemia Interactive";
			displayName = "Green Hex";
			textures[] = {"\A3\soft_f_exp\Truck_02\Data\Truck_02_kab_GHEX_co.paa","\A3\soft_f_exp\Truck_02\Data\Truck_02_fuel_GHEX_co.paa","\A3\soft_f_beta\Truck_02\Data\Truck_02_int_co.paa","\A3\Soft_F_Beta\Truck_02\data\truck_02_chassis_OPFOR_CO.paa"};
		};
		class IDAP {
			author = "Bohemia Interactive";
			displayName = "IDAP";
			textures[] = {"\A3\soft_f_orange\Truck_02\Data\Truck_02_kab_IDAP_co.paa","\A3\soft_f_orange\Truck_02\Data\Truck_02_water_IDAP_co.paa","\A3\soft_f_orange\Truck_02\Data\Truck_02_int_IDAP_co.paa"};
		};
		class Indep {
			author = "Bohemia Interactive";
			displayName = "AAF";
			textures[] = {"\A3\soft_f_beta\Truck_02\Data\Truck_02_kab_indp_co.paa","\A3\soft_f_beta\Truck_02\Data\Truck_02_fuel_indp_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
		class Opfor {
			author = "Bohemia Interactive";
			displayName = "OPFOR";
			textures[] = {"\A3\soft_f_beta\Truck_02\Data\Truck_02_kab_opfor_co.paa","\A3\soft_f_beta\Truck_02\Data\Truck_02_fuel_OPFOR_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
		class Orange {
			author = "Bohemia Interactive";
			displayName = "Orange";
			textures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_fuel_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
	};
	textureList[] = {"Blue",1,"EAF",0,"GreenHex",0,"IDAP",0,"Indep",0,"Opfor",0,"Orange",0};
	hiddenSelectionsTextures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_blue_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_fuel_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};

};
class a3a_ION_Truck_02_box_F	:	O_Truck_02_box_F
{

	class TextureSources{
		class BlueGreen {
			author = "Bohemia Interactive";
			displayName = "Blue & Green";
			textures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_blue_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_repair_green_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
		class BlueOrange {
			author = "Bohemia Interactive";
			displayName = "Blue & Orange";
			textures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_blue_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_repair_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
		class EAF {
			author = "Bohemia Interactive";
			displayName = "LDF";
			textures[] = {"\A3\soft_f_Enoch\Truck_02\Data\Truck_02_kab_EAF_co.paa","\A3\soft_f_Enoch\Truck_02\Data\Truck_02_repair_EAF_co.paa","\A3\soft_f_Enoch\Truck_02\Data\Truck_02_int_EAF_co.paa","\A3\soft_f_Enoch\Truck_02\Data\truck_02_chassis_EAF_CO.paa"};
		};
		class GreenHex {
			author = "Bohemia Interactive";
			displayName = "Green Hex";
			textures[] = {"\A3\soft_f_exp\Truck_02\Data\Truck_02_kab_GHEX_co.paa","\A3\soft_f_exp\Truck_02\Data\Truck_02_repair_GHEX_co.paa","\A3\soft_f_beta\Truck_02\Data\Truck_02_int_co.paa","\A3\Soft_F_Beta\Truck_02\data\truck_02_chassis_OPFOR_CO.paa"};
		};
		class Indep {
			author = "Bohemia Interactive";
			displayName = "AAF";
			textures[] = {"\A3\soft_f_beta\Truck_02\Data\Truck_02_kab_indp_co.paa","\A3\soft_f_beta\Truck_02\Data\Truck_02_repair_indp_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
		class Opfor {
			author = "Bohemia Interactive";
			displayName = "OPFOR";
			textures[] = {"\A3\soft_f_beta\Truck_02\Data\Truck_02_kab_opfor_co.paa","\A3\soft_f_beta\Truck_02\Data\Truck_02_repair_OPFOR_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
		class OrangeGreen {
			author = "Bohemia Interactive";
			displayName = "Orange & Green";
			textures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_repair_green_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
		class OrangeOrange {
			author = "Bohemia Interactive";
			displayName = "Orange";
			textures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_repair_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
	};
	textureList[] = {"BlueGreen",1,"BlueOrange",0,"EAF",0,"GreenHex",0,"Opfor",0,"OrangeGreen",0,"OrangeOrange",0};
	hiddenSelectionsTextures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_blue_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_repair_green_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};

};
class a3a_ION_Truck_02_transport_F	:	O_Truck_02_transport_F
{

	class TextureSources{
		class Blue {
			author = "Bohemia Interactive";
			displayName = "Blue";
			textures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_blue_CO.paa","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
		class EAF {
			author = "Bohemia Interactive";
			displayName = "LDF";
			textures[] = {"\A3\soft_f_Enoch\Truck_02\Data\Truck_02_kab_EAF_co.paa","\A3\soft_f_Enoch\Truck_02\Data\Truck_02_kuz_EAF_co.paa","\A3\soft_f_Enoch\Truck_02\Data\Truck_02_int_EAF_co.paa","\A3\soft_f_Enoch\Truck_02\Data\truck_02_chassis_EAF_CO.paa"};
		};
		class GreenHex {
			author = "Bohemia Interactive";
			displayName = "Green Hex";
			textures[] = {"\A3\soft_f_exp\Truck_02\Data\Truck_02_kab_GHEX_co.paa","\A3\soft_f_exp\Truck_02\Data\Truck_02_kuz_GHEX_co.paa","\A3\soft_f_beta\Truck_02\Data\Truck_02_int_co.paa","\A3\Soft_F_Beta\Truck_02\data\truck_02_chassis_OPFOR_CO.paa"};
		};
		class IDAP {
			author = "Bohemia Interactive";
			displayName = "IDAP";
			textures[] = {"\A3\soft_f_orange\Truck_02\Data\Truck_02_kab_IDAP_co.paa","\A3\soft_f_orange\Truck_02\Data\Truck_02_kuz_IDAP_co.paa","\A3\soft_f_orange\Truck_02\Data\Truck_02_int_IDAP_co.paa"};
		};
		class Indep {
			author = "Bohemia Interactive";
			displayName = "AAF";
			textures[] = {"\A3\soft_f_beta\Truck_02\Data\Truck_02_kab_indp_co.paa","\A3\soft_f_beta\Truck_02\Data\Truck_02_kuz_indp_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
		class Opfor {
			author = "Bohemia Interactive";
			displayName = "OPFOR";
			textures[] = {"\A3\soft_f_beta\Truck_02\Data\Truck_02_kab_opfor_co.paa","\A3\soft_f_beta\Truck_02\Data\Truck_02_kuz_OPFOR_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
		class Orange {
			author = "Bohemia Interactive";
			displayName = "Orange";
			textures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
	};
	textureList[] = {"Blue",1,"EAF",0,"GreenHex",0,"IDAP",0,"Indep",0,"Opfor",0,"Orange",0};
	hiddenSelectionsTextures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_blue_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
};
class a3a_ION_Truck_02_covered_F	:	O_Truck_02_covered_F
{
	class TextureSources{
		class BlueBlue{
			author = "Bohemia Interactive";
			displayName = "Blue";
			textures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_blue_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
		class BlueOlive{author = "Bohemia Interactive";
			displayName = "Blue & Olive";
			textures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_blue_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_olive_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
		class EAF{author = "Bohemia Interactive";
			displayName = "LDF";
			textures[] = {"\A3\soft_f_Enoch\Truck_02\Data\Truck_02_kab_EAF_co.paa","\A3\soft_f_Enoch\Truck_02\Data\Truck_02_kuz_EAF_co.paa","\A3\soft_f_Enoch\Truck_02\Data\Truck_02_int_EAF_co.paa","\A3\soft_f_Enoch\Truck_02\Data\truck_02_chassis_EAF_CO.paa"};
		};
		class GreenHex{author = "Bohemia Interactive";
			displayName = "Green Hex";
			textures[] = {"\A3\soft_f_exp\Truck_02\Data\Truck_02_kab_GHEX_co.paa","\A3\soft_f_exp\Truck_02\Data\Truck_02_kuz_GHEX_co.paa","\A3\soft_f_beta\Truck_02\Data\Truck_02_int_co.paa","\A3\Soft_F_Beta\Truck_02\data\truck_02_chassis_OPFOR_CO.paa"};
		};
		class IDAP{author = "Bohemia Interactive";
			displayName = "IDAP";
			textures[] = {"\A3\soft_f_orange\Truck_02\Data\Truck_02_kab_IDAP_co.paa","\A3\soft_f_orange\Truck_02\Data\Truck_02_kuz_IDAP_co.paa","\A3\soft_f_orange\Truck_02\Data\Truck_02_int_IDAP_co.paa"};
		};
		class Indep{author = "Bohemia Interactive";
			displayName = "AAF";
			textures[] = {"\A3\soft_f_beta\Truck_02\Data\Truck_02_kab_indp_co.paa","\A3\soft_f_beta\Truck_02\Data\Truck_02_kuz_indp_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
		class Opfor{author = "Bohemia Interactive";
			displayName = "OPFOR";
			textures[] = {"\A3\soft_f_beta\Truck_02\Data\Truck_02_kab_opfor_co.paa","\A3\soft_f_beta\Truck_02\Data\Truck_02_kuz_OPFOR_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
		class OrangeBlue{author = "Bohemia Interactive";
			displayName = "Orange & Blue";
			textures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
		class OrangeOlive{author = "Bohemia Interactive";
			displayName = "Orange & Olive";
			textures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_olive_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
	};
	textureList[] = {"EAF",0,"GreenHex",0,"Indep",0,"Opfor",0,"OrangeBlue",0,"OrangeOlive",0,"BlueBlue",0,"BlueOlive",1};
	hiddenSelectionsTextures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_blue_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_olive_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
};
class a3a_ION_Truck_02_medical_F	:	O_Truck_02_medical_F
{

	class TextureSources{
		class BlueBlue{
			author = "Bohemia Interactive";
			displayName = "Blue";
			textures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_blue_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
		class BlueOlive{author = "Bohemia Interactive";
			displayName = "Blue & Olive";
			textures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_blue_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_olive_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
		class EAF{author = "Bohemia Interactive";
			displayName = "LDF";
			textures[] = {"\A3\soft_f_Enoch\Truck_02\Data\Truck_02_kab_EAF_co.paa","\A3\soft_f_Enoch\Truck_02\Data\Truck_02_kuz_EAF_co.paa","\A3\soft_f_Enoch\Truck_02\Data\Truck_02_int_EAF_co.paa","\A3\soft_f_Enoch\Truck_02\Data\truck_02_chassis_EAF_CO.paa"};
		};
		class GreenHex{author = "Bohemia Interactive";
			displayName = "Green Hex";
			textures[] = {"\A3\soft_f_exp\Truck_02\Data\Truck_02_kab_GHEX_co.paa","\A3\soft_f_exp\Truck_02\Data\Truck_02_kuz_GHEX_co.paa","\A3\soft_f_beta\Truck_02\Data\Truck_02_int_co.paa","\A3\Soft_F_Beta\Truck_02\data\truck_02_chassis_OPFOR_CO.paa"};
		};
		class Indep{author = "Bohemia Interactive";
			displayName = "AAF";
			textures[] = {"\A3\soft_f_beta\Truck_02\Data\Truck_02_kab_indp_co.paa","\A3\soft_f_beta\Truck_02\Data\Truck_02_kuz_indp_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
		class Opfor{author = "Bohemia Interactive";
			displayName = "OPFOR";
			textures[] = {"\A3\soft_f_beta\Truck_02\Data\Truck_02_kab_opfor_co.paa","\A3\soft_f_beta\Truck_02\Data\Truck_02_kuz_OPFOR_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
		class OrangeBlue{author = "Bohemia Interactive";
			displayName = "Orange & Blue";
			textures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
		class OrangeOlive{author = "Bohemia Interactive";
			displayName = "Orange & Olive";
			textures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_olive_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
		};
	};
	textureList[] = {"EAF",0,"GreenHex",0,"Indep",0,"Opfor",0,"OrangeBlue",0,"OrangeOlive",0,"BlueBlue",0,"BlueOlive",1};
	hiddenSelectionsTextures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_blue_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_olive_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
};