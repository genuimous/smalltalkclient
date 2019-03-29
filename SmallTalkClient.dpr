program SmallTalkClient;

{$R 'TrayIcons.res' 'TrayIcons.rc'}

uses
  Forms,
  Utils in 'Utils.pas',
  Client in 'Client.pas' {ClientForm},
  Log in 'Log.pas' {LogForm},
  NewAccount in 'NewAccount.pas' {NewAccountForm},
  AddContact in 'AddContact.pas' {AddContactForm},
  ConnectionSettings in 'ConnectionSettings.pas' {ConnectionSettingsForm},
  UserSettings in 'UserSettings.pas' {UserSettingsForm},
  NewMessage in 'NewMessage.pas' {NewMessageForm},
  MessageList in 'MessageList.pas' {MessageListForm},
  ReceivedMessage in 'ReceivedMessage.pas' {ReceivedMessageForm},
  ChangePassword in 'ChangePassword.pas' {ChangePasswordForm},
  ChangeDisplayName in 'ChangeDisplayName.pas' {ChangeDisplayNameForm},
  DataErrors in 'DataErrors.pas',
  DialMessages in 'DialMessages.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TClientForm, ClientForm);
  Application.Run;
end.
