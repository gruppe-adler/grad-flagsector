#include "..\..\component.hpp"

params ["_flag", "_flagOwner"];

private _side = side _flagOwner;

switch (_side) do {
    case (west): {
        _flag setFlagTexture ""; // todo texture
    };
    case (east): {
        _flag setFlagTexture "";
    };
    case (independent): {
        _flag setFlagTexture "";
    };
    case (civilian): {
        _flag setFlagTexture "";
    };
    default {};
};


_flag setVariable [QGVAR(sectorOwner), _side];
_flag setFlagOwner objNull; // to return flag to flagpole

[_flag] call grad_flagsector_fnc_flagListener; // restart loop
