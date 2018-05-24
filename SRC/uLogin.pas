unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls;

type
  TfrmLogin = class(TForm)
    GroupBox1: TGroupBox;
    btLogin: TButton;
    edusuario: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    mesenha: TMaskEdit;
    btCad: TButton;
    procedure btLoginClick(Sender: TObject);
    procedure btCadClick(Sender: TObject);
    function closeReadLoginFile() : Integer;
    function openReadLoginFile():INTEGER;
    function openReadScheduleFile():INTEGER;
    procedure FormCreate(Sender: TObject);
    procedure mesenhaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  type contato = record
      ocupado: BOOLEAN;
  end;

  type login = record
      usuario : string[30];
      senha : string[15];
      ocupado: BOOLEAN;
  end;

var
  frmLogin: TfrmLogin;

  flogin: file of login;
  fagenda: file of contato;

  USUARIOS: ARRAY [1..100] OF login;
  AGENDA: ARRAY [1..100] OF contato;


implementation

{$R *.dfm}

uses uAgenda, uCadastro;

procedure TfrmLogin.btLoginClick(Sender: TObject);
var
  I: Integer;
begin
       AssignFile(flogin,'login.txt');
        if FileExists('login.txt') = true   then
         begin
          Reset(flogin);
          I := 0;
          while (not(Eof(flogin))) do
            begin
            Read(flogin,USUARIOS[i]);
            Inc(i);
            end;
         end
         else
         begin
            Rewrite(flogin);
         end;
         Seek(flogin,0);
         i:= 0;
         while (not(eof(flogin))) do
         begin
         if USUARIOS[i].ocupado = true then
         begin
         if ((UpperCase(edusuario.Text) = USUARIOS[I].usuario) AND (UpperCase(mesenha.Text) = USUARIOS[I].senha))  then
             BEGIN
               frmAgenda.atualizagrid();
               frmAgenda.ShowModal;
               Exit;
             END;
             Inc(i);
         end
         ELSE
         BEGIN
           MessageDlg('Usuário não encontrado!', mtError,[mbOk], 0);
             Exit;
         END;
        end;
end;

function TfrmLogin.closeReadLoginFile(): Integer;
var
  i: Integer;
begin

    REWRITE(flogin);

    i:=0;
    WHILE(i <= 100) DO
    BEGIN

      IF(USUARIOS[i].ocupado = true) THEN
      begin

        write(flogin,USUARIOS[i]);
      end;
      inc(i);
    END;

    CloseFile(flogin);

end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  edusuario.Text := #0;
  mesenha.Text := #0;
end;

procedure TfrmLogin.mesenhaKeyPress(Sender: TObject; var Key: Char);
begin
    if (GetKeyState(VK_BACK) < 0) AND (GetKeyState(VK_CONTROL) < 0) then
  begin
     mesenha.clear;
     edusuario.clear;
  end;
end;

function TfrmLogin.openReadScheduleFile():INTEGER;
var
  i: Integer;
begin

    // Inicializa estrutura que guarda o agenda (contatos) dos usuários
    i:=0;
    WHILE(i <=100) DO
    BEGIN

      AGENDA[i].ocupado := FALSE;
      inc(i);
    END;

    // Vinculação e abertura de arquivo de agenda
    AssignFile(fagenda,'agenda.txt');

    IF(FileExists('agenda.txt')) THEN
    BEGIN
      RESET(fagenda);
    END
    ELSE
    BEGIN
      REWRITE(fagenda);
    END;

    SEEK(fagenda,0);

    // Realiza a leitura
    i:=0;
    WHILE(NOT EOF(fagenda)) DO
    BEGIN
      READ(fagenda,AGENDA[i]);
      i:= i+1;
    END;

end;

function TfrmLogin.openReadLoginFile():INTEGER;
var
  i: Integer;
begin

    // Inicializa estrutura que guarda o login (senha) dos usuários
    i:=0;
    WHILE(i <=100) DO
    BEGIN

      USUARIOS[i].ocupado := FALSE;
      inc(i);
    END;

    // Vinculação e abertura de arquivo de login
    AssignFile(flogin,'login.txt');

    IF(FileExists('login.txt')) THEN
    BEGIN
      RESET(flogin);
    END
    ELSE
    BEGIN
      REWRITE(flogin);
    END;

    SEEK(flogin,0);

    // Realiza a leitura
    i:=0;
    WHILE(NOT EOF(flogin)) DO
    BEGIN
      READ(flogin,USUARIOS[i]);
      inc(i);
    END;

end;


procedure TfrmLogin.btCadClick(Sender: TObject);
begin
  frmCadastro.Show;
end;

initialization
frmLogin.openReadLoginFile();
frmLogin.openReadScheduleFile();

finalization

frmLogin.closeReadLoginFile();

end.


