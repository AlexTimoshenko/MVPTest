unit CpConfigDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TdlgCpConfig = class(TForm)
    lb1: TLabel;
    cbbPort: TComboBox;
    lb2: TLabel;
    cbbRate: TComboBox;
    pnl1: TPanel;
    bvl1: TBevel;
    btnOK: TButton;
    btnCancel: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FRate: Cardinal;
    FPort: Cardinal;
  public
    { Public declarations }
    function Execute(aPort: Cardinal; aRate: Cardinal): boolean;

    property Port: Cardinal read FPort;
    property Rate: Cardinal read FRate;
  end;

var
  dlgCpConfig: TdlgCpConfig;

implementation

{$R *.dfm}

function TdlgCpConfig.Execute(aPort: Cardinal; aRate: Cardinal): boolean;
begin
    cbbPort.ItemIndex := cbbPort.Items.IndexOf('COM' + IntToStr(aPort));
    cbbRate.ItemIndex := cbbRate.Items.IndexOf(IntToStr(aRate));

    Result := (ShowModal = mrOk);
end;

procedure TdlgCpConfig.FormCreate(Sender: TObject);
var
    index: Integer;
begin

    cbbPort.Items.Clear;
    for index := 1 to 255 do
        cbbPort.Items.Add('COM' + IntToStr(index));
    cbbPort.ItemIndex := cbbPort.Items.IndexOf('COM1');

    cbbRate.Items.Clear;
    cbbRate.Items.Add('1200');
    cbbRate.Items.Add('2400');
    cbbRate.Items.Add('4800');
    cbbRate.Items.Add('9600');
    cbbRate.Items.Add('14400');
    cbbRate.Items.Add('19200');
    cbbRate.Items.Add('38400');
    cbbRate.Items.Add('57600');
    cbbRate.Items.Add('115200');
    cbbRate.ItemIndex := cbbRate.Items.IndexOf('9600');
end;

procedure TdlgCpConfig.btnOKClick(Sender: TObject);
begin
    FPort := cbbPort.ItemIndex + 1;
    FRate := StrToInt(cbbRate.Text);
end;

end.
