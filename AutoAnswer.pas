unit AutoAnswer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TAutoAnswerForm = class(TForm)
    ActionPanel: TPanel;
    ButtonsPanel: TPanel;
    CancelButton: TButton;
    OKButton: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AutoAnswerForm: TAutoAnswerForm;

implementation

{$R *.dfm}

end.
