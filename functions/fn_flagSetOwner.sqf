#include "..\component.hpp"

params ["_flag", "_flagOwner"];

private _side = side _flagOwner;
private _texture = "";

switch (_side) do {
    case (west): {
        _texture = missionNamespace getVariable [QGVAR(flagTextureBlufor), ""];
    };
    case (east): {
        _texture = missionNamespace getVariable [QGVAR(flagTextureOpfor), ""];
    };
    case (independent): {
        _texture = missionNamespace getVariable [QGVAR(flagTextureIndependent), ""];
    };
    case (civilian): {
        _texture = missionNamespace getVariable [QGVAR(flagTextureCivilian), ""];
    };
    default {};
};
_flag setFlagTexture _texture;

_flag setVariable [QGVAR(sectorOwner), _side];
_flag setFlagOwner objNull; // to return flag to flagpole

[_flag] call grad_sector_fnc_flagListener; // restart loop
