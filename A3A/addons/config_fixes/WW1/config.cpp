
#include "..\script_component.hpp"

class CfgPatches 
{
    class PATCHNAME(WW1) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","A3_Map_Tembelan"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

class CfgMagazines {
    class WWI_9mm_32xMP18;
    class WWI_9_MM_32xMP18 : WWI_9mm_32xMP18{};
    class WWI_8mmx8lebel;
    class a3a_WWI_5Rnd_Berthier : WWI_8mmx8lebel{
        count = 5;
        displayName = "Berthier 5 round clip";
    };
};

class CfgWeapons {
    class Rifle_Base_F;
    class wwi_berthier : Rifle_Base_F{
        magazines[] = {"a3a_WWI_5Rnd_Berthier"};
    };
};
