#include "..\..\..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(AirLoadout_SAB_FC) {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","sab_flyingcircus"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};
class CfgAmmo {
    class Rocket_04_HE_F;
    class sab_leprieur_ammo : Rocket_04_HE_F {
        timeToLive = 10;
        indirectHitRange = 4;
        caliber = 2;
        whistleDist = 120;
        whistleOnFire = 1;
    };
};

class A3A {
    class Loadouts
    {
        class CASPlane
        {
            class baseCAS;
            class sab_be2 : baseCAS {
                //Pylons
                loadout[] = {"","","sab_1rnd_leprieur_mag","sab_1rnd_leprieur_mag"};
                //Weapons
                mainGun[] = {};
                rocketLauncher[] = {"sab_wwi_rocket_weapon"};
            };
            class sab_curtissjn4 : sab_be2 {};
            class sab_aircodh2 : sab_be2 {
                loadout[] = {"sab_1rnd_leprieur_mag","sab_1rnd_leprieur_mag"};
                mainGun[] = {"sab_wwi_1xlewis_weapon"};
            };
            class sab_brisfit : baseCAS { 
                //Falls out the sky on CAS calls??
                loadout[] = {"sab_wwi_1rnd_hbomb_mag","sab_wwi_1rnd_hbomb_mag"};
                mainGun[] = {"sab_wwi_1xvickers_weapon"};
                //Dive bombing requirements
                diveParams[] = {320, 200, 30, 60, 15, {27.5, 1}};
                bombRacks[] = {"sab_wwi_bomb_weapon"};
            };
            class sab_camel_b : sab_brisfit {
                loadout[] = {"sab_wwi_1rnd_hbomb_mag"};
                mainGun[] = {"sab_wwi_2xvickers_weapon"};
                diveParams[] = {350, 150, 30, 60, 15, {20, 0}};
            };
            class sab_vimy2 : sab_brisfit {
                loadout[] = {"sab_wwi_1rnd_hbomb_mag","sab_wwi_1rnd_hbomb_mag","sab_wwi_1rnd_hbomb_mag","sab_wwi_1rnd_hbomb_mag","sab_wwi_1rnd_hbomb_mag","sab_wwi_1rnd_hbomb_mag","sab_wwi_1rnd_hbomb_mag","sab_wwi_1rnd_hbomb_mag"};
                mainGun[] = {};
                diveParams[] = {400, 300, 30, 60, 15, {64, 0}}; 
            };
            
            class sab_camel_o : sab_camel_b {
            };
            class sab_gotha : sab_vimy2 {
                loadout[] = {"sab_wwi_1rnd_hbomb_mag","sab_wwi_1rnd_hbomb_mag","sab_wwi_1rnd_hbomb_mag","sab_wwi_1rnd_hbomb_mag","sab_wwi_1rnd_hbomb_mag","sab_wwi_1rnd_hbomb_mag","sab_wwi_1rnd_hbomb_mag","sab_1rnd_leprieur_mag",""};
                rocketLauncher[] = {"sab_wwi_rocket_weapon"};
                diveParams[] = {400, 300, 30, 60, 15, {65, 0}}; 
            };
            class sab_junkers : sab_be2 {
                loadout[] = {"sab_1rnd_leprieur_mag","sab_1rnd_leprieur_mag"};
                mainGun[] = {"sab_wwi_2xmg0815_weapon"};
            };
        };
        class CAPPlane
        {
            class baseCAP;
            class sab_se5a : baseCAP {
                loadout[] = {};
            };
            class sab_aircodh2 : sab_se5a {
                loadout[] = {"sab_1rnd_leprieur_mag","sab_1rnd_leprieur_mag"};
            };
            class sab_brisfit : sab_se5a {};
            class sab_camel_b : sab_se5a {};
            class sab_pup : sab_se5a {};
            class sab_spadvii : sab_se5a {};

            class sab_camel_o : sab_camel_b {};
            class sab_albatrosbc1 : sab_se5a {};
            class sab_albatrosbc2 : sab_se5a {};
            class sab_fokkerdii : sab_se5a {};
            class sab_fokkervii : sab_se5a {};
            class sab_fokkereiii : sab_se5a {};
            class sab_pfalzxii : sab_se5a {};
            class sab_junkers : sab_se5a {};
        };
    };
};
