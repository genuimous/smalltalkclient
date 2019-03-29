unit ChangePassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DialMessages, Utils, Placemnt, DataErrors;

type
  TChangePasswordForm = class(TForm)
    PasswordPropsGroupBox: TGroupBox;
    CurrentPasswordLabel: TLabel;
    NewPasswordLabel: TLabel;
    NewPassword2Label: TLabel;
    CurrentPasswordEdit: TEdit;
    NewPasswordEdit: TEdit;
    NewPassword2Edit: TEdit;
    OKButton: TButton;
    CancelButton: TButton;
    FormPlacement: TFormPlacement;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChangePasswordForm: TChangePasswordForm;

implementation

{$R *.dfm}

resourcestring
  rsCurrentPasswordEmpty = 'Current password is empty!';
  rsNewPasswordEmpty = 'New password is empty!';
  rsPasswordsNotMatch = 'Passwords are not the same!';

procedure TChangePasswordForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  ErrorStr: string;
begin
  if ModalResult = mrOk then
  begin
    ErrorStr := EmptyStr;
    CheckError(CurrentPasswordEdit.Text = EmptyStr, ErrorStr, rsCurrentPasswordEmpty);
    CheckError(NewPasswordEdit.Text = EmptyStr, ErrorStr, rsNewPasswordEmpty);
    CheckError(NewPasswordEdit.Text <> NewPassword2Edit.Text, ErrorStr, rsPasswordsNotMatch);

    TryCloseModal(ErrorStr, Action);
  end;  
end;

end.
