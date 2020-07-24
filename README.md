# grad-flagsector

sector control implementation

based on McDiods [TvT Template](https://github.com/gruppe-adler/TvT_Template.VR/tree/master/functions) but standalone and with flags

might be merged into template later on as it tries to be non-destructive

## dependencies

* https://github.com/gruppe-adler/grad-points

# Configuration

in the description.ext add the following to define custom flag textures for each side
default is `"\A3\Data_F\Flags\Flag_red_CO.paa"`

```sqf
class cfgGradSectors {
    flagTextureBlufor = "";
    flagTextureOpfor = "\A3\Data_F\Flags\Flag_red_CO.paa";
    flagTextureIndependent = "\A3\Data_F\Flags\Flag_CSAT_CO.paa";
    flagTextureCivilian = "";
};
```

## Create Sector
Size and position of a sectors is defined with a Trigger. Alle settings of the Trigger are kept besides size and form. Then an Area Entity is created (*Systems >> Logic Entities >> Locations >> Area*) and synced with all Triggers which should get the same sector settings.

![](http://i.imgur.com/x1Bd2qv.png)

## Add Function
Now we doubleclick the Area Entity and fill the init field with the `createSector` function:

### Syntax

```sqf
[area,sector name,reward,reward per second,lock after capture,capture sides,owner,notify,onsectorcaptured,sectordata,capturemode] call grad_sectors_fnc_createSector
```

### Parameter

Parameter | Erklärung
----------|-----------
area | object - Area Entity (in init field the variable `this`)
sector name | string (optional) - name of the sector (default: `""`)
reward | number (optional) - amount of points a side gets for taking the point (default: `1`)
reward per second | number (optional) - amount of points a side gets for holding the point PER SECOND. (default: `0`)
lock after capture | bool (optional) - if the sector can be reconquered (default: `false`)
capture sides | array (optional) - sides that can conquer the sector (default: `[WEST,EAST,INDEPENDENT]`)
owner | side (optional) - side that holds the sector at game start. (default: `sideUnknown`)
notify | boolean (optional) - if a hint is displayed to all players when sector is taken
onsectorcaptured | code (optional) - custom code executed when sector is taken. Params are `[_trigger,_newOwner,_oldOwner]`
sectordata | string - (optional) - can be used to write data into the sector, gets added as `setVariable "grad_sectors_sectordata"`
capturemode | [number(,number - only for capture mode 1)] - 0/1/2 == capture mode,  strength/time, 0-9999 captureTime

### Example

```sqf
[this,"fuelstation",10,0,true,[WEST,EAST],independent, true, {}, "", [1,10]] call grad_sectors_fnc_createSector;
```

![](http://i.imgur.com/nsb4yyx.png)
