unit NewAccount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DialMessages, Utils, Placemnt, DataErrors;

type
  TNewAccountForm = class(TForm)
    AccountPropsGroupBox: TGroupBox;
    UserNameEdit: TEdit;
    UserNameLabel: TLabel;
    PasswordLabel: TLabel;
    PasswordEdit: TEdit;
    Password2Edit: TEdit;
    Password2Label: TLabel;
    DisplayNameEdit: TEdit;
    DisplayNameLabel: TLabel;
    OKButton: TButton;
    CancelButton: TButton;
    FormPlacement: TFormPlacement;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UserNameEditExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewAccountForm: TNewAccountForm;

implementation

{$R *.dfm}

resourcestring
  rsUserNameEmpty = 'User name is empty!';
  rsBadUserName = 'Bad user name!';
  rsPasswordEmpty = 'Password is empty!';
  rsPasswordsNotMatch = 'Passwords are not the same!';
  rsDisplayNameEmpty = 'User name is empty!';

procedure TNewAccountForm.CancelButtonClick(Sender: TObject);
begin
  Close;
  ModalResult := mrCancel;
end;

procedure TNewAccountForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  ErrorStr: string;
begin
  if ModalResult = mrOk then
  begin
    ErrorStr := EmptyStr;
    CheckError(UserNameEdit.Text = EmptyStr, ErrorStr, rsUserNameEmpty);
    CheckError(PasswordEdit.Text = EmptyStr, ErrorStr, rsPasswordEmpty);
    CheckError(PasswordEdit.Text <> Password2Edit.Text, ErrorStr, rsPasswordsNotMatch);
    CheckError(DisplayNameEdit.Text = EmptyStr, ErrorStr, rsDisplayNameEmpty);

    TryCloseModal(ErrorStr, Action);
  end;
end;

procedure TNewAccountForm.UserNameEditExit(Sender: TObject);
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
