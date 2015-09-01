unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ImgList, ToolWin, ActnMan, ActnCtrls,
  XPStyleActnCtrls, StdCtrls, CPDrv;

type
  TdlgMain = class(TForm)
    btnSend: TButton;
    edtCode: TEdit;
    actmgr1: TActionManager;
    acttb1: TActionToolBar;
    il1: TImageList;
    actExit: TAction;
    actConfig: TAction;
    lb1: TLabel;
    cpd1: TCommPortDriver;
    actConnect: TAction;
    actDisconnect: TAction;
    actSend: TAction;
    memoCPHistory: TMemo;
    procedure actConfigExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actConnectExecute(Sender: TObject);
    procedure actDisconnectExecute(Sender: TObject);
    procedure actSendUpdate(Sender: TObject);
    procedure actDisconnectUpdate(Sender: TObject);
    procedure actConnectUpdate(Sender: TObject);
    procedure actConfigUpdate(Sender: TObject);
    procedure actSendExecute(Sender: TObject);
  private
    { Private declarations }
    FPort: Cardinal;
    FRate: Cardinal;
  public
    { Public declarations }
  end;

var
  dlgMain: TdlgMain;

implementation

uses
    CpConfigDialog;

{$R *.dfm}

procedure TdlgMain.actConfigExecute(Sender: TObject);
var
    dlg: TdlgCpConfig;
begin
    dlg := TdlgCpConfig.Create(nil);

    if dlg.Execute(FPort, FRate) then
    begin
        FPort := dlg.Port;
        FRate := dlg.Rate;

        cpd1.PortName := '\\.\COM' + IntToStr(FPort);
        cpd1.BaudRateValue := FRate;

        actConnect.Execute;
    end;

    dlg.Free;
end;

procedure TdlgMain.actExitExecute(Sender: TObject);
begin
    Close;
end;

procedure TdlgMain.FormCreate(Sender: TObject);
begin
    FPort := 1;
    FRate := 9600;

    cpd1.PortName := '\\.\COM' + IntToStr(FPort);
    cpd1.BaudRateValue := FRate;
end;

procedure TdlgMain.actConnectExecute(Sender: TObject);
begin
    if cpd1.Connect then
        memoCPHistory.Lines.Add('Connected: COM' + IntToStr(FPort) + ' ' + IntToStr(FRate));
end;

procedure TdlgMain.actDisconnectExecute(Sender: TObject);
begin
    cpd1.Disconnect;
    memoCPHistory.Lines.Add('Disconnected: COM' + IntToStr(FPort));
end;

procedure TdlgMain.actSendUpdate(Sender: TObject);
begin
    actSend.Enabled := cpd1.Connected;
end;

procedure TdlgMain.actDisconnectUpdate(Sender: TObject);
begin
    actDisconnect.Enabled := cpd1.Connected;
end;

procedure TdlgMain.actConnectUpdate(Sender: TObject);
begin
    actConnect.Enabled := not cpd1.Connected;
end;

procedure TdlgMain.actConfigUpdate(Sender: TObject);
begin
    actConfig.Enabled := not cpd1.Connected;
end;

procedure TdlgMain.actSendExecute(Sender: TObject);
begin
    cpd1.SendByte(StrToInt(edtCode.Text));
    memoCPHistory.Lines.Add('Send: ' + edtCode.Text);
end;

end.
