unit MainView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ImgList, ToolWin, ActnMan, ActnCtrls,
  XPStyleActnCtrls, StdCtrls, CPDrv, MainViewPresenterIntf,
  MainViewPresenter, COMPortRWIntf, COMPortRW, MainViewIntf;

type
  TdlgMainView = class(TForm, IMainViewInterface)
    btnSend: TButton;
    edtCode: TEdit;
    actmgr1: TActionManager;
    acttb1: TActionToolBar;
    il1: TImageList;
    actExit: TAction;
    actConfig: TAction;
    lb1: TLabel;
    actConnect: TAction;
    actDisconnect: TAction;
    actSend: TAction;
    memoCPHistory: TMemo;
    procedure actExitExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actConnectExecute(Sender: TObject);
    procedure actDisconnectExecute(Sender: TObject);
    procedure actSendUpdate(Sender: TObject);
    procedure actDisconnectUpdate(Sender: TObject);
    procedure actConnectUpdate(Sender: TObject);
    procedure actConfigUpdate(Sender: TObject);
    procedure actSendExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actConfigExecute(Sender: TObject);
  private
    { Private declarations }
    FPresenter: IMainViewPresenterInterface;
    FModel: ICOMPortRWInterface;

    procedure WriteToLog(aMsg: string);
  public
    { Public declarations }
  end;

var
  dlgMainView: TdlgMainView;

implementation

uses
    CpConfigDialog;

{$R *.dfm}

procedure TdlgMainView.actExitExecute(Sender: TObject);
begin
    Close;
end;

procedure TdlgMainView.FormCreate(Sender: TObject);
begin
    FModel := TCOMPortRW.Create;

    FPresenter := TMainViewPresenter.Create;
    FPresenter.SetModel(FModel);
    FPresenter.SetView(self);
end;

procedure TdlgMainView.actConnectExecute(Sender: TObject);
begin
    FPresenter.Connect;
end;

procedure TdlgMainView.actDisconnectExecute(Sender: TObject);
begin
    FPresenter.Disconnect;
end;

procedure TdlgMainView.actSendUpdate(Sender: TObject);
begin
    actSend.Enabled := FPresenter.Connected;
end;

procedure TdlgMainView.actDisconnectUpdate(Sender: TObject);
begin
    actDisconnect.Enabled := FPresenter.Connected;
end;

procedure TdlgMainView.actConnectUpdate(Sender: TObject);
begin
    actConnect.Enabled := not FPresenter.Connected;
end;

procedure TdlgMainView.actConfigUpdate(Sender: TObject);
begin
    actConfig.Enabled := not FPresenter.Connected;
end;

procedure TdlgMainView.actSendExecute(Sender: TObject);
begin
    FPresenter.Send(StrToInt(edtCode.Text));
end;

procedure TdlgMainView.WriteToLog(aMsg: string);
begin
    memoCPHistory.Lines.Add(aMsg);
end;

procedure TdlgMainView.FormDestroy(Sender: TObject);
begin
    FModel     := nil;
    FPresenter := nil;
end;

procedure TdlgMainView.actConfigExecute(Sender: TObject);
begin
    FPresenter.Config;
end;

end.
