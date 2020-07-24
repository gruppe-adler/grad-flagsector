#include "..\component.hpp"

private _cfg = missionConfigFile >> "cfgGradSectors";

_flagTextureBlufor = [_cfg,"flagTextureBlufor","\A3\Data_F\Flags\Flag_red_CO.paa"] call BIS_fnc_returnConfigEntry;
_flagTextureOpfor = [_cfg,"flagTextureOpfor","\A3\Data_F\Flags\Flag_red_CO.paa"] call BIS_fnc_returnConfigEntry;
_flagTextureIndependent = [_cfg,"flagTextureIndependent","\A3\Data_F\Flags\Flag_red_CO.paa"] call BIS_fnc_returnConfigEntry;
_flagTextureCivilian = [_cfg,"flagTextureCivilian","\A3\Data_F\Flags\Flag_red_CO.paa"] call BIS_fnc_returnConfigEntry;

missionNamespace setVariable [QGVAR(flagTextureBlufor), _flagTextureBlufor];
missionNamespace setVariable [QGVAR(flagTextureOpfor), _flagTextureOpfor];
missionNamespace setVariable [QGVAR(flagTextureIndependent), _flagTextureIndependent];
missionNamespace setVariable [QGVAR(flagTextureCivilian), _flagTextureCivilian];
