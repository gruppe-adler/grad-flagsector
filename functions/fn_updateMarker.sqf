#include "..\component.hpp"

params ["_trigger"];

private _owner = _trigger getVariable ["grad_sector_currentOwner",sideUnknown];
private _color = switch (_owner) do {
    case (WEST): {"COLORWEST"};
    case (EAST): {"COLOREAST"};
    case (INDEPENDENT): {"COLORGUER"};
    default {"COLORBLACK"};
};

(_trigger getVariable "grad_sector_sectorMarker") setMarkerColor _color;
