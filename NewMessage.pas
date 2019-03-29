unit NewMessage;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, Placemnt, DialMessages, Utils,
  DataErrors;

type
  TNewMessageForm = class(TForm)
    ActionPanel: TPanel;
    MessageTextMemo: TMemo;
    MainMenu: TMainMenu;
    FileMI: TMenuItem;
    ClearMI: TMenuItem;
    CharCountLabel: TLabel;
    FormPlacement: TFormPlacement;
    SaveMI: TMenuItem;
    OpenMI: TMenuItem;
    MessageTextOpenDialog: TOpenDialog;
    MessageTextSaveDialog: TSaveDialog;
    CancelButton: TButton;
    OKButton: TButton;
    procedure ClearMIClick(Sender: TObject);
    procedure MessageTextMemoChange(Sender: TObject);
    procedure SaveMIClick(Sender: TObject);
    procedure OpenMIClick(Sender: TObject);
  private
    { Private declarations }
    procedure Open;
    procedure Save;
    procedure Clear;
  public
    { Public declarations }
    procedure SetMaxMessageLength(const MaxMessageLength: Integer);
    procedure LoadMessageText(const FileName: string);
    procedure SaveMessageText(const FileName: string);
  end;

var
  NewMessageForm: TNewMessageForm;

implementation

{$R *.dfm}

resourcestring
  rsMessageTooLong = 'Message text exceeds limit!';  

procedure TNewMessageForm.ClearMIClick(Sender: TObject);
begin
  Clear;
end;

procedure TNewMessageForm.MessageTextMemoChange(Sender: TObject);
begin
  CharCountLabel.Caption := IntToStr(Length(MessageTextMemo.Text));
  OKButton.Enabled := MessageTextMemo.Text <> EmptyStr;
end;

procedure TNewMessageForm.SaveMIClick(Sender: TObject);
begin
  Save;
end;

procedure TNewMessageForm.OpenMIClick(Sender: TObject);
begin
  Open;
end;

procedure TNewMessageForm.LoadMessageText(const FileName: string);
var
  OldText: string;
begin
  OldText := MessageTextMemo.Text;

  MessageTextMemo.Lines.LoadFromFile(FileName);
  if IsError(Length(MessageTextMemo.Text) > MessageTextMemo.MaxLength, rsMessageTooLong) then
  begin
    MessageTextMemo.Text := OldText;
  end;
end;

procedure TNewMessageForm.SaveMessageText(const FileName: string);
begin
  MessageTextMemo.Lines.SaveToFile(FileName);
end;

procedure TNewMessageForm.Clear;
begin
  MessageTextMemo.Lines.Clear;
  CharCountLabel.Caption := '0';
  OKButton.Enabled := False;
end;

procedure TNewMessageForm.Open;
begin
  with MessageTextOpenDialog do
  begin
    if Execute then
    begin
      LoadMessageText(FileName);
    end;
  end;
end;

procedure TNewMessageForm.Save;
begin
  with MessageTextSaveDialog do
  begin
    if Execute then
    begin
      SaveMessageText(FileName);
    end;
  end;
end;

procedure TNewMessageForm.SetMaxMessageLength(const MaxMessageLength: Integer);
begin
  MessageTextMemo.MaxLength := MaxMessageLength;
end;

end.
