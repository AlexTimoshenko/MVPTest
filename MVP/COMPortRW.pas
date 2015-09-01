unit COMPortRW;

interface

uses
    CPDrv,
    COMPortRWIntf;

type

    TCOMPortRW = class(TObject, IUnknown, ICOMPortRWInterface)
    private
        FCpDrv: TCommPortDriver;

        // IUnknown
        function _AddRef: Integer; stdcall;
        function _Release: Integer; stdcall;
        function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    public
        constructor Create;
        destructor  Destroy; override;

        procedure SetConfig(aPort: Cardinal; aRate: Cardinal);
        procedure Connect;
        procedure Disconnect;
        function  GetConnectedState: boolean;
        procedure Send(aValue: Byte);
    end;


implementation

uses
    SysUtils;

{ TCOMPortRW }

constructor TCOMPortRW.Create;
begin
    FCpDrv := TCommPortDriver.Create(nil);
end;

destructor TCOMPortRW.Destroy;
begin
    FCpDrv.Free;

    inherited;
end;

procedure TCOMPortRW.Connect;
begin
    FCpDrv.Connect;
end;

procedure TCOMPortRW.Disconnect;
begin
    FCpDrv.Disconnect;
end;

function TCOMPortRW.GetConnectedState: boolean;
begin
    Result := FCpDrv.Connected;
end;

function TCOMPortRW._AddRef: Integer;
begin
    Result := -1;
end;

function TCOMPortRW._Release: Integer;
begin
    Result := -1;
end;

function TCOMPortRW.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
    if GetInterface(IID, Obj) then
        Result := S_OK
    else
        Result := E_NOINTERFACE;
end;

procedure TCOMPortRW.Send(aValue: Byte);
begin
    FCpDrv.SendByte(aValue);
end;

procedure TCOMPortRW.SetConfig(aPort, aRate: Cardinal);
begin
    FCpDrv.PortName := '\\.\COM' + IntToStr(aPort);
    FCpDrv.BaudrateValue := aRate;
end;

end.
