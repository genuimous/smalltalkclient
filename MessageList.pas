unit MessageList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, Placemnt;

type
  TMessageListForm = class(TForm)
    MainMenu: TMainMenu;
    FileMI: TMenuItem;
    SaveMI: TMenuItem;
    ClearMI: TMenuItem;
    MessageListSaveDialog: TSaveDialog;
    MessageListMemo: TMemo;
    FormPlacement: TFormPlacement;
    procedure ClearMIClick(Sender: TObject);
    procedure SaveMIClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Save;
    procedure Clear;      
  public
    { Public declarations }
  end;

var
  MessageListForm: TMessageListForm;

implementation

{$R *.dfm}                             

procedure TMessageListForm.ClearMIClick(Sender: TObject);
begin
  Clear;
end;

procedure TMessageListForm.SaveMIClick(Sender: TObject);
begin
  Save;
end;

procedure TMessageListForm.FormShow(Sender: TObject);
begin
  SendMessage(MessageListMemo.Handle, EM_LINESCROLL, 0, MessageListMemo.Lines.Count - 1);
end;

procedure TMessageListForm.Clear;
begin
  MessageListMemo.Lines.Clear;
end;

procedure TMessageListForm.Save;
begin
  if MessageListSaveDialog.Execute then
  begin
    MessageListMemo.Lines.SaveToFile(MessageListSaveDialog.FileName);
  end;
end;

end.
