
#include "..\script_component.hpp"

class CfgPatches 
{
    class PATCHNAME(WW1) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","WWI_weapons"};
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

class CfgVehicles {
    class O_MBT_02_base_F;
    class wwi_ft17 : O_MBT_02_base_F{
        class complexGearbox;
        differentialType = "all_limited";
        // https://community.bistudio.com/wiki/Arma_3:_Vehicle_Handling_Configuration#maxOmega
        //General
        accelAidForceCoef = 2;
        accelAidForceSpd = 16; // M/S
        accelAidForceYOffset = -2;
        maxSpeed = 32; // KM/H
        normalSpeedForwardCoef = 0.7;
        slowSpeedForwardCoef = 0.2;
        //Engine
        enginePower = 240; //Power of the engine in kW.
        maxOmega = 809.44; //This is the maximum rotational speed of the engine expressed in radians per second. It could be calculated from maximum engine RPM like this:     maxOmega = (maxRpm * 2 * Pi) / 60
        minOmega = 34.72;
        peakTorque = 6254;
        tankTurnForce = 225000;
        terrainCoef = 1;
    };
    class wwi_ft17_2018 : wwi_ft17 {};
    class wwi_schneider_ca1 : wwi_ft17_2018 {
        class complexGearbox : complexGearbox {
            GearboxRatios[] = {"R2",-14,"N",0,"D1",4,"D2",3.1,"D3",2.6,"D4",1.47,"D5",1.33};
        };
        //General
        accelAidForceCoef = 4;
        accelAidForceSpd = 16; // M/S
        accelAidForceYOffset = -2;
        maxSpeed = 30; // KM/H
        normalSpeedForwardCoef = 0.7;
        slowSpeedForwardCoef = 0.2;
        //Engine
        enginePower = 240;
        maxOmega = 809.44; 
        minOmega = 34.72;
        peakTorque = 6254;
        tankTurnForce = 225000;
        terrainCoef = 1;
    };
    class wwi_MarkIMale : wwi_ft17 {
        class complexGearbox : complexGearbox {
            GearboxRatios[] = {"R2",-14,"N",0,"D1",5,"D2",4.1,"D3",3.6,"D4",1.77,"D5",1.53};
        };
        accelAidForceCoef = 2;
        accelAidForceSpd = 10; // M/S
        maxSpeed = 25; // KM/H
        enginePower = 300;
        peakTorque = 6254;
        tankTurnForce = 225000;
        terrainCoef = 1;
    };
};