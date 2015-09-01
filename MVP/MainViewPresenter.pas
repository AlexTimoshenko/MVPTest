unit MainViewPresenter;

interface

uses
    COMPortRWIntf,
    MainViewIntf,
    MainViewPresenterIntf;

type

    TMainViewPresenter = class(TObject, IUnknown, IMainViewPresenterInterface)
    private
        FModel: ICOMPortRWInterface;
        FView: IMainViewInterface;

        FPort: Cardinal;
        FRate: Cardinal;

        // IUnknown
        function _AddRef: Integer; stdcall;
        function _Release: Integer; stdcall;
        function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    public
        constructor Create;
        destructor  Destroy; override;

        procedure Config;
        procedure Connect;
        procedure Disconnect;
        function  Connected: boolean;
        procedure Send(aValue: Byte);

        procedure SetModel(aModel: ICOMPortRWInterface);
        procedure SetView(aView: IMainViewInterface);
    end;


implementation

uses
    CpConfigDialog,
    SysUtils;

{ TMainUnitPresenter }

constructor TMainViewPresenter.Create;
begin
    FView  := nil;
    FModel := nil;

    FPort := 1;
    FRate := 9600;
end;

destructor TMainViewPresenter.Destroy;
begin

    inherited;
end;

procedure TMainViewPresenter.Config;
var
    dlg: TdlgCpConfig;
begin
    dlg := TdlgCpConfig.Create(nil);

    if dlg.Execute(FPort, FRate) then
    begin
        FPort := dlg.Port;
        FRate := dlg.Rate;

        FModel.SetConfig(FPort, FRate);

        Connect;
    end;

    dlg.Free;
end;

procedure TMainViewPresenter.Connect;
begin
    FModel.Connect;

    if FModel.GetConnectedState then
        FView.WriteToLog('Connected: COM' + IntToStr(FPort) + ' ' + IntToStr(FRate));
end;

procedure TMainViewPresenter.Disconnect;
begin
    FModel.Disconnect;
    FView.WriteToLog('Disconnected: COM' + IntToStr(FPort));
end;

function TMainViewPresenter._AddRef: Integer;
begin
    Result := -1;
end;

function TMainViewPresenter._Release: Integer;
begin
    Result := -1;
end;

function TMainViewPresenter.QueryInterface(const IID: TGUID;
  out Obj): HResult;
begin
    if GetInterface(IID, Obj) then
        Result := S_OK
    else
        Result := E_NOINTERFACE;
end;

procedure TMainViewPresenter.Send(aValue: Byte);
begin
    FModel.Send(aValue);
    FView.WriteToLog('Send: ' + IntToStr(aValue));
end;

procedure TMainViewPresenter.SetModel(aModel: ICOMPortRWInterface);
begin
    FModel := aModel;

    if FModel <> nil then
        FModel.SetConfig(FPort, FRate);
end;

function TMainViewPresenter.Connected: boolean;
begin
    Result := FModel.GetConnectedState;
end;

procedure TMainViewPresenter.SetView(aView: IMainViewInterface);
begin
    FView := aView;
end;

end.
