#include "..\..\component.hpp"

params ["_flag"];

[{
    params ["_flag"];

    !isNull (flagOwner _flag)
},{
    params ["_flag"];

    [_flag, flagOwner _flag] call grad_flagsector_fnc_flagSetOwner;
}, [_flag]] call CBA_fnc_waitUntilAndExecute;
