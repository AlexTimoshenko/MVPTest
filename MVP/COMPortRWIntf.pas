unit COMPortRWIntf;

interface

type

    ICOMPortRWInterface = interface
    ['{7763E7EF-91C6-4752-86DA-997CE172DDD5}']
    procedure SetConfig(aPort: Cardinal; aRate: Cardinal);
    procedure Connect;
    procedure Disconnect;
    function  GetConnectedState: boolean;
    procedure Send(aValue: Byte);
    end;

implementation

end.
 