program MVP;

uses
  Forms,
  MainView in 'MainView.pas' {dlgMainView},
  CpConfigDialog in 'CpConfigDialog.pas' {dlgCpConfig},
  MainViewPresenter in 'MainViewPresenter.pas',
  MainViewPresenterIntf in 'MainViewPresenterIntf.pas',
  COMPortRWIntf in 'COMPortRWIntf.pas',
  COMPortRW in 'COMPortRW.pas',
  MainViewIntf in 'MainViewIntf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdlgMainView, dlgMainView);
  Application.CreateForm(TdlgCpConfig, dlgCpConfig);
  Application.Run;
end.
