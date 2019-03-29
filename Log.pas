unit Log;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Placemnt;

type
  TLogForm = class(TForm)
    MainMenu: TMainMenu;
    FileMI: TMenuItem;
    SaveMI: TMenuItem;
    ClearMI: TMenuItem;
    LogMemo: TMemo;
    LogSaveDialog: TSaveDialog;
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
  LogForm: TLogForm;

implementation

{$R *.dfm}

procedure TLogForm.ClearMIClick(Sender: TObject);
begin
  Clear;
end;

procedure TLogForm.SaveMIClick(Sender: TObject);
begin
  Save;
end;

procedure TLogForm.FormShow(Sender: TObject);
begin
  SendMessage(LogMemo.Handle, EM_LINESCROLL, 0, LogMemo.Lines.Count - 1);
end;

procedure TLogForm.Clear;
begin
  LogMemo.Lines.Clear;
end;

procedure TLogForm.Save;
begin
  if LogSaveDialog.Execute then
  begin
    LogMemo.Lines.SaveToFile(LogSaveDialog.FileName);
  end;
end;

end.
