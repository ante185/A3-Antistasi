
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
class cfgAmmo {
    class LIB_B_20x110_AP;
    class LIB_B_20x110_AA;
    class a3a_LIB_20mmMixed : LIB_B_20x110_AP{
        submunitionAmmo[] = {"LIB_B_20x110_AP",1,"LIB_B_20x110_AA",0.5};
        submunitionConeAngle = 0;
        submunitionConeAngleHorizontal = 0;
        triggerTime = 0.0001;
    };
    class B_12Gauge_Pellets_Submunition;
    class a3a_410_Submunition : B_12Gauge_Pellets_Submunition {
        submunitionConeAngle = 0.5;
        submunitionConeType[] = {"poissondisc",5};
    };
    class B_12Gauge_Slug_NoCartridge;
    class a3a_410_Slug : B_12Gauge_Slug_NoCartridge {
        caliber = 1;
        hit = 12;
    };
    class LIB_B_145x144_Ball;
    class a3a_13mm_HE : LIB_B_145x144_Ball{
        aiAmmoUsageFlags = "64 + 128 + 256";
        explosionEffects = "LIB_ImpactMetal";
        craterEffects = "LIB_ImpactMetal";
        explosive = 0.8;
        hit = 12;
        indirectHit = 0.5;
        indirectHitRange = 5;
    };
    class a3a_13mm_HE_Submunition : a3a_13mm_HE{
        hit = 6;
        indirectHit = 0.2;
        indirectHitRange = 2;
        explosionTime = 0.03;
    };
    class a3a_13mm_AP : LIB_B_145x144_Ball{
        aiAmmoUsageFlags = "64 + 128 + 256 + 512";
        hit = 18;
        caliber = "(70 /((15 * 1114)/1000))";
    };
    class a3a_13mm_Ball : LIB_B_145x144_Ball{
        aiAmmoUsageFlags = "64 + 128 + 256";
        craterEffects = "LIB_Impact_Flame";
        hit = 12;
        caliber = "(35 /((15 * 1114)/1000))";
    };
    class a3a_13mm_APHE : a3a_13mm_AP{
        aiAmmoUsageFlags = "64 + 128 + 256";
        caliber = "(55 /((15 * 1114)/1000))";
        craterEffects = "LIB_ImpactMetal";
        hit = 12;
        submunitionAmmo = "a3a_13mm_HE_Submunition";
        triggerOnImpact = true;
        deleteParentWhenTriggered = false;
        submunitionInitialOffset[] = { 0, 0, 0.2};
    };
    class a3a_13mm_mix : LIB_B_145x144_Ball{
        aiAmmoUsageFlags = "64 + 128 + 256 + 512";
        submunitionAmmo[] = {"a3a_13mm_Ball",4,"a3a_13mm_HE",2,"a3a_13mm_AP",1,"a3a_13mm_APHE",1};
        triggerTime  = 0.0001;
        deleteParentWhenTriggered = true;
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
    class LIB_60x_OerlikonAP;
    class a3a_LIB_10x_20mmMixed : LIB_60x_OerlikonAP{
        ammo = "a3a_LIB_20mmMixed";
        count = 11;
        displayName = "20mm HE/AP Mix";
        maxLeadSpeed = 60;
        tracersEvery=1;
    };
    class 2Rnd_12Gauge_Pellets;
    class a3a_1Rnd_410_Pellets : 2Rnd_12Gauge_Pellets {
        modelSpecial = "";
        displayName = "1Rnd .410 #00 Buck"
        descriptionShort = ".410 Pellets for police and civilian use";
        ammo = "a3a_410_Submunition";
        count = 1;
    }
    class 2Rnd_12Gauge_Slug;
    class a3a_1Rnd_410_Slug : 2Rnd_12Gauge_Slug {
        modelSpecial = "";
        displayName = "1Rnd .410 Slug"
        descriptionShort = ".410 Slug for police and civilian use";
        ammo = "a3a_410_Slug";
        count = 1;
    };
    class LIB_1Rnd_145x114;
    class a3a_1Rnd_13mm_AP : LIB_1Rnd_145x114 {
        ammo = "a3a_13mm_AP";
        descriptionShort = "Caliber: 13.2x92mmSR <br />Projectile: AP<br />Rounds: 1<br />Type: Loose Cartridge<br />Used in: TAG 19";
        displayName = "13.2x92mmSR 1Rnd AP";
        displayNameShort = "AP";
        lastRoundsTracer = 0;
    };
    class a3a_1Rnd_13mm_Ball : a3a_1Rnd_13mm_AP {
        ammo = "a3a_13mm_Ball";
        descriptionShort = "Caliber: 13.2x92mmSR <br />Projectile: Ball Tracer<br />Rounds: 1<br />Type: Loose Cartridge<br />Used in: TAG 19";
        displayName = "13.2x92mmSR 1Rnd Tracer";
        displayNameShort = "T";
        lastRoundsTracer = 1;
    };
    class a3a_1Rnd_13mm_APHE : a3a_1Rnd_13mm_Ball {
        ammo = "a3a_13mm_APHE";
        descriptionShort = "Caliber: 13.2x92mmSR <br />Projectile: SAP<br />Rounds: 1<br />Type: Loose Cartridge<br />Used in: TAG 19";
        displayName = "13.2x92mmSR 1Rnd SAP";
        displayNameShort = "SAP";
    };
    class a3a_1Rnd_13mm_HE : a3a_1Rnd_13mm_Ball {
        ammo = "a3a_13mm_HE";
        descriptionShort = "Caliber: 13.2x92mmSR <br />Projectile: HEI<br />Rounds: 1<br />Type: Loose Cartridge<br />Used in: TAG 19";
        displayName = "13.2x92mmSR 1Rnd HEI";
        displayNameShort = "HE";
    };
};

class CfgWeapons {
    class Rifle_Base_F;
    class wwi_berthier : Rifle_Base_F{
        magazines[] = {"a3a_WWI_5Rnd_Berthier"};
    };
    class LIB_Oerlikon_1;
    class a3a_ww1_20mm_autocannon : LIB_Oerlikon_1 {
        displayName = "20mm Mle 1917";
        initSpeed = -0.3; //30% initial speed, very high arcing round
        magazines[] = {"a3a_LIB_10x_20mmMixed"};
    };
    class wwi_SMGBASE;
    class wwi_mp18 : wwi_SMGBASE {
        magazines[] = {"WWI_9mm_32xMP18", "WWI_9_MM_32xMP18", "WWI_9mm_8xLuger"};
    };
    class wwi_Pistol;
    class wwi_p08 : wwi_Pistol{
        magazines[] = {"WWI_9mm_8xLuger", "WWI_9_MM_32xMP18", "WWI_9mm_32xMP18"};
    };
    class wwi_p082 : wwi_p08 {
        magazines[] = {"WWI_9mm_32xMP18", "WWI_9_MM_32xMP18", "WWI_9mm_8xLuger"};
    }
    class wwi_lp08;
    class wwi_lp082 : wwi_lp08 {
        magazines[] = {"WWI_9mm_32xMP18", "WWI_9_MM_32xMP18", "WWI_9mm_8xLuger"};
    };
    class wwi_g98i;
    class wwi_g98iii : wwi_g98i {
        magazines[] = {"wwi_7_92_25xMauser","wwi_7_92_5xMauser"};
    };
    class wwi_g98iv : wwi_g98i {
        magazines[] = {"wwi_7_92_25xMauser","wwi_7_92_5xMauser"};
    };
    class wwi_enfield;
    class a3a_wwi_enfield_410 : wwi_enfield{
        maxRange = 150;
        magazineReloadTime = 2;
        displayName = "LeeEnfield .410 Smoothbore"
        descriptionShort = "Lee-Enfield No.1 Mk III converted to a single shot shotgun";
        drySound[] = {"A3\Sounds_F_Enoch\Assets\Arsenal\HunterShotgun_01\HunterShotgun_01_Shot_Dry_01",0.501187,1,10};
        recoil = "recoil_huntershotgun_01";
        discreteDistance[] = {91.44};
        discreteDistanceInitIndex = 0;
        fireSpreadAngle = 0.95;
        magazines[] = {"a3a_1Rnd_410_Pellets","a3a_1Rnd_410_Slug"};
        magazineWell[] = {};
        reloadAction = "LIB_GestureReloadM1903A1";
    };
    class LIB_PTRD;
    class a3a_LIB_wwi_antitank : LIB_PTRD {
        displayName = "TAG 19";
        descriptionShort = "13mm Tankabwehrgewehr, Simplified in 1919";
        magazines[] = {"a3a_1Rnd_13mm_AP","a3a_1Rnd_13mm_Ball","a3a_1Rnd_13mm_APHE","a3a_1Rnd_13mm_HE"};
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
    class wwi_ft17_2018 : wwi_ft17 {
        class Turrets;
    };
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

    class wwi_ft17_8mm_girod : wwi_ft17_2018 {
        class Turrets : Turrets {
            class MainTurret;
        };
    };
    class a3a_wwi_ft17_20mm : wwi_ft17_8mm_girod {
        displayName = "FT17 20mm";
        class Turrets : Turrets {
            class MainTurret : MainTurret{
                magazines[] = {"a3a_LIB_10x_20mmMixed","a3a_LIB_10x_20mmMixed","a3a_LIB_10x_20mmMixed","a3a_LIB_10x_20mmMixed","a3a_LIB_10x_20mmMixed","a3a_LIB_10x_20mmMixed","a3a_LIB_10x_20mmMixed","a3a_LIB_10x_20mmMixed","a3a_LIB_10x_20mmMixed","a3a_LIB_10x_20mmMixed","a3a_LIB_10x_20mmMixed"};
                weapons[] = {"a3a_ww1_20mm_autocannon"};
            };
        };
    };
};