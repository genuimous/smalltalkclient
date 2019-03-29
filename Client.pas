unit Client;

interface

uses
  XPMan, Windows, SysUtils, Classes, Controls, Forms, Menus, ToolWin,
  StdCtrls, ImgList, Buttons, ComCtrls, ExtCtrls, Graphics, Utils, Dialogs,
  Math, ScktComp, Contnrs, Placemnt, RXShell, Messages, IniFiles, DateUtils,
  DialMessages, Log, NewMessage, MessageList, ReceivedMessage, ChangePassword,
  ChangeDisplayName, NewAccount, AddContact, ConnectionSettings, UserSettings;

type                                               
  TLogType = (ltInfo, ltWarning, ltError, ltDebug);
  TClientMessageType = (cmtTimeRequest, cmtRegistration,
    cmtAuthorization, cmtInclusion, cmtExclusion,
    cmtMessage, cmtPasswordChanging, cmtDisplayNameChanging);
  TServerMessageType = (smtAcknowledgement, smtError, smtTimeStamp,
    smtGreeting, smtMessage, smtConnection, smtDisconnection);

  TServerMessage = class(TObject)
  private
    FMessageType: TServerMessageType;
    FParams: TStrings;
  public
    property MessageType: TServerMessageType read FMessageType;
    property Params: TStrings read FParams;
    constructor Create(const MessageData: string);
  end;

  TClientMessage = class(TObject)
  private
    FMessageType: TClientMessageType;
    FParams: TStrings;
  public
    property MessageType: TClientMessageType read FMessageType;
    property Params: TStrings read FParams;
    procedure Send(Socket: TCustomWinSocket);
    constructor Create(const MessageType: TClientMessageType;
      const Params: TStrings);
  end;

  TSettings = class(TObject)
  private
    FServerAddress: string;
    FServerPort: Word;
    FConnectionTimeout: Cardinal;
    FRequestTimeout: Cardinal;
    FUserName: string;
    FPassword: string;
    FAutoConnect: Boolean;
    FAutoAuthorize: Boolean;
    FShowStatusBar: Boolean;
    FLaunchMinimized: Boolean;
    FApplicationTitle: string;
    FAutoAnswer: Boolean;
    FDebug: Boolean;
  public
    property ServerAddress: string read FServerAddress write FServerAddress;
    property ServerPort: Word read FServerPort write FServerPort;
    property ConnectionTimeout: Cardinal read FConnectionTimeout write FConnectionTimeout;
    property RequestTimeout: Cardinal read FRequestTimeout write FRequestTimeout;
    property UserName: string read FUserName write FUserName;
    property Password: string read FPassword write FPassword;
    property AutoConnect: Boolean read FAutoConnect write FAutoConnect;
    property AutoAuthorize: Boolean read FAutoAuthorize write FAutoAuthorize;
    property ShowStatusBar: Boolean read FShowStatusBar write FShowStatusBar;
    property LaunchMinimized: Boolean read FLaunchMinimized write FLaunchMinimized;
    property ApplicationTitle: string read FApplicationTitle write FApplicationTitle;
    property AutoAnswer: Boolean read FAutoAnswer write FAutoAnswer;
    property Debug: Boolean read FDebug;
    procedure Read(const SettingsFileName: string);
    procedure Write(const SettingsFileName: string);
  end;

  TUser = class(TObject)
  private
    FUserName: string;
    FDisplayName: string;
  public
    property UserName: string read FUserName write FUserName;
    property DisplayName: string read FDisplayName write FDisplayName;
    constructor Create(const UserName: string; const DisplayName: string);
  end;

  TClientForm = class(TForm)
    MainMenu: TMainMenu;
    ServiceMI: TMenuItem;
    HelpMI: TMenuItem;
    AboutMI: TMenuItem;
    StatusBar: TStatusBar;
    UserStateImageList: TImageList;
    UserSettingsMI: TMenuItem;
    LogMI: TMenuItem;
    ShowStatusBarMI: TMenuItem;
    ConnectionSettingsMI: TMenuItem;
    ClientSocket: TClientSocket;
    RequestTimeout: TTimer;
    ConnectMI: TMenuItem;
    DisconnectMI: TMenuItem;
    ConnectionTimeout: TTimer;
    GetTimeMI: TMenuItem;
    AuthorizeMI: TMenuItem;
    RegisterMI: TMenuItem;
    AccessRequestsSeparatorMI: TMenuItem;
    UserPopupMenu: TPopupMenu;
    DeleteContactMI: TMenuItem;
    CreateMessageMI: TMenuItem;
    AutoAuthorizeMI: TMenuItem;
    AutoConnectMI: TMenuItem;
    XPManifest: TXPManifest;
    ActionMI: TMenuItem;
    ExitSeparatorMI: TMenuItem;
    ExitMI: TMenuItem;
    FormPlacement: TFormPlacement;
    SettingsMI: TMenuItem;
    ViewMI: TMenuItem;
    TrayPopupMenu: TPopupMenu;
    TrayExitMI: TMenuItem;
    TrayExitSeparatorMI: TMenuItem;
    TrayShowChatMI: TMenuItem;
    LaunchMinimizedMI: TMenuItem;
    TrayIcon: TRxTrayIcon;
    MessageListMI: TMenuItem;
    AutoAnswerMI: TMenuItem;
    AccessoriesSeparatorMI: TMenuItem;
    TrayMessageListMI: TMenuItem;
    ChangePasswordMI: TMenuItem;
    ChangeDisplayNameMI: TMenuItem;
    UserRequestsSeparatorMI: TMenuItem;
    AddContactMI: TMenuItem;
    DeleteContactSeparatorMI: TMenuItem;
    ReconnectionTimeout: TTimer;
    UsersListView: TListView;
    ToolBar: TToolBar;
    AddContactToolButton: TToolButton;
    GetTimeToolButton: TToolButton;
    ServiceToolSeparator: TToolButton;
    MessageListToolButton: TToolButton;
    MenuImageList: TImageList;
    ChangeDisplayNameToolButton: TToolButton;
    ChangePasswordToolButton: TToolButton;
    ExtraFlagsSeparatorMI: TMenuItem;
    procedure AboutMIClick(Sender: TObject);
    procedure LoginButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ShowStatusBarMIClick(Sender: TObject);
    procedure ClientSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure RequestTimeoutTimer(Sender: TObject);
    procedure ClientSocketConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocketDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ConnectMIClick(Sender: TObject);
    procedure DisconnectMIClick(Sender: TObject);
    procedure ConnectionTimeoutTimer(Sender: TObject);
    procedure GetTimeMIClick(Sender: TObject);
    procedure AuthorizeMIClick(Sender: TObject);
    procedure LogMIClick(Sender: TObject);
    procedure RegisterMIClick(Sender: TObject);
    procedure UserPopupMenuPopup(Sender: TObject);
    procedure AddContactMIClick(Sender: TObject);
    procedure ConnectionSettingsMIClick(Sender: TObject);
    procedure CreateMessageMIClick(Sender: TObject);
    procedure DeleteContactMIClick(Sender: TObject);
    procedure AutoConnectMIClick(Sender: TObject);
    procedure AutoAuthorizeMIClick(Sender: TObject);
    procedure ClientSocketError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure UserSettingsMIClick(Sender: TObject);
    procedure ExitMIClick(Sender: TObject);
    procedure TrayExitMIClick(Sender: TObject);
    procedure TrayShowChatMIClick(Sender: TObject);
    procedure TrayIconDblClick(Sender: TObject);
    procedure MessageListMIClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LaunchMinimizedMIClick(Sender: TObject);
    procedure AutoAnswerMIClick(Sender: TObject);
    procedure TrayMessageListMIClick(Sender: TObject);
    procedure ChangePasswordMIClick(Sender: TObject);
    procedure ChangeDisplayNameMIClick(Sender: TObject);
    procedure ReconnectionTimeoutTimer(Sender: TObject);
    procedure ClientSocketConnecting(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure UsersListViewDblClick(Sender: TObject);
    procedure AddContactToolButtonClick(Sender: TObject);
    procedure GetTimeToolButtonClick(Sender: TObject);
    procedure MessageListToolButtonClick(Sender: TObject);
    procedure ChangeDisplayNameToolButtonClick(Sender: TObject);
    procedure ChangePasswordToolButtonClick(Sender: TObject);
  private
    { Private declarations }
    Version: TApplicationVersion;
    ProgramPath: string;
    Settings: TSettings;
    Buffer: string;
    WaitingRequest: TClientMessage;
    RequestQueue : TQueue;
    SendedRequestCount: Integer;
    Connected: Boolean;
    Authorized: Boolean;
    Owner: TUser;
    OfflineCount, OnlineCount: Integer;
    TrayEmptyIcon, TrayMsgIcon: TIcon;
    NewMessageCount: Integer;
    NeedForReconnection: Boolean;
    procedure ExitProgram;
    procedure ApplicationMinimize(Sender: TObject);
    procedure ShowChat;
    procedure ClearUsersListView;
    procedure SetStatusText(const StatusText: string);
    function MessageDataIsOK(const MessageData: string): Boolean;
    procedure ProcessMessage(Msg: TServerMessage);
    procedure SetControls;
    procedure SendTimeRequest;
    procedure SendRegistrationRequest(const UserName: string;
      const Password: string; const DisplayName: string);
    procedure SendAuthorizaionRequest(const UserName: string;
      const Password: string);
    procedure SendMessage(const UserName: string;
      const MessageText: string; const MessageKind: string);
    procedure SendInclusionRequest(const UserName: string);
    procedure SendExclusionRequest(const UserName: string);
    procedure SendChangePasswordRequest(const CurrentPassword: string;
      const NewPassword: string);
    procedure SendChangeDisplayNameRequest(const CurrentPassword: string;
      const NewDisplayName: string);
    procedure WaitAnswer(Msg: TClientMessage);
    procedure ProcessRequestQueue;
    procedure AcceptAcknowledgement(const Num: string);
    procedure AcceptError(const Num: string; const ErrCode: string);
    procedure TakeTimeStamp(const DateTime: string);
    procedure TakeGreeting(const UserName: string; const DisplayName: string);
    procedure TakeMessage(const UserName: string; const MessageText: string;
      const MessageKind: string);
    procedure TakeConnection(const UserName: string;
      const DisplayName: string);
    procedure TakeDisconnection(const UserName: string;
      const DisplayName: string);
    function UserListItemByUserName(const UserName: string): TListItem;
    function CreateUserListItem(const UserName: string;
      const DisplayName: string): TListItem;
    procedure Log(const LogType: TLogType; const LogText: string);
    procedure Connect;
    procedure Disconnect;
    procedure GetTime;
    procedure RegisterAccount;
    procedure Authorize;
    procedure CreateMessage(Receiver: TUser; const MessageText: string;
      const MessageKind: string);
    procedure AddContact;
    procedure DeleteContact(const UserName: string);
    procedure AddMessageToList(User: TUser; const MessageText: string);
    procedure ShowMessageList;
    procedure AskMessage(Receiver: TUser);
    procedure DisplayMessage(Sender: TUser; const MessageText: string;
      const MessageKind: string);
    procedure ChangePassword;
    procedure ChangeDisplayName;
    procedure ShowStatusBarSelect(const Selected: Boolean);
    procedure LaunchMinimizedSelect(const Selected: Boolean);
    procedure EditConnectionSettings;
    procedure EditUserSettings;
    procedure AutoAnswerSelect(const Selected: Boolean);
    procedure ShowLog;
    procedure AutoConnectSelect(const Selected: Boolean);
    procedure AutoAuthorizeSelect(const Selected: Boolean);
    procedure ShowAbout;
  public
    { Public declarations }
  end;

var
  ClientForm: TClientForm;

implementation

{$R *.dfm}

const
  // program setting
  DefaultPort: Integer = 8192;
  ReceiveBufferSize: Integer = 32768;
  DefaultConnectionTimeout: Integer = 30;
  DefaultRequestTimeout: Integer = 10;
  DefaultApplicationTitle = 'SmallTalk Chat';
  ReconnectionTimeoutCoefficient: Cardinal = 2;
  AutoAnswerFileName: string = 'AutoAnswer.txt';
  MaxMessageLength: Integer = 4096;
  MillisecondsPerSecond: Cardinal = 1000;
  TrayEmptyIconResName: string = 'TrayEmptyIcon';
  TrayMsgIconResName: string = 'TrayMsgIcon';

  // message formatting chars
  DataBegChar: Char = '<';
  DataEndChar: Char = '>';
  MsgPartsDelimiterChar: Char = '=';
  MsgBodyBegChar: Char = '{';
  MsgBodyEndChar: Char = '}';
  MsgBodyPartsDelimiterChar: Char = ',';

  // params for encodig/decoding
  EmptyStrCode: string = '?';
  CharsPerEncodedChar: Integer = 2;

  // settings sections
  setsConnection: string = 'Connection';
  setsUser: string = 'User';
  setsInterface: string = 'Interface';
  setsMessaging: string = 'Messaging';

  // settings params
  setpServerAddress: string = 'ServerAddress';
  setpServerPort: string = 'ServerPort';
  setpConnectionTimeout: string = 'ConnectionTimeout';
  setpRequestTimeout: string = 'RequestTimeout';
  setpUserName: string = 'UserName';
  setpPassword: string = 'Password';
  setpAutoConnect: string = 'AutoConnect';
  setpAutoAuthorize: string = 'AutoAuthorize';
  setpShowStatusBar: string = 'ShowStatusBar';
  setpLaunchMinimized: string = 'LaunchMinimized';
  setpTitle: string = 'Title';
  setpDebug: string = 'Debug';
  setpAutoAnswer: string = 'AutoAnswer';

  // error codes
  ecBadUserName: string = '1001';
  ecUserAlreadyRegistered: string = '1011';
  ecUserNotRegistered: string = '1021';
  ecWrongPassword: string = '1022';
  ecAuthorizationRequired: string = '1999';
  ecUserNotConnected: string = '2001';
  ecUserAlreadyInContactList: string = '3001';
  ecUserNotExistsInContactList: string = '3002';
  ecCanNotAddSelfToContactList: string = '3099';
  ecMessageKindNotSupported: string = '4001';
  ecMessageBodyEmpty: string = '4999';
  ecServerRuntimeException: string = '9999';

  // client message typestrings
  cmtstrTimeRequest: string = 'WT';
  cmtstrRegistration: string = 'REG';
  cmtstrAuthorization: string = 'AUTH';
  cmtstrInclusion: string = 'INCL';
  cmtstrExclusion: string = 'EXCL';
  cmtstrMessage: string = 'MSG';
  cmtstrPasswordChanging: string = 'PWD';
  cmtstrDisplayNameChanging: string = 'NICK';

  // client messages body part counters
  cmbpcTimeRequest: Integer = 0;
  cmbpcRegistration: Integer = 3;
  cmbpcAuthorization: Integer = 2;
  cmbpcInclusion: Integer = 1;
  cmbpcExclusion: Integer = 1;
  cmbpcMessage: Integer = 3;
  cmbpcPasswordChanging: Integer = 2;
  cmbpcDisplayNameChanging: Integer = 2;

  // client messages body elements positions
  cmbepRegistrationUserName: Integer = 0;
  cmbepRegistrationPassword: Integer = 1;
  cmbepRegistrationDisplayName: Integer = 2;
  cmbepAuthorizationUserName: Integer = 0;
  cmbepAuthorizationPassword: Integer = 1;
  cmbepInclusionUserName: Integer = 0;
  cmbepExclusionUserName: Integer = 0;
  cmbepMessageUserName: Integer = 0;
  cmbepMessageText: Integer = 1;
  cmbepMessageKind: Integer = 2;
  cmbepPasswordChangingPassword: Integer = 0;
  cmbepPasswordChangingNewPassword: Integer = 1;
  cmbepDisplayNameChangingPassword: Integer = 0;
  cmbepDisplayNameChangingNewDisplayName: Integer = 1;

  // server message typestrings
  smtstrAcknowledgement: string = 'ACK';
  smtstrError: string = 'ERR';
  smtstrTimeStamp: string = 'TS';
  smtstrGreeting: string = 'HELLO';
  smtstrMessage: string = 'MSG';
  smtstrConnection: string = 'CONNECT';
  smtstrDisconnection: string = 'DISCONNECT';

  // server messages body part counters
  smbpcAcknowledgement: Integer = 1;
  smbpcError: Integer = 2;
  smbpcTimeStamp: Integer = 1;
  smbpcGreeting: Integer = 2;
  smbpcMessage: Integer = 3;
  smbpcConnection: Integer = 2;
  smbpcDisconnection: Integer = 2;

  // server messages body elements positions
  smbepTimeStampDateTime: Integer = 0;
  smbepMessageUserName: Integer = 0;
  smbepMessageText: Integer = 1;
  smbepMessageKind: Integer = 2;
  smbepConnectionUserName: Integer = 0;
  smbepConnectionDisplayName: Integer = 1;
  smbepDisconnectionUserName: Integer = 0;
  smbepDisconnectionDisplayName: Integer = 1;
  smbepAcknowledgementMessageCount: Integer = 0;
  smbepErrorMessageCount: Integer = 0;
  smbepErrorErrCode: Integer = 1;
  smbepGreetingUserName: Integer = 0;
  smbepGreetingDisplayName: Integer = 1;

  // message kinds (for text messages)
  mkSimple: string = 'SPL';
  mkAutoAnswer: string = 'AANSW';

  // user connection states
  usxDisconnected: Integer = 0;
  usxConnected: Integer = 1;

  // timestamp element positions
  tsepYear: Integer = 1;
  tsepMonth: Integer = 5;
  tsepDay: Integer = 7;
  tsepHour: Integer = 9;
  tsepMinute: Integer = 11;
  tsepSecond: Integer = 13;

  // timestamp element lengths
  tselYear: Integer = 4;
  tselMonth: Integer = 2;
  tselDay: Integer = 2;
  tselHour: Integer = 2;
  tselMinute: Integer = 2;
  tselSecond: Integer = 2;

resourcestring
  rsLogInfoPrefix = '[INFO]';
  rsLogWarningPrefix = '[WARNING]';
  rsLogErrorPrefix = '[ERROR]';
  rsLogDebugPrefix = '[DEBUG]';
  rsLogDateTimeFormat = 'mm.dd.yyyy hh:nn:ss';
  rsLogStr = '%s %s %s';
  rsVersion = 'SmallTalk Client - version %d.%d.%d build %d';
  rsProgramStart = 'Program started';
  rsStatusConnecting = 'Connecting to %s:%d...';
  rsStatusConnected = 'Connected to %s:%d';
  rsStatusDisconnected = 'No connection';
  rsStatusTimeRequest = 'Requesting timestamp...';
  rsStatusRegistration = 'Registration...';
  rsStatusAuthorization = 'Authorization...';
  rsStatusMessage = 'Sending message...';
  rsStatusInclusion = 'Adding contact...';
  rsStatusExclusion = 'Deleting contact...';
  rsStatusPasswordChanging = 'Changing password...';
  rsStatusDisplayNameChanging = 'Changing display name...';
  rsConnecting = 'Connecting to %s:%d...';
  rsConnected = 'Connected';
  rsConnectionTimeout = 'Connection timeout!';
  rsConnectionError = 'Connection error (%s)!';
  rsDisconnecting = 'Disconnecting...';
  rsDisconnected = 'Disconnected';
  rsDataIncoming = 'Data received: %s';
  rsDataProcessing = 'Processing message data (%s)...';
  rsDataProcessed = 'Message data has been processed successfully';
  rsDataProcessingError = 'Can not process data received from server!';
  rsDataWrongFormat = 'Data received from server has wrong format!';
  rsDataContainsRubbish = 'Data received from server contains rubbish!';
  rsDataIncorrect = 'Data received from server is incorrect!';
  rsDataExceedsLimit = 'Data length received from server exceeds limit!';
  rsDataReceivingError = 'Data receiving error!';
  rsTimeRequest = 'Requesting timestamp...';
  rsTimeRequestError = 'Can not send time request!';
  rsRegistration = 'Registering as %s (%s)...';
  rsRegistrationError = 'Can not send registration!';
  rsAuthorization = 'Authorizing as %s...';
  rsAuthorizationError = 'Can not send authorization!';
  rsInclusion = 'Adding contact %s...';
  rsInclusionError = 'Can not send inclusion!';
  rsExclusion = 'Deleting contact %s...';
  rsExclusionError = 'Can not send exclusion!';
  rsMessage = 'Sending message for user %s...';
  rsMessageError = 'Can not send message!';
  rsPasswordChanging = 'Changing password...';
  rsPasswordChanged = 'Password has been changed';
  rsPasswordChangingError = 'Can not send password changing!';
  rsDisplayNameChanging = 'Changing display name to %s...';
  rsDisplayNameChanged = 'Display name has been changed';
  rsDisplayNameChangingError = 'Can not send display name changing!';
  rsWaitingForGreeting = 'Waiting for greeting...';
  rsWaitingForAnswer = 'Waiting for answer (%d)...';
  rsGreetingReceived = 'Greeting for user %s has been received';
  rsGreetingEmpty = 'Greeting is empty!';
  rsAcknowledgementReceived = 'Acknowledgement (%s) has been received';
  rsAcknowledgementWrongFormat = 'Acknowledgement data has wrong format!';
  rsAcknowledgementEmpty = 'Acknowledgement has no data!';
  rsErrorReceived = 'Error (%s) %s has been received';
  rsErrorWrongFormat = 'Error data has wrong format!';
  rsErrorEmpty = 'Error has no data!';
  rsTimeStampReceived = 'Timestamp (%s) has been received';
  rsTimeStamp = 'Time on the server is %s';
  rsConnectionReceived = 'Connection of user %s has been received';
  rsConnectionEmpty = 'Connection note is empty!';
  rsDisconnectionReceived = 'Disconnection of user %s has been received';
  rsDisconnectionEmpty = 'Disconnection note is empty!';
  rsMessageReceived = 'Message from user %s has been received';
  rsMessageEmpty = 'Message is empty!';
  rsNoServerAddress = 'Please set up server address!';
  rsNoRegistrationData = 'Please fill registration data!';
  rsRequestTimeout = 'Request timeout!';
  rsErrorUnknown = 'Unknown error!';
  rsErrorBadUserName = 'Bad user name!';
  rsErrorUserAlreadyRegistered = 'User already registered!';
  rsErrorUserNotRegistered = 'User not registered!';
  rsErrorWrongPassword = 'Wrong password!';
  rsErrorAuthorizationRequired = 'Authorization required!';
  rsErrorUserNotConnected = 'User not connected!';
  rsErrorUserAlreadyInContactList = 'User already in contact list!';
  rsErrorUserNotExistsInContactList = 'User not exists in contact list!';
  rsErrorCanNotAddSelfToContactList = 'Can not add self to contact list!';
  rsErrorMessageKindNotSupported = 'Message kind is not supported!';
  rsErrorMessageBodyEmpty = 'Message body is empty!';
  rsErrorServerRuntimeException = 'Server runtime exception!';
  rsAuthorizedInfo = '%s [%d/%d]';
  rsUseRegisteredUser = 'User %s has been registered, do you want use it now?';
  rsConnectionSettingsChanged = 'Connection settings has been changed';
  rsUseConnectionSettings = 'Connection settings has been changed, do you want use it now?';
  rsDeleteUser = 'Delete user %s from contact list?';
  rsAccountSettingsChanged = 'Account settings has been changed';
  rsNewMessageCaption =  'Message for %s';
  rsReceivedMessageCaption = 'Message from %s';
  rsReceivedAutoAnswerCaption = 'Autoanswer from %s';
  rsAutoAnswerCaption = 'Autoanswer';
  rsAutoAnswerExceedsLimit = 'Autoanswer text length exceeds limit!';
  rsAutoAnswerReadingError = 'Can not read autoanswer text!';
  rsAutoAnswerSettingError = 'Can not set autoanswer!';
  rsTrayIconHint = '%s (%d)';
  rsMessageListOutgoingPrefix = '-->';
  rsMessageListIncomingPrefix = '<--';
  rsMessageListDateTimeFormat = 'mm.dd.yyyy hh:nn:ss';
  rsMessageListEntryHeader = '%s %s <%s>';

procedure TClientForm.AboutMIClick(Sender: TObject);
begin
  ShowAbout;
end;

procedure TClientForm.LoginButtonClick(Sender: TObject);
begin
  Authorize;
end;

procedure TClientForm.FormCreate(Sender: TObject);
var
  IconStream: TResourceStream;
begin
  LogForm := TLogForm.Create(Self);

  Application.OnMinimize := ApplicationMinimize;

  Version := ApplicationVersion;
  ProgramPath := ExtractFilePath(ApplicationFileName);

  TrayEmptyIcon := TIcon.Create;
  IconStream := TResourceStream.Create(HInstance, TrayEmptyIconResName, RT_RCDATA);
  TrayEmptyIcon.LoadFromStream(IconStream);
  FreeAndNil(IconStream);

  TrayMsgIcon := TIcon.Create;
  IconStream := TResourceStream.Create(HInstance, TrayMsgIconResName, RT_RCDATA);
  TrayMsgIcon.LoadFromStream(IconStream);
  FreeAndNil(IconStream);

  RequestQueue := TQueue.Create;

  Settings := TSettings.Create;
  Settings.Read(SettingsFileName);

  Application.Title := Settings.ApplicationTitle;

  AutoConnectMI.Checked := Settings.AutoConnect;
  AutoAuthorizeMI.Checked := Settings.AutoAuthorize;
  ShowStatusBarMI.Checked := Settings.ShowStatusBar;
  LaunchMinimizedMI.Checked := Settings.LaunchMinimized;
  AutoAnswerMI.Checked := Settings.AutoAnswer;

  StatusBar.Visible := Settings.ShowStatusBar;

  TrayIcon.Icon := TrayEmptyIcon;
  TrayIcon.Hint := Settings.ApplicationTitle;

  Caption := Settings.ApplicationTitle;
  Application.ShowMainForm := not Settings.LaunchMinimized;

  NewMessageCount := 0;

  Connected := False;
  Authorized := False;

  NeedForReconnection := False;

  Log(ltInfo, rsProgramStart);

  SetControls;

  if Settings.AutoConnect then
  begin
    Connect;
  end;  
end;

procedure TClientForm.ShowStatusBarMIClick(Sender: TObject);
begin
  ShowStatusBarMI.Checked := not ShowStatusBarMI.Checked;
  ShowStatusBarSelect(ShowStatusBarMI.Checked);
end;

{ TSettings }

procedure TSettings.Read(const SettingsFileName: string);
begin
  with TIniFile.Create(SettingsFileName) do
  begin
    try
      FServerAddress := ReadString(setsConnection, setpServerAddress, EmptyStr);
      FServerPort := ReadInteger(setsConnection, setpServerPort, DefaultPort);
      FConnectionTimeout := ReadInteger(setsConnection, setpConnectionTimeout, DefaultConnectionTimeout);
      FRequestTimeout := ReadInteger(setsConnection, setpRequestTimeout, DefaultRequestTimeout);
      FUserName := ReadString(setsUser, setpUserName, EmptyStr);
      FPassword := ReadString(setsUser, setpPassword, EmptyStr);
      FAutoConnect := ReadBool(setsInterface, setpAutoConnect, False);
      FAutoAuthorize := ReadBool(setsInterface, setpAutoAuthorize, False);
      FShowStatusBar := ReadBool(setsInterface, setpShowStatusBar, True);
      FLaunchMinimized := ReadBool(setsInterface, setpLaunchMinimized, True);
      FApplicationTitle := ReadString(setsInterface, setpTitle, DefaultApplicationTitle);
      FDebug := ReadBool(setsInterface, setpDebug, False);
      FAutoAnswer := ReadBool(setsMessaging, setpAutoAnswer, False);
    finally
      Free;
    end;
  end;
end;

procedure TSettings.Write(const SettingsFileName: string);
begin
  with TIniFile.Create(SettingsFileName) do
  begin
    try
      WriteString(setsConnection, setpServerAddress, FServerAddress);
      WriteInteger(setsConnection, setpServerPort, FServerPort);
      WriteInteger(setsConnection, setpConnectionTimeout, FConnectionTimeout);
      WriteInteger(setsConnection, setpRequestTimeout, FRequestTimeout);
      WriteString(setsUser, setpUserName, FUserName);
      WriteString(setsUser, setpPassword, FPassword);
      WriteBool(setsInterface, setpAutoConnect, FAutoConnect);
      WriteBool(setsInterface, setpAutoAuthorize, FAutoAuthorize);
      WriteBool(setsInterface, setpShowStatusBar, FShowStatusBar);
      WriteBool(setsInterface, setpLaunchMinimized, FLaunchMinimized);
      WriteBool(setsMessaging, setpAutoAnswer, FAutoAnswer);
    finally
      Free;
    end;
  end;
end;

procedure TClientForm.Connect;
begin
  if Settings.ServerAddress <> EmptyStr then
  begin
    if not ClientSocket.Active then
    begin
      ConnectionTimeout.Interval := Settings.ConnectionTimeout * MillisecondsPerSecond;
      RequestTimeout.Interval := Settings.RequestTimeout * MillisecondsPerSecond;

      ClientSocket.Address := Settings.ServerAddress;
      ClientSocket.Port := Settings.ServerPort;

      ClientSocket.Open;
    end;
  end
  else
  begin
    Log(ltError, rsNoServerAddress);
    ErrorMsg(rsNoServerAddress);
  end;
end;

{ TClientMessage }

constructor TClientMessage.Create(const MessageType: TClientMessageType;
  const Params: TStrings);
begin
  FMessageType := MessageType;
  FParams := Params;
end;

procedure TClientMessage.Send(Socket: TCustomWinSocket);
var
  ParamCounter: Integer;
  MessageData: string;
begin
  MessageData := EmptyStr;

  MessageData := MessageData + DataBegChar;

  case FMessageType of
    cmtTimeRequest: MessageData := MessageData + cmtstrTimeRequest;
    cmtRegistration: MessageData := MessageData + cmtstrRegistration;
    cmtAuthorization: MessageData := MessageData + cmtstrAuthorization;
    cmtInclusion: MessageData := MessageData + cmtstrInclusion;
    cmtExclusion: MessageData := MessageData + cmtstrExclusion;
    cmtMessage: MessageData := MessageData + cmtstrMessage;
    cmtPasswordChanging: MessageData := MessageData + cmtstrPasswordChanging;
    cmtDisplayNameChanging: MessageData := MessageData + cmtstrDisplayNameChanging;
  end;

  MessageData := MessageData + MsgPartsDelimiterChar;

  MessageData := MessageData + MsgBodyBegChar;
  if Length(FParams) > 0 then
  begin
    for ParamCounter := 0 to Length(FParams) - 1 do
    begin
      MessageData := MessageData + EncodeStr(FParams[ParamCounter], EmptyStrCode, CharsPerEncodedChar);

      if ParamCounter < Length(FParams) - 1 then
        MessageData := MessageData + MsgBodyPartsDelimiterChar;
    end;
  end;
  MessageData := MessageData + MsgBodyEndChar;

  MessageData := MessageData + DataEndChar;

  Socket.SendText(MessageData);
end;

procedure TClientForm.SendAuthorizaionRequest(const UserName: string;
  const Password: string);
var
  MessageType: TClientMessageType;
  Params: TStrings;
  Msg: TClientMessage;
begin
  MessageType := cmtAuthorization;

  SetLength(Params, cmbpcAuthorization);
  Params[cmbepAuthorizationUserName] := UserName;
  Params[cmbepAuthorizationPassword] := Password;

  try
    Msg := TClientMessage.Create(MessageType, Params);
    RequestQueue.Push(Msg);
    ProcessRequestQueue;
  except
    on E: Exception do
    begin
      Log(ltError, rsAuthorizationError + Space + E.Message);
      ErrorMsg(rsAuthorizationError + LineBreak + E.Message);
    end;
  end;
end;

procedure TClientForm.SetStatusText(const StatusText: string);
begin
  StatusBar.Panels[0].Text := StatusText;
  Application.ProcessMessages;
end;

{ TServerMessage }

constructor TServerMessage.Create(const MessageData: string);
var
  MsgDelimiterPos, MsgBodyBegPos, MsgBodyEndPos: Integer;
  MsgTypeStr, MsgBodyStr: string;
  Params: TStrings;
  ParamCounter: Integer;
begin
  // parsing message data
  MsgDelimiterPos := CharPos(MsgPartsDelimiterChar, MessageData);
  MsgBodyBegPos := CharPos(MsgBodyBegChar, MessageData);
  MsgBodyEndPos := CharPos(MsgBodyEndChar, MessageData);

  MsgTypeStr := Copy(MessageData, 1, MsgDelimiterPos - 1);
  MsgBodyStr := Copy(MessageData, MsgBodyBegPos + 1, MsgBodyEndPos - MsgBodyBegPos - 1);

  if MsgTypeStr = smtstrAcknowledgement then FMessageType := smtAcknowledgement;
  if MsgTypeStr = smtstrError then FMessageType := smtError;
  if MsgTypeStr = smtstrTimeStamp then FMessageType := smtTimeStamp;
  if MsgTypeStr = smtstrGreeting then FMessageType := smtGreeting;
  if MsgTypeStr = smtstrMessage then FMessageType := smtMessage;
  if MsgTypeStr = smtstrConnection then FMessageType := smtConnection;
  if MsgTypeStr = smtstrDisconnection then FMessageType := smtDisconnection;

  Params := DisAssembleStr(MsgBodyStr, MsgBodyPartsDelimiterChar);

  // decoding parameters
  SetLength(FParams, Length(Params));
  if Length(Params) > 0 then
  begin
    for ParamCounter := 0 to Length(FParams) - 1 do
    begin
      FParams[ParamCounter] := DecodeStr(Params[ParamCounter], EmptyStrCode, CharsPerEncodedChar);
    end;
  end;
end;

procedure TClientForm.Authorize;
begin
  Log(ltInfo, Format(rsAuthorization, [Settings.UserName]));

  ClearUsersListView;

  if (Settings.UserName <> EmptyStr) and (Settings.Password <> EmptyStr) then
  begin
    Authorized := False;
    SendAuthorizaionRequest(Settings.UserName, Settings.Password);
  end
  else
  begin
    Log(ltError, rsNoRegistrationData);
    ErrorMsg(rsNoRegistrationData);
  end;
end;

procedure TClientForm.ClientSocketRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  ReceivedText: string;
  ChPos: Integer;
  MsgDataBegMark, MsgDataEndMark: Integer;
  MsgData: string;
  Msg: TServerMessage;
begin
  try
    // recieve data
    ReceivedText := Socket.ReceiveText;

    Log(ltDebug, Format(rsDataIncoming, [ReceivedText]));

    // copy data to buffer
    Buffer := Buffer + ReceivedText;

    repeat
      // check size of buffer (to avoid overrun)
      if Length(Buffer) <= ReceiveBufferSize then
      begin
        MsgDataBegMark := 0;
        MsgDataEndMark := 0;
        ChPos := 0;

        // determine where message begins and ends
        repeat
          Inc(ChPos);

          if Buffer[ChPos] = DataBegChar then MsgDataBegMark := ChPos;
          if Buffer[ChPos] = DataEndChar then MsgDataEndMark := ChPos;
        until (MsgDataBegMark > 0) and (MsgDataEndMark > 0) or (ChPos = Length(Buffer));

        if (MsgDataBegMark > 0) and (MsgDataEndMark > 0) then
        // we have start and end message marks
        begin
          MsgData := Copy(Buffer, MsgDataBegMark + 1, MsgDataEndMark - MsgDataBegMark - 1);
          Buffer := Copy(Buffer, MsgDataEndMark + 1, Length(Buffer) - MsgDataEndMark + 1);
          if MessageDataIsOK(MsgData) then
          begin
            try
              // parsing message data
              Log(ltDebug, Format(rsDataProcessing, [MsgData]));
              Msg := TServerMessage.Create(MsgData);

              try
                // processing message
                ProcessMessage(Msg);
              finally
                FreeAndNil(Msg);
              end;
              Log(ltDebug, rsDataProcessed);
            except
              on E: Exception do
              begin
                Log(ltError, rsDataProcessingError + Space + E.Message);
                ErrorMsg(rsDataProcessingError + LineBreak + E.Message);
              end;
            end;
          end
          else
          begin
            Log(ltWarning, rsDataWrongFormat);
            WarningMsg(rsDataWrongFormat);
          end
        end
        else
        // start or end mark is absent
        begin
          if MsgDataBegMark > 0 then
          // only start mark exists
          begin
            if MsgDataBegMark <> 1 then
            // start mark must be at first position
            begin
              Log(ltWarning, rsDataContainsRubbish);
              WarningMsg(rsDataContainsRubbish);

              Buffer := Copy(Buffer, MsgDataBegMark, Length(Buffer) - MsgDataBegMark + 1);
            end
          end
          else
          // no marks at all
          begin
            Log(ltWarning, rsDataIncorrect);
            WarningMsg(rsDataIncorrect);

            Buffer := EmptyStr;
          end;
        end;
      end
      else
      begin
        Log(ltWarning, rsDataExceedsLimit);

        WarningMsg(rsDataExceedsLimit);
        Buffer := EmptyStr;
      end;
    until (Buffer = EmptyStr) or (CharPos(DataBegChar, Buffer) = 1) and (CharPos(DataEndChar, Buffer) = 0);
  except
    on E: Exception do
    begin
      Log(ltError, rsDataReceivingError + Space + E.Message);
      ErrorMsg(rsDataReceivingError + LineBreak + E.Message);
    end;
  end;
end;

function TClientForm.MessageDataIsOK(const MessageData: string): Boolean;
var
  MsgDelimiterPos, MsgBodyBegPos, MsgBodyEndPos: Integer;
  MsgBodyStr, MsgTypeStr: string;
  MsgBodyParts: TStrings;

  function TypeIsOK(const MsgTypeStr: string;
    const MsgBodyPartCount: Integer): Boolean;
  begin
    Result := True;

    if
      not
      (
        (MsgTypeStr = smtstrAcknowledgement) and (MsgBodyPartCount = smbpcAcknowledgement)
        or
        (MsgTypeStr = smtstrError) and (MsgBodyPartCount = smbpcError)
        or
        (MsgTypeStr = smtstrTimeStamp) and (MsgBodyPartCount = smbpcTimeStamp)
        or
        (MsgTypeStr = smtstrGreeting) and (MsgBodyPartCount = smbpcGreeting)
        or
        (MsgTypeStr = smtstrMessage) and (MsgBodyPartCount = smbpcMessage)
        or
        (MsgTypeStr = smtstrConnection) and (MsgBodyPartCount = smbpcConnection)
        or
        (MsgTypeStr = smtstrDisconnection) and (MsgBodyPartCount = smbpcDisconnection)
      )
    then
    begin
      Result := False;
    end;
  end;

  function BodyIsOK(MsgBodyParts: TStrings): Boolean;
  var
    MsgBodyPartsCounter: Integer;
  begin
    Result := True;

    if Length(MsgBodyParts) > 0 then
    begin
      for MsgBodyPartsCounter := 0 to Length(MsgBodyParts) - 1 do
      begin
        if
          not
          (
            (Length(MsgBodyParts[MsgBodyPartsCounter]) > 0)
            and
            (Length(MsgBodyParts[MsgBodyPartsCounter]) mod CharsPerEncodedChar = 0)
            and
            StrConsistsOfChars(MsgBodyParts[MsgBodyPartsCounter], HexCharSet)
            or
            (MsgBodyParts[MsgBodyPartsCounter] = EmptyStrCode)
          )
        then
        begin
          Result := False;
          Break;
        end;
      end;
    end;
  end;
begin
  Result := True;

  // checking all delimiters are set properly
  if
    not
    (
      (CharCount(MsgPartsDelimiterChar, MessageData) = 1)
      and
      (CharCount(MsgBodyBegChar, MessageData) = 1)
      and
      (CharCount(MsgBodyEndChar, MessageData) = 1)
    )
  then
  begin
    Result := False;
  end
  else
  begin
    // checking position of delimiters
    MsgDelimiterPos := CharPos(MsgPartsDelimiterChar, MessageData);
    MsgBodyBegPos := CharPos(MsgBodyBegChar, MessageData);
    MsgBodyEndPos := CharPos(MsgBodyEndChar, MessageData);

    if
      not
      (
        (MsgBodyBegPos < MsgBodyEndPos)
        and
        (MsgDelimiterPos + 1 = MsgBodyBegPos)
        and
        (MsgDelimiterPos > 1)
        and
        (MsgBodyEndPos = Length(MessageData))
      )
    then
    begin
      Result := False;
    end
    else
    begin
      MsgTypeStr := Copy(MessageData, 1, MsgDelimiterPos - 1);
      MsgBodyStr := Copy(MessageData, MsgBodyBegPos + 1, MsgBodyEndPos - MsgBodyBegPos - 1);
      SetLength(MsgBodyParts, 0);
      if Length(MsgBodyStr) > 0 then
      begin
        MsgBodyParts := DisAssembleStr(MsgBodyStr, MsgBodyPartsDelimiterChar);
      end;  

      // checking data
      if
        not
        (
          TypeIsOK(MsgTypeStr, Length(MsgBodyParts))
          and
          BodyIsOK(MsgBodyParts)
        )
      then
      begin
        Result := False;
      end;
    end;
  end;
end;

procedure TClientForm.ProcessMessage(Msg: TServerMessage);
begin
  case Msg.MessageType of
    smtAcknowledgement:
    begin
      Log(ltInfo, Format(rsAcknowledgementReceived, [Msg.Params[smbepAcknowledgementMessageCount]]));
      AcceptAcknowledgement(Msg.Params[smbepAcknowledgementMessageCount]);
    end;
    smtError:
    begin
      Log(ltInfo, Format(rsErrorReceived, [Msg.Params[smbepErrorMessageCount], Msg.Params[smbepErrorErrCode]]));
      AcceptError(Msg.Params[smbepErrorMessageCount], Msg.Params[smbepErrorErrCode]);
    end;
    smtTimeStamp:
    begin
      Log(ltInfo, Format(rsTimeStampReceived, [Msg.Params[smbepTimeStampDateTime]]));
      TakeTimeStamp(Msg.Params[smbepTimeStampDateTime]);
    end;
    smtGreeting:
    begin
      Log(ltInfo, Format(rsGreetingReceived, [Msg.Params[smbepGreetingUserName]]));
      TakeGreeting(Msg.Params[smbepGreetingUserName], Msg.Params[smbepGreetingDisplayName]);
    end;
    smtMessage:
    begin
      Log(ltInfo, Format(rsMessageReceived, [Msg.Params[smbepMessageUserName]]));
      TakeMessage(Msg.Params[smbepMessageUserName], Msg.Params[smbepMessageText], Msg.Params[smbepMessageKind]);
    end;
    smtConnection:
    begin
      Log(ltInfo, Format(rsConnectionReceived, [Msg.Params[smbepConnectionUserName]]));
      TakeConnection(Msg.Params[smbepConnectionUserName], Msg.Params[smbepConnectionDisplayName]);
    end;
    smtDisconnection:
    begin
      Log(ltInfo, Format(rsDisconnectionReceived, [Msg.Params[smbepDisconnectionUserName]]));
      TakeDisconnection(Msg.Params[smbepDisconnectionUserName], Msg.Params[smbepDisconnectionDisplayName]);
    end;
  end;
end;

procedure TClientForm.RequestTimeoutTimer(Sender: TObject);
begin
  RequestTimeout.Enabled := False;
  FreeAndNil(WaitingRequest);

  Log(ltError, rsRequestTimeout);

  SetControls;
  
  ErrorMsg(rsRequestTimeout);

  ProcessRequestQueue;  
end;

procedure TClientForm.SetControls;
begin
  ConnectMI.Enabled := not Connected;
  DisconnectMI.Enabled := Connected;
  RegisterMI.Enabled := Connected;
  AuthorizeMI.Enabled := Connected;
  AddContactMI.Enabled := Authorized;
  GetTimeMI.Enabled := Connected;
  ChangeDisplayNameMI.Enabled := Authorized;
  ChangePasswordMI.Enabled := Authorized;

  AddContactToolButton.Enabled := Authorized;
  GetTimeToolButton.Enabled := Connected;
  ChangeDisplayNameToolButton.Enabled := Authorized;
  ChangePasswordToolButton.Enabled := Authorized;

  if Connected then
  begin
    if Authorized then
    begin
      if Assigned(Owner) then
      begin
        SetStatusText(Format(rsAuthorizedInfo, [Owner.DisplayName, OnlineCount, OfflineCount + OnlineCount]));
      end
      else
      begin
        SetStatusText(rsWaitingForGreeting);
      end;
    end
    else
    begin
      SetStatusText(Format(rsStatusConnected, [ClientSocket.Address, ClientSocket.Port]));
    end;
  end
  else
  begin
    SetStatusText(rsStatusDisconnected);
  end;
end;

procedure TClientForm.ClientSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  ConnectionTimeout.Enabled := False;

  Connected := True;

  ReconnectionTimeout.Enabled := False;

  if Assigned(WaitingRequest) then
  begin
    FreeAndNil(WaitingRequest);
  end;
    
  SendedRequestCount := 0;

  Log(ltInfo, rsConnected);

  SetControls;

  if Settings.AutoAuthorize then
  begin
    Authorize;
  end;  
end;

procedure TClientForm.ClientSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Connected := False;
  Authorized := False;

  ReconnectionTimeout.Enabled := NeedForReconnection;

  Log(ltInfo, rsDisconnected);

  SetControls;

  ClearUsersListView;
end;

procedure TClientForm.ConnectMIClick(Sender: TObject);
begin
  Connect;
end;

procedure TClientForm.Disconnect;
begin
  Log(ltInfo, rsDisconnecting);

  NeedForReconnection := False;

  ClientSocket.Close;
end;

procedure TClientForm.DisconnectMIClick(Sender: TObject);
begin
  Disconnect;
end;

procedure TClientForm.ConnectionTimeoutTimer(Sender: TObject);
begin
  ConnectionTimeout.Enabled := False;
  ClientSocket.Close;

  Log(ltError, rsConnectionTimeout);
  SetStatusText(rsConnectionTimeout);
end;

procedure TClientForm.WaitAnswer(Msg: TClientMessage);
begin
  if not Assigned(WaitingRequest) then
  begin
    WaitingRequest := Msg;

    case WaitingRequest.MessageType of
      cmtTimeRequest: SetStatusText(rsStatusTimeRequest);
      cmtRegistration: SetStatusText(rsStatusRegistration);
      cmtAuthorization: SetStatusText(rsStatusAuthorization);
      cmtMessage: SetStatusText(rsStatusMessage);
      cmtInclusion: SetStatusText(rsStatusInclusion);
      cmtExclusion: SetStatusText(rsStatusExclusion);
      cmtPasswordChanging: SetStatusText(rsStatusPasswordChanging);
      cmtDisplayNameChanging: SetStatusText(rsStatusDisplayNameChanging);
    end;

    WaitingRequest.Send(ClientSocket.Socket);

    Inc(SendedRequestCount);

    RequestTimeout.Enabled := True;

    Log(ltInfo, Format(rsWaitingForAnswer, [SendedRequestCount]));
  end;
end;

procedure TClientForm.TakeTimeStamp(const DateTime: string);
var
  Year, Month, Day, Hour, Minute, Second: Integer;
begin
  SetControls;

  Year := StrToInt(Copy(DateTime, tsepYear, tselYear));
  Month := StrToInt(Copy(DateTime, tsepMonth, tselMonth));
  Day := StrToInt(Copy(DateTime, tsepDay, tselDay));
  Hour := StrToInt(Copy(DateTime, tsepHour, tselHour));
  Minute := StrToInt(Copy(DateTime, tsepMinute, tselMinute));
  Second := StrToInt(Copy(DateTime, tsepSecond, tselSecond));

  InfoMsg(Format(rsTimeStamp, [DateTimeToStr(EncodeDateTime(Year, Month, Day, Hour, Minute, Second, 0))]));
end;

procedure TClientForm.SendTimeRequest;
var
  MessageType: TClientMessageType;
  Params: TStrings;
  Msg: TClientMessage;
begin
  MessageType := cmtTimeRequest;

  SetLength(Params, cmbpcTimeRequest);

  try
    Msg := TClientMessage.Create(MessageType, Params);
    RequestQueue.Push(Msg);
    ProcessRequestQueue;
  except
    on E: Exception do
    begin
      Log(ltError, rsTimeRequestError + Space + E.Message);
      ErrorMsg(rsTimeRequestError + LineBreak + E.Message);
    end;
  end;
end;

procedure TClientForm.GetTimeMIClick(Sender: TObject);
begin
  GetTime;
end;

procedure TClientForm.AcceptError(const Num: string; const ErrCode: string);
var
  ErrText: string;
begin
  if (Num <> EmptyStr) and (ErrCode <> EmptyStr) then
  begin
    if (StrConsistsOfChars(Num, DecCharSet) and StrConsistsOfChars(ErrCode, DecCharSet))
    then
    begin
      if SendedRequestCount = StrToInt(Num) then
      begin
        if Assigned(WaitingRequest) then
        begin
          RequestTimeout.Enabled := False;

          FreeAndNil(WaitingRequest);

          ErrText := rsErrorUnknown;
          if ErrCode = ecBadUserName then ErrText := rsErrorBadUserName;
          if ErrCode = ecUserAlreadyRegistered then ErrText := rsErrorUserAlreadyRegistered;
          if ErrCode = ecUserNotRegistered then ErrText := rsErrorUserNotRegistered;
          if ErrCode = ecWrongPassword then ErrText := rsErrorWrongPassword;
          if ErrCode = ecAuthorizationRequired then ErrText := rsErrorAuthorizationRequired;
          if ErrCode = ecUserNotConnected then ErrText := rsErrorUserNotConnected;
          if ErrCode = ecUserAlreadyInContactList then ErrText := rsErrorUserAlreadyInContactList;
          if ErrCode = ecUserNotExistsInContactList then ErrText := rsErrorUserNotExistsInContactList;
          if ErrCode = ecCanNotAddSelfToContactList then ErrText := rsErrorCanNotAddSelfToContactList;
          if ErrCode = ecMessageKindNotSupported then ErrText := rsErrorMessageKindNotSupported;
          if ErrCode = ecMessageBodyEmpty then ErrText := rsErrorMessageBodyEmpty;
          if ErrCode = ecServerRuntimeException then ErrText := rsErrorServerRuntimeException;

          Log(ltError, ErrText);

          SetControls;

          ErrorMsg(ErrText);

          ProcessRequestQueue;
        end;
      end;
    end
    else
    begin
      Log(ltWarning, rsErrorWrongFormat);
    end;
  end
  else
  begin
    Log(ltWarning, rsErrorEmpty);
  end;
end;

procedure TClientForm.GetTime;
begin
  Log(ltInfo, rsTimeRequest);

  SendTimeRequest;
end;

procedure TClientForm.AuthorizeMIClick(Sender: TObject);
begin
  Authorize;
end;

procedure TClientForm.LogMIClick(Sender: TObject);
begin
  ShowLog;
end;

procedure TClientForm.Log(const LogType: TLogType;
  const LogText: string);
var
  LogPrefix: string;
begin
  if (LogType <> ltDebug) or Settings.Debug then
  begin
    case LogType of
      ltInfo: LogPrefix := rsLogInfoPrefix;
      ltWarning: LogPrefix := rsLogWarningPrefix;
      ltError: LogPrefix := rsLogErrorPrefix;
      ltDebug: LogPrefix := rsLogDebugPrefix;
    end;

    with LogForm do
    begin
      LogMemo.Lines.Add(Format(rsLogStr, [FormatDateTime(rsLogDateTimeFormat, Now), LogPrefix, LogText]));
    end;
  end;
end;

procedure TClientForm.AcceptAcknowledgement(const Num: string);
var
  Item: TListItem;
begin
  if Num <> EmptyStr then
  begin
    if StrConsistsOfChars(Num, DecCharSet) then
    begin
      if SendedRequestCount = StrToInt(Num) then
      begin
        if Assigned(WaitingRequest) then
        begin
          RequestTimeout.Enabled := False;

          case WaitingRequest.MessageType of
            cmtRegistration:
            begin
              SetControls;

              if QuestionMsg(Format(rsUseRegisteredUser, [WaitingRequest.Params[cmbepRegistrationUserName]])) = IDYES then
              begin
                Settings.UserName := WaitingRequest.Params[cmbepRegistrationUserName];
                Settings.Password := WaitingRequest.Params[cmbepRegistrationPassword];

                if Settings.AutoAuthorize then
                begin
                  Authorize;
                end;  
              end;
            end;
            cmtAuthorization:
            begin
              Authorized := True;

              SetControls;
            end;
            cmtExclusion:
            begin
              Item := UserListItemByUserName(WaitingRequest.Params[cmbepExclusionUserName]);

              if Item.StateIndex = usxConnected then Dec(OnlineCount);
              if Item.StateIndex = usxDisconnected then Dec(OfflineCount);

              Item.Delete;

              SetControls;
            end;
            cmtMessage:
            begin
              AddMessageToList(Owner, WaitingRequest.Params[cmbepMessageText]);

              SetControls;
            end;
            cmtPasswordChanging:
            begin
              Settings.Password := WaitingRequest.Params[cmbepPasswordChangingNewPassword];
              Settings.Write(SettingsFileName);

              Log(ltInfo, rsPasswordChanged);

              SetControls;

              InfoMsg(rsPasswordChanged);
            end;
            cmtDisplayNameChanging:
            begin
              Owner.DisplayName := WaitingRequest.Params[cmbepDisplayNameChangingNewDisplayName];

              Log(ltInfo, rsDisplayNameChanged);

              SetControls;

              InfoMsg(rsDisplayNameChanged);
            end;
          end;

          FreeAndNil(WaitingRequest);

          ProcessRequestQueue;
        end;
      end;
    end
    else
    begin
      Log(ltWarning, rsAcknowledgementWrongFormat);
    end;
  end
  else
  begin
    Log(ltWarning, rsAcknowledgementEmpty);
  end;
end;

procedure TClientForm.RegisterAccount;
var
  UserName, Password, DisplayName: string;
begin
  with TNewAccountForm.Create(Self) do
  begin
    try
      ShowModal;

      if ModalResult = mrOk then
      begin
        UserName := UserNameEdit.Text;
        Password := PasswordEdit.Text;
        DisplayName := DisplayNameEdit.Text;

        Log(ltInfo, Format(rsRegistration, [UserName, DisplayName]));

        SendRegistrationRequest(UserName, Password, DisplayName);
      end;
    finally
      Free;
    end;  
  end;
end;

procedure TClientForm.SendRegistrationRequest(const UserName: string;
  const Password: string; const DisplayName: string);
var
  MessageType: TClientMessageType;
  Params: TStrings;
  Msg: TClientMessage;
begin
  MessageType := cmtRegistration;

  SetLength(Params, cmbpcRegistration);
  Params[cmbepRegistrationUserName] := UserName;
  Params[cmbepRegistrationPassword] := Password;
  Params[cmbepRegistrationDisplayName] := DisplayName;

  try
    Msg := TClientMessage.Create(MessageType, Params);
    RequestQueue.Push(Msg);
    ProcessRequestQueue;
  except
    on E: Exception do
    begin
      Log(ltError, rsRegistrationError + Space + E.Message);
      ErrorMsg(rsRegistrationError + LineBreak + E.Message);
    end;
  end;
end;

procedure TClientForm.RegisterMIClick(Sender: TObject);
begin
  RegisterAccount;
end;

procedure TClientForm.UserPopupMenuPopup(Sender: TObject);
begin
  if Assigned(UsersListView.Selected) then
  begin
    CreateMessageMI.Enabled := UsersListView.Selected.StateIndex = usxConnected;
    DeleteContactMI.Enabled := True;
  end
  else
  begin
    CreateMessageMI.Enabled := False;
    DeleteContactMI.Enabled := False;
  end;
end;

procedure TClientForm.AddContact;
var
  UserName: string;
begin
  with TAddContactForm.Create(Self) do
  begin
    try
      ShowModal;

      if ModalResult = mrOk then
      begin
        UserName := UserNameEdit.Text;

        Log(ltInfo, Format(rsInclusion, [UserName]));

        SendInclusionRequest(UserName);
      end;
    finally
      Free;
    end;  
  end;
end;

procedure TClientForm.DeleteContact(const UserName: string);
begin
  if QuestionMsg(Format(rsDeleteUser, [UserName])) = IDYES then
  begin
    Log(ltInfo, Format(rsExclusion, [UserName]));

    SendExclusionRequest(UserName);
  end;
end;

procedure TClientForm.SendInclusionRequest(const UserName: string);
var
  MessageType: TClientMessageType;
  Params: TStrings;
  Msg: TClientMessage;
begin
  MessageType := cmtInclusion;

  SetLength(Params, cmbpcInclusion);
  Params[cmbepInclusionUserName] := UserName;

  try
    Msg := TClientMessage.Create(MessageType, Params);
    RequestQueue.Push(Msg);
    ProcessRequestQueue;
  except
    on E: Exception do
    begin
      Log(ltError, rsInclusionError + Space + E.Message);
      ErrorMsg(rsInclusionError + LineBreak + E.Message);
    end;
  end;
end;

procedure TClientForm.AddContactMIClick(Sender: TObject);
begin
  AddContact;
end;

procedure TClientForm.TakeConnection(const UserName: string;
  const DisplayName: string);
var
  Item: TListItem;
  User: TUser;
begin
  if (UserName <> EmptyStr) and (DisplayName <> EmptyStr) then
  begin
    Item := UserListItemByUserName(UserName);

    if not Assigned(Item) then
    begin
      // user not in list
      Item := CreateUserListItem(UserName, DisplayName);
      Inc(OnlineCount);
    end
    else
    begin
      // user already in list
      User := Item.Data;
      User.DisplayName := DisplayName;

      if Item.StateIndex <> usxConnected then
      begin
        Inc(OnlineCount);
        Dec(OfflineCount);
      end;
    end;

    Item.StateIndex := usxConnected;

    SetControls;
  end
  else
  begin
    Log(ltWarning, rsConnectionEmpty);
  end;
end;

procedure TClientForm.TakeDisconnection(const UserName: string;
  const DisplayName: string);
var
  Item: TListItem;
  User: TUser;
begin
  if (UserName <> EmptyStr) and (DisplayName <> EmptyStr) then
  begin
    Item := UserListItemByUserName(UserName);

    if not Assigned(Item) then
    begin
      // user not in list
      Item := CreateUserListItem(UserName, DisplayName);
      Inc(OfflineCount);
    end
    else
    begin
      // user already in list
      User := Item.Data;
      User.DisplayName := DisplayName;

      if Item.StateIndex <> usxDisconnected then
      begin
        Inc(OfflineCount);
        Dec(OnlineCount);
      end;
    end;

    Item.StateIndex := usxDisconnected;

    SetControls;
  end
  else
  begin
    Log(ltWarning, rsDisconnectionEmpty);
  end;
end;

function TClientForm.UserListItemByUserName(const UserName: string): TListItem;
var
  ItemCounter: Integer;
  Item: TListItem;
  User: TUser;
begin
  Item := nil;

  if UsersListView.Items.Count > 0 then
  begin
    for ItemCounter := 0 to UsersListView.Items.Count - 1 do
    begin
      User := UsersListView.Items[ItemCounter].Data;

      if User.UserName = UserName then
      begin
        Item := UsersListView.Items[ItemCounter];
        Break;
      end;
    end;
  end;

  Result := Item;
end;

function TClientForm.CreateUserListItem(const UserName: string;
  const DisplayName: string): TListItem;
var
  User: TUser;
  Item: TListItem;
begin
  User := TUser.Create(UserName, DisplayName);

  Item := UsersListView.Items.Add;
  Item.Caption := DisplayName;
  Item.SubItems.Add(UserName);
  Item.Data := User;

  Result := Item;
end;

{ TUser }

constructor TUser.Create(const UserName: string;
  const DisplayName: string);
begin
  FUserName := UserName;
  FDisplayName := DisplayName;
end;

procedure TClientForm.ConnectionSettingsMIClick(Sender: TObject);
begin
  EditConnectionSettings;
end;

procedure TClientForm.TakeMessage(const UserName: string;
  const MessageText: string; const MessageKind: string);
var
  Item: TListItem;
  AutoAnswerText: string;
begin
  if (MessageText <> EmptyStr) and (MessageKind <> EmptyStr) then
  begin
    Item := UserListItemByUserName(UserName);

    if Assigned(Item) then
    begin
      AddMessageToList(Item.Data, MessageText);

      if Settings.AutoAnswer then
      begin
        if MessageKind = mkSimple then
        begin
          Inc(NewMessageCount);
          TrayIcon.Icon := TrayMsgIcon;
          TrayIcon.Hint := Format(rsTrayIconHint, [Settings.ApplicationTitle, NewMessageCount]);

          with TStringList.Create do
          begin
            try
              try
                LoadFromFile(ProgramPath + AutoAnswerFileName);
                AutoAnswerText := Text;
              finally
                Free;
              end;
            except
              on E: Exception do
              begin
                Log(ltError, rsAutoAnswerReadingError + Space + E.Message);
                ErrorMsg(rsAutoAnswerReadingError + LineBreak + E.Message);

                AutoAnswerText := EmptyStr;
              end;
            end;

            if AutoAnswerText <> EmptyStr then
            begin
              if Length(AutoAnswerText) <= MaxMessageLength then
              begin
                CreateMessage(Item.Data, AutoAnswerText, mkAutoAnswer);
              end
              else
              begin
                Log(ltError, rsAutoAnswerExceedsLimit);
                ErrorMsg(rsAutoAnswerExceedsLimit);
              end;
            end;
          end;
        end;
      end
      else
      begin
        DisplayMessage(Item.Data, MessageText, MessageKind);
      end;
    end;
  end
  else
  begin
    Log(ltWarning, rsMessageEmpty);
  end;
end;

procedure TClientForm.SendMessage(const UserName: string;
  const MessageText: string; const MessageKind: string);
var
  MessageType: TClientMessageType;
  Params: TStrings;
  Msg: TClientMessage;
begin
  MessageType := cmtMessage;

  SetLength(Params, cmbpcMessage);
  Params[cmbepMessageUserName] := UserName;
  Params[cmbepMessageText] := MessageText;
  Params[cmbepMessageKind] := MessageKind;

  try
    Msg := TClientMessage.Create(MessageType, Params);
    RequestQueue.Push(Msg);
    ProcessRequestQueue;
  except
    on E: Exception do
    begin
      Log(ltError, rsMessageError + Space + E.Message);
      ErrorMsg(rsMessageError + LineBreak + E.Message);
    end;
  end;
end;

procedure TClientForm.CreateMessage(Receiver: TUser;
  const MessageText: string; const MessageKind: string);
begin
  Log(ltInfo, Format(rsMessage, [Receiver.UserName]));

  SendMessage(Receiver.UserName, MessageText, MessageKind);
end;

procedure TClientForm.CreateMessageMIClick(Sender: TObject);
begin
  AskMessage(UsersListView.Selected.Data);
end;

procedure TClientForm.SendExclusionRequest(const UserName: string);
var
  MessageType: TClientMessageType;
  Params: TStrings;
  Msg: TClientMessage;
begin
  MessageType := cmtExclusion;

  SetLength(Params, cmbpcExclusion);
  Params[cmbepExclusionUserName] := UserName;

  try
    Msg := TClientMessage.Create(MessageType, Params);
    RequestQueue.Push(Msg);
    ProcessRequestQueue;
  except
    on E: Exception do
    begin
      Log(ltError, rsExclusionError + Space + E.Message);
      ErrorMsg(rsExclusionError + LineBreak + E.Message);
    end;
  end;
end;

procedure TClientForm.DeleteContactMIClick(Sender: TObject);
var
  User: TUser;
begin
  User := UsersListView.Selected.Data;
  DeleteContact(User.UserName);
end;

procedure TClientForm.AutoConnectMIClick(Sender: TObject);
begin
  AutoConnectMI.Checked := not AutoConnectMI.Checked;
  AutoConnectSelect(AutoConnectMI.Checked);
end;

procedure TClientForm.AutoAuthorizeMIClick(Sender: TObject);
begin
  AutoAuthorizeMI.Checked := not AutoAuthorizeMI.Checked;
  AutoAuthorizeSelect(AutoAuthorizeMI.Checked);
end;

procedure TClientForm.ClientSocketError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
var
  Error: string;
begin
  ConnectionTimeout.Enabled := False;

  Error := Number + IntToStr(ErrorCode);
  ErrorCode := 0;

  ReconnectionTimeout.Enabled := not Connected and NeedForReconnection;

  Log(ltError, Format(rsConnectionError, [Error]));
  SetStatusText(Format(rsConnectionError, [Error]));

  SetControls;
end;

procedure TClientForm.UserSettingsMIClick(Sender: TObject);
begin
  EditUserSettings;
end;

procedure TClientForm.ClearUsersListView;
begin
  UsersListView.Items.Clear;

  OfflineCount := 0;
  OnlineCount := 0;
end;

procedure TClientForm.ProcessRequestQueue;
var
  Msg: TClientMessage;
begin
  if RequestQueue.Count > 0 then
  begin
    if not Assigned(WaitingRequest) then
    begin
      Msg := RequestQueue.Pop;
      WaitAnswer(Msg);
    end;  
  end;
end;

procedure TClientForm.ExitMIClick(Sender: TObject);
begin
  Exit
end;

procedure TClientForm.TrayExitMIClick(Sender: TObject);
begin
  ExitProgram;
end;

procedure TClientForm.TrayShowChatMIClick(Sender: TObject);
begin
  ShowChat;
end;

procedure TClientForm.TrayIconDblClick(Sender: TObject);
begin
  ShowChat;
end;

procedure TClientForm.ShowChat;
begin
  Application.Restore;
  Show;
  SetForegroundWindow(Handle);
end;

procedure TClientForm.AskMessage(Receiver: TUser);
var
  MessageText: string;
begin
  with TNewMessageForm.Create(Self) do
  begin
    try
      Caption := Format(rsNewMessageCaption, [Receiver.DisplayName]);
      SetMaxMessageLength(MaxMessageLength);

      ShowModal;

      if ModalResult = mrOk then
      begin
        MessageText := MessageTextMemo.Text;

        CreateMessage(Receiver, MessageText, mkSimple);
      end;
    finally
      Free;
    end;
  end;
end;

procedure TClientForm.AddMessageToList(User: TUser;
  const MessageText: string);
var
  MessagePrefix: string;
begin
  if User.UserName = Owner.UserName then
  begin
    MessagePrefix := rsMessageListOutgoingPrefix;
  end
  else
  begin
    MessagePrefix := rsMessageListIncomingPrefix;
  end;

  if not Assigned(MessageListForm) then
  begin
    MessageListForm := TMessageListForm.Create(Self);
  end;  

  with MessageListForm do
  begin
    if MessageListMemo.Lines.Count > 0 then
    begin
      MessageListMemo.Lines.Add(EmptyStr);
    end;  

    MessageListMemo.Lines.Add(Format(rsMessageListEntryHeader, [MessagePrefix, FormatDateTime(rsMessageListDateTimeFormat, Now), User.DisplayName]));
    MessageListForm.MessageListMemo.Lines.Add(MessageText);
  end;
end;

procedure TClientForm.ShowMessageList;
begin
  if not Assigned(MessageListForm) then
  begin
    MessageListForm := TMessageListForm.Create(Self);
  end;  

  with MessageListForm do
  begin
    if not Visible then
    begin
      Show;
    end;
  end;

  NewMessageCount := 0;
  TrayIcon.Icon := TrayEmptyIcon;
  TrayIcon.Hint := Settings.ApplicationTitle;
end;

procedure TClientForm.MessageListMIClick(Sender: TObject);
begin
  ShowMessageList;
end;

procedure TClientForm.DisplayMessage(Sender: TUser;
  const MessageText: string; const MessageKind: string);
begin
  with TReceivedMessageForm.Create(Self) do
  begin
    try
      if MessageKind = mkSimple then Caption := Format(rsReceivedMessageCaption, [Sender.DisplayName]);
      if MessageKind = mkAutoAnswer then Caption := Format(rsReceivedAutoAnswerCaption, [Sender.DisplayName]);

      MessageTextMemo.Text := MessageText;

      ShowModal;

      if AnswerNeeded then
      begin
        AskMessage(Sender);
      end;
    finally
      Free;
    end;  
  end;
end;

procedure TClientForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caNone;
  Application.Minimize;
end;

procedure TClientForm.ApplicationMinimize(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TClientForm.LaunchMinimizedMIClick(Sender: TObject);
begin
  LaunchMinimizedMI.Checked := not LaunchMinimizedMI.Checked;
  LaunchMinimizedSelect(LaunchMinimizedMI.Checked);
end;

procedure TClientForm.TakeGreeting(const UserName: string;
  const DisplayName: string);
begin
  if (UserName <> EmptyStr) and (DisplayName <> EmptyStr) then
  begin
    if not Assigned(Owner) then
    begin
      if UserName = Settings.UserName then
      begin
        Owner := TUser.Create(UserName, DisplayName);

        SetControls;
      end;
    end;
  end
  else
  begin
    Log(ltWarning, rsGreetingEmpty);
  end;
end;

procedure TClientForm.AutoAnswerMIClick(Sender: TObject);
begin
  AutoAnswerMI.Checked := not AutoAnswerMI.Checked;
  AutoAnswerSelect(AutoAnswerMI.Checked);
end;

procedure TClientForm.TrayMessageListMIClick(Sender: TObject);
begin
  ShowMessageList;
end;

procedure TClientForm.ChangePassword;
var
  CurrentPassword: string;
  NewPassword: string;
begin
  with TChangePasswordForm.Create(Self) do
  begin
    try
      ShowModal;

      if ModalResult = mrOk then
      begin
        CurrentPassword := CurrentPasswordEdit.Text;
        NewPassword := NewPasswordEdit.Text;

        Log(ltInfo, rsPasswordChanging);

        SendChangePasswordRequest(CurrentPassword, NewPassword);
      end;
    finally
      Free;
    end;  
  end;
end;

procedure TClientForm.SendChangePasswordRequest(const CurrentPassword,
  NewPassword: string);
var
  MessageType: TClientMessageType;
  Params: TStrings;
  Msg: TClientMessage;
begin
  MessageType := cmtPasswordChanging;

  SetLength(Params, cmbpcPasswordChanging);
  Params[cmbepPasswordChangingPassword] := CurrentPassword;
  Params[cmbepPasswordChangingNewPassword] := NewPassword;

  try
    Msg := TClientMessage.Create(MessageType, Params);
    RequestQueue.Push(Msg);
    ProcessRequestQueue;
  except
    on E: Exception do
    begin
      Log(ltError, rsPasswordChangingError + Space + E.Message);
      ErrorMsg(rsPasswordChangingError + LineBreak + E.Message);
    end;
  end;
end;

procedure TClientForm.ChangePasswordMIClick(Sender: TObject);
begin
  ChangePassword;
end;

procedure TClientForm.ChangeDisplayName;
var
  CurrentPassword: string;
  NewDisplayName: string;
begin
  with TChangeDisplayNameForm.Create(Self) do
  begin
    try
      ShowModal;

      if ModalResult = mrOk then
      begin
        CurrentPassword := CurrentPasswordEdit.Text;
        NewDisplayName := NewDisplayNameEdit.Text;

        Log(ltInfo, Format(rsDisplayNameChanging, [NewDisplayName]));

        SendChangeDisplayNameRequest(CurrentPassword, NewDisplayName);
      end;
    finally
      Free;
    end;  
  end;
end;

procedure TClientForm.ChangeDisplayNameMIClick(Sender: TObject);
begin
  ChangeDisplayName;
end;

procedure TClientForm.SendChangeDisplayNameRequest(
  const CurrentPassword: string; const NewDisplayName: string);
var
  MessageType: TClientMessageType;
  Params: TStrings;
  Msg: TClientMessage;
begin
  MessageType := cmtDisplayNameChanging;

  SetLength(Params, cmbpcDisplayNameChanging);
  Params[cmbepDisplayNameChangingPassword] := CurrentPassword;
  Params[cmbepDisplayNameChangingNewDisplayName] := NewDisplayName;

  try
    Msg := TClientMessage.Create(MessageType, Params);
    RequestQueue.Push(Msg);
    ProcessRequestQueue;
  except
    on E: Exception do
    begin
      Log(ltError, rsDisplayNameChangingError + Space + E.Message);
      ErrorMsg(rsDisplayNameChangingError + LineBreak + E.Message);
    end;
  end;
end;

procedure TClientForm.ReconnectionTimeoutTimer(Sender: TObject);
begin
  Connect;
end;

procedure TClientForm.ClientSocketConnecting(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  ConnectionTimeout.Enabled := True;

  NeedForReconnection := True;

  ReconnectionTimeout.Interval := ConnectionTimeout.Interval * ReconnectionTimeoutCoefficient;
  ReconnectionTimeout.Enabled := False;

  Log(ltInfo, Format(rsConnecting, [Settings.ServerAddress, Settings.ServerPort]));
  SetStatusText(Format(rsStatusConnecting, [Settings.ServerAddress, Settings.ServerPort]));
end;

procedure TClientForm.UsersListViewDblClick(Sender: TObject);
begin
  if Assigned(UsersListView.Selected) then
  begin
    if UsersListView.Selected.StateIndex = usxConnected then
    begin
      AskMessage(UsersListView.Selected.Data);
    end;
  end;
end;

procedure TClientForm.AddContactToolButtonClick(Sender: TObject);
begin
  AddContact;
end;

procedure TClientForm.GetTimeToolButtonClick(Sender: TObject);
begin
  GetTime;
end;

procedure TClientForm.MessageListToolButtonClick(Sender: TObject);
begin
  ShowMessageList;
end;

procedure TClientForm.ChangeDisplayNameToolButtonClick(Sender: TObject);
begin
  ChangeDisplayName;
end;

procedure TClientForm.ChangePasswordToolButtonClick(Sender: TObject);
begin
  ChangePassword;
end;

procedure TClientForm.ExitProgram;
begin
  Application.Terminate;
end;

procedure TClientForm.ShowStatusBarSelect(const Selected: Boolean);
begin
  StatusBar.Visible := Selected;

  Settings.ShowStatusBar := Selected;
  Settings.Write(SettingsFileName);
end;

procedure TClientForm.LaunchMinimizedSelect(const Selected: Boolean);
begin
  Settings.LaunchMinimized := LaunchMinimizedMI.Checked;
  Settings.Write(SettingsFileName);
end;

procedure TClientForm.EditConnectionSettings;
begin
  with TConnectionSettingsForm.Create(Self) do
  begin
    try
      ServerAddressEdit.Text := Settings.ServerAddress;
      ServerPortEdit.Text := IntToStr(Settings.ServerPort);
      ConnectionTimeoutEdit.Text := IntToStr(Settings.ConnectionTimeout);
      RequestTimeoutEdit.Text := IntToStr(Settings.RequestTimeout);

      ShowModal;

      if ModalResult = mrOk then
      begin
        Log(ltInfo, rsConnectionSettingsChanged);

        Settings.ServerAddress := ServerAddressEdit.Text;
        Settings.ServerPort := StrToInt(ServerPortEdit.Text);
        Settings.ConnectionTimeout := StrToInt(ConnectionTimeoutEdit.Text);
        Settings.RequestTimeout := StrToInt(RequestTimeoutEdit.Text);

        Settings.Write(SettingsFileName);

        if QuestionMsg(rsUseConnectionSettings) = IDYES	then
        begin
          if Connected then
          begin
            Disconnect;
          end;

          Connect;
        end;
      end;
    finally
      Free;
    end;  
  end;
end;

procedure TClientForm.EditUserSettings;
begin
  with TUserSettingsForm.Create(Self) do
  begin
    try
      UserNameEdit.Text := Settings.UserName;
      PasswordEdit.Text := Settings.Password;

      ShowModal;

      if ModalResult = mrOk then
      begin
        Log(ltInfo, rsAccountSettingsChanged);

        Settings.UserName := UserNameEdit.Text;
        Settings.Password := PasswordEdit.Text;

        Settings.Write(SettingsFileName);

        if ClientSocket.Active then
        begin
          if Settings.AutoAuthorize then
          begin
            Authorize;
          end;
        end;
      end;
    finally
      Free;
    end;  
  end;
end;

procedure TClientForm.AutoAnswerSelect(const Selected: Boolean);
begin
  if Selected then
  begin
    with TNewMessageForm.Create(Self) do
    begin
      try
        Caption := rsAutoAnswerCaption;
        SetMaxMessageLength(MaxMessageLength);

        if FileExists(ProgramPath + AutoAnswerFileName) then
        begin
          try
            LoadMessageText(ProgramPath + AutoAnswerFileName);
          except
            on E: Exception do
            begin
              Log(ltError, rsAutoAnswerReadingError + Space + E.Message);
              ErrorMsg(rsAutoAnswerReadingError + LineBreak + E.Message);
            end;
          end;
        end;

        ShowModal;

        if ModalResult = mrOk then
        begin
          try
            SaveMessageText(ProgramPath + AutoAnswerFileName);

            Settings.AutoAnswer := True;

            Settings.Write(SettingsFileName);
          except
            on E: Exception do
            begin
              Log(ltError, rsAutoAnswerSettingError + Space + E.Message);
              ErrorMsg(rsAutoAnswerSettingError + LineBreak + E.Message);
            end;
          end;
        end;
      finally
        Free;
      end;
    end;
  end
  else
  begin
    Settings.AutoAnswer := False;
    Settings.Write(SettingsFileName);
  end;
end;

procedure TClientForm.ShowLog;
begin
  if not Assigned(LogForm) then
  begin
    LogForm := TLogForm.Create(Self);
  end;

  with LogForm do
  begin
    if not Visible then
    begin
      Show;
    end;
  end;
end;

procedure TClientForm.AutoAuthorizeSelect(const Selected: Boolean);
begin
  Settings.AutoAuthorize := AutoAuthorizeMI.Checked;
  Settings.Write(SettingsFileName);
end;

procedure TClientForm.AutoConnectSelect(const Selected: Boolean);
begin
  Settings.AutoConnect := AutoConnectMI.Checked;
  Settings.Write(SettingsFileName);
end;

procedure TClientForm.ShowAbout;
begin
  InfoMsg(Format(rsVersion, [Version.Major, Version.Minor, Version.Release, Version.Build]));
end;

end.

