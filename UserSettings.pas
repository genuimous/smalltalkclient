unit UserSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DialMessages, Utils, Placemnt, DataErrors;

type
  TUserSettingsForm = class(TForm)
    UserPropsGroupBox: TGroupBox;
    UserNameLabel: TLabel;
    PasswordLabel: TLabel;
    UserNameEdit: TEdit;
    PasswordEdit: TEdit;
    CancelButton: TButton;
    OKButton: TButton;
    FormPlacement: TFormPlacement;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UserNameEditExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UserSettingsForm: TUserSettingsForm;

implementation

{$R *.dfm}

resourcestring
  rsUserNameEmpty = 'User name is empty!';
  rsBadUserName = 'Bad user name!';
  rsPasswordEmpty = 'Password is empty!';

procedure TUserSettingsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  ErrorStr: string;
begin
  if ModalResult = mrOk then
  begin
    ErrorStr := EmptyStr;
    CheckError(UserNameEdit.Text = EmptyStr, ErrorStr, rsUserNameEmpty);
    CheckError(PasswordEdit.Text = EmptyStr, ErrorStr, rsPasswordEmpty);

    TryCloseModal(ErrorStr, Action);
  end;
end;

procedure TUserSettingsForm.UserNameEditExit(Sender: TObject);
begin
  with UserNameEdit do
  begin
    if Text <> EmptyStr then
    begin
      if IsError(not StrConsistsOfChars(Text, UserNameCharSet), rsBadUserName) then
      begin
        SetFocus;
      end;
    end;
  end;
end;

end.
