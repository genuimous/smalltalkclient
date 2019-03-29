unit ReceivedMessage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, Placemnt;

type
  TReceivedMessageForm = class(TForm)
    MainMenu: TMainMenu;
    FileMI: TMenuItem;
    ClearMI: TMenuItem;
    MessageTextMemo: TMemo;
    ActionPanel: TPanel;
    FormPlacement: TFormPlacement;
    MessageTextSaveDialog: TSaveDialog;
    SaveMI: TMenuItem;
    ReplyButton: TButton;
    CloseButton: TButton;
    procedure ReplyButtonClick(Sender: TObject);
    procedure SaveMIClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ClearMIClick(Sender: TObject);
  private
    { Private declarations }
    procedure Save;
    procedure Clear;       
  public
    { Public declarations }
    AnswerNeeded: Boolean;
  end;

var
  ReceivedMessageForm: TReceivedMessageForm;

implementation

{$R *.dfm}

procedure TReceivedMessageForm.ReplyButtonClick(Sender: TObject);
begin
  AnswerNeeded := True;  
end;

procedure TReceivedMessageForm.SaveMIClick(Sender: TObject);
begin
  Save;
end;

procedure TReceivedMessageForm.FormCreate(Sender: TObject);
begin
  AnswerNeeded := False;
end;

procedure TReceivedMessageForm.Clear;
begin
  MessageTextMemo.Lines.Clear;
end;

procedure TReceivedMessageForm.Save;
begin
  with MessageTextSaveDialog do
  begin
    if Execute then
    begin
      MessageTextMemo.Lines.SaveToFile(FileName);
    end;
  end;
end;

procedure TReceivedMessageForm.ClearMIClick(Sender: TObject);
begin
  Clear;
end;

end.
