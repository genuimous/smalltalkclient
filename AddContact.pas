unit AddContact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DialMessages, Utils, Placemnt, DataErrors;

type
  TAddContactForm = class(TForm)
    ContactPropsGroupBox: TGroupBox;
    UserNameLabel: TLabel;
    UserNameEdit: TEdit;
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
  AddContactForm: TAddContactForm;

implementation

{$R *.dfm}

resourcestring
  rsUserNameEmpty = 'User name is empty!';
  rsBadUserName = 'Bad user name!';

procedure TAddContactForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  ErrorStr: string;
begin
  if ModalResult = mrOk then
  begin
    ErrorStr := EmptyStr;
    CheckError(UserNameEdit.Text = EmptyStr, ErrorStr, rsUserNameEmpty);

    TryCloseModal(ErrorStr, Action);
  end;  
end;

procedure TAddContactForm.UserNameEditExit(Sender: TObject);
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
