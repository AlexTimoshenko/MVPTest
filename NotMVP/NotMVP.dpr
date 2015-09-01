program NotMVP;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {dlgMain},
  CpConfigDialog in 'CpConfigDialog.pas' {dlgCpConfig};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdlgMain, dlgMain);
  Application.CreateForm(TdlgCpConfig, dlgCpConfig);
  Application.Run;
end.
