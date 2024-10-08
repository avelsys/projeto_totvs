unit Server.Classes.Helpers;

interface

uses
  System.JSON;

type
  TJSONObjectHelper = class helper for TJSONObject
  public
    function IsEmpty: Boolean;
  end;

implementation

{ TJSONObjectHelper }

function TJSONObjectHelper.IsEmpty: Boolean;
begin
  Result := Self.Count = 0;
end;

end.
