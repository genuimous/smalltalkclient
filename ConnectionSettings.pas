unit ConnectionSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DialMessages, Utils, Placemnt, DataErrors;

type
  TConnectionSettingsForm = class(TForm)
    ConnectionPropsGroupBox: TGroupBox;
    ServerAddressEdit: TEdit;
    ServerAddressLabel: TLabel;
    ServerPortEdit: TEdit;
    ServerPortLabel: TLabel;
    ConnectionTimeoutEdit: TEdit;
    ConnectionTimeoutLabel: TLabel;
    RequestTimeoutLabel: TLabel;
    RequestTimeoutEdit: TEdit;
    CancelButton: TButton;
    OKButton: TButton;
    ConnectionTimeoutUnitLabel: TLabel;
    RequestTimeoutUnitLabel: TLabel;
    FormPlacement: TFormPlacement;
    procedure ServerPortEditExit(Sender: TObject);
    procedure ConnectionTimeoutEditExit(Sender: TObject);
    procedure RequestTimeoutEditExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConnectionSettingsForm: TConnectionSettingsForm;

implementation

{$R *.dfm}

const
  MinPortNumber: Integer = 1;
  MaxPortNumber: Integer = 65535;
  MinConnectionTimeout: Integer = 100;
  MaxConnectionTimeout: Integer = 60000;
  MinRequestTimeout: Integer = 100;
  MaxRequestTimeout: Integer = 60000;

resourcestring
  rsServerAddressEmpty = 'Server address is empty!';
  rsServerPortEmpty = 'Port is empty!';
  rsBadServerPort = 'Bad port number!';
  rsWrongServerPort = 'Port number must be from %d to %d!';
  rsConnectionTimeoutEmpty = 'Connection timeout is empty!';
  rsBadConnectionTimeout = 'Bad connection timeout!';
  rsWrongConnectionTimeout = 'Connection timeout value must be from %d to %d!';
  rsRequestTimeoutEmpty = 'Request timeout is empty!';
  rsBadRequestTimeout = 'Bad request timeout!';
  rsWrongRequestTimeout = 'Request timeout value must be from %d to %d!';  

procedure TConnectionSettingsForm.ServerPortEditExit(Sender: TObject);
begin
  with ServerPortEdit do
  begin
    if Text <> EmptyStr then
    begin
      if IsError(not StrConsistsOfChars(Text, DecCharSet), rsBadServerPort) then
      begin
        SetFocus;
      end
      else
      begin
        if IsError(not IntBetween(StrToInt(Text), MinPortNumber, MaxPortNumber), Format(rsWrongServerPort, [MinPortNumber, MaxPortNumber])) then
        begin
          SetFocus;
        end;
      end;
    end;
  end;
end;

procedure TConnectionSettingsForm.ConnectionTimeoutEditExit(
  Sender: TObject);
begin
  with ConnectionTimeoutEdit do
  begin
    if Text <> EmptyStr then
    begin
      if IsError(not StrConsistsOfChars(Text, DecCharSet), rsBadConnectionTimeout) then
      begin
        SetFocus;
      end
      else
      begin
        if IsError(not IntBetween(StrToInt(Text), MinConnectionTimeout, MaxConnectionTimeout), Format(rsWrongConnectionTimeout, [MinConnectionTimeout, MaxConnectionTimeout])) then
        begin
          SetFocus;
        end;
      end;
    end;
  end;
end;

procedure TConnectionSettingsForm.RequestTimeoutEditExit(Sender: TObject);
begin
  with RequestTimeoutEdit do
  begin
    if Text <> EmptyStr then
    begin
      if IsError(not StrConsistsOfChars(Text, DecCharSet), rsBadRequestTimeout) then
      begin
        SetFocus;
      end
      else
      begin
        if IsError(not IntBetween(StrToInt(Text), MinRequestTimeout, MaxRequestTimeout), Format(rsWrongConnectionTimeout, [MinRequestTimeout, MaxRequestTimeout])) then
        begin
          SetFocus;
        end;
      end;
    end;
  end;
end;

procedure TConnectionSettingsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  ErrorStr: string;
begin
  if ModalResult = mrOk then
  begin
    ErrorStr := EmptyStr;
    CheckError(ServerAddressEdit.Text = EmptyStr, ErrorStr, rsServerAddressEmpty);
    CheckError(ServerPortEdit.Text = EmptyStr, ErrorStr, rsServerPortEmpty);
    CheckError(ConnectionTimeoutEdit.Text = EmptyStr, ErrorStr, rsConnectionTimeoutEmpty);
    CheckError(RequestTimeoutEdit.Text = EmptyStr, ErrorStr, rsRequestTimeoutEmpty);

    TryCloseModal(ErrorStr, Action);
  end;  
end;

end.
