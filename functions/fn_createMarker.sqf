#include "..\component.hpp"

params ["_trigger", "_isFlagSector"];

if (_isFlagSector) exitWith {
  _marker = createMarker [format ["sectorMarker_%1",getPos _trigger],getPos _trigger];
  _marker setMarkerShape "Icon";
  _marker setMarkerType "hd_flag";

  _trigger setVariable ["grad_sector_sectorMarker",_marker];
};

(triggerArea _trigger) params ["_a","_b","_angle","_isRectangle"];

_marker = createMarker [format ["sectorMarker_%1",getPos _trigger],getPos _trigger];
_marker setMarkerBrush "DiagGrid";
_marker setMarkerShape (if (_isRectangle) then {"RECTANGLE"} else {"ELLIPSE"});
_marker setMarkerDir _angle;
_marker setMarkerSize [_a,_b];

_trigger setVariable ["grad_sector_sectorMarker",_marker];
