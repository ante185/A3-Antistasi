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
                loadout[] = {"sab_wwi_4rnd_mkii_mag","sab_wwi_4rnd_mkii_mag"};
                mainGun[] = {"sab_wwi_1xvickers_weapon"};
                //Dive bombing requirements
                bombRacks[] = {"sab_wwi_bomb_weapon"};
                diveParams[] = {};
            };
            class sab_camel_b : sab_brisfit {
                loadout[] = {"sab_wwi_4rnd_mkii_mag"};
                mainGun[] = {"sab_wwi_2xvickers_weapon"};
            };
            class sab_camel_o : sab_camel_b {};
            class sab_vimy2 : sab_brisfit {
                loadout[] = {"sab_wwi_1rnd_hbomb_mag","sab_wwi_1rnd_hbomb_mag","sab_wwi_1rnd_hbomb_mag","sab_wwi_1rnd_hbomb_mag","sab_wwi_1rnd_hbomb_mag","sab_wwi_1rnd_hbomb_mag","sab_wwi_1rnd_hbomb_mag","sab_wwi_1rnd_hbomb_mag"};
                mainGun[] = {};
                //Dive bombing requirements
                //diveParams[] = {}; 
            };
            
            class sab_gotha : sab_brisfit {
                loadout[] = {};
            };
        };
        class CAPPlane
        {
            class baseCAP;
            class sab_se5a : baseCAP {
                loadout[] = {};
            };
            class sab_aircodh2 : sab_se5a {
                loadout[] = {};
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
