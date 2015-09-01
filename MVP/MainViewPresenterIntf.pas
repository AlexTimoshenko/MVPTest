unit MainViewPresenterIntf;

interface

uses
    MainViewIntf,
    COMPortRWIntf;

type

    IMainViewPresenterInterface = interface
    ['{3C39804E-8590-4F14-919B-1C4E206E0857}']
    procedure Config;
    procedure Connect;
    procedure Disconnect;
    function  Connected: boolean;
    procedure Send(aValue: Byte);

    procedure SetModel(aModel: ICOMPortRWInterface);
    procedure SetView(aView: IMainViewInterface);
    end;

implementation

end.
