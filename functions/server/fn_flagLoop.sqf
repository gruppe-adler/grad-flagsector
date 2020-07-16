params ["_flag", "_side"];


[{
    params ["_flag", "_side"];

    !isNull (flagOwner _flag)
},{
    params ["_flag", "_side"];

    [_flag, flagOwner _flag] call grad_flagsector_fnc_flagSetOwner;
}, [_flag, _side]] call CBA_fnc_waitUntilAndExecute;
