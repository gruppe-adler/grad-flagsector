params ["_sector", "_side"];

private _classname = switch (_side) do {
    case (west): {
        "Flag_Blue_F"
    };
    case (east): {
        "Flag_Red_F"
    };
    case (independent): {
        "Flag_Green_F"
    };
    case (civilian): {
        "Flag_Blue_F"
    };
    default {
        "Flag_FIA_F"
    };
};

private _flag = _classname createVehicle [0,0,0];
_flag setPos (getPos _sector);

_flag setFlagOwner _side;
_flag setFlagSide _side;

[_flag, _side] call grad_flagsector_fnc_flagLoop:
