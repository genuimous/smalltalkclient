unit ChangeDisplayName;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DialMessages, Utils, Placemnt, DataErrors;

type
  TChangeDisplayNameForm = class(TForm)
    DisplayNamePropsGroupBox: TGroupBox;
    CurrentPasswordLabel: TLabel;
    NewDisplayNameLabel: TLabel;
    CurrentPasswordEdit: TEdit;
    NewDisplayNameEdit: TEdit;
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
  ChangeDisplayNameForm: TChangeDisplayNameForm;

implementation

{$R *.dfm}

resourcestring
  rsCurrentPasswordEmpty = 'Current password is empty!';
  rsNewDisplayNameEmpty = 'New display name is empty!';

procedure TChangeDisplayNameForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  ErrorStr: string;
begin
  if ModalResult = mrOk then
  begin
    ErrorStr := EmptyStr;
    CheckError(CurrentPasswordEdit.Text = EmptyStr, ErrorStr, rsCurrentPasswordEmpty);
    CheckError(NewDisplayNameEdit.Text = EmptyStr, ErrorStr, rsNewDisplayNameEmpty);

    TryCloseModal(ErrorStr, Action);
  end;  
end;

end.
