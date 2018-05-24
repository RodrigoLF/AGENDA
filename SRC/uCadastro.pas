unit uCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmCadastro = class(TForm)
    GroupBox1: TGroupBox;
    edcadusuario: TEdit;
    edcadsenha: TEdit;
    edcadsenha2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btCad: TButton;
    procedure btCadClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;



var
  frmCadastro: TfrmCadastro;
implementation

{$R *.dfm}

uses uLogin;

// Retorna 1 se o nome não foi encontrado
function perguntaNome(nome : STRING):INTEGER;
var
  i: integer;
BEGIN
   i:=0;
   WHILE(i <= 100) DO
   BEGIN

      IF((USUARIOS[i].usuario = nome) AND (USUARIOS[i].ocupado = true)) THEN
      BEGIN
         RESULT := 0;
         Exit;
      END;
   inc(i);
   END;

   RESULT:= 1;

END;

// VERIFICA SE TEM ESPAÇO
// SE RETORNA -1 NÃO ENCONTROU ESPAÇO
// SENÃO A POSIÇÃO RETORNADA SERÁ A POSIÇÃO A SER UTILIZADA
function verificaEspaco():INTEGER;
var
  i: Integer;
begin

  i:=0;
  while(i<=100)DO
  BEGIN

    if(USUARIOS[i].ocupado = FALSE) THEN
    BEGIN
       RESULT:= i;
       exit;
    END;
    inc(i);
  END;

  RESULT:= -1;

end;
procedure TfrmCadastro.btCadClick(Sender: TObject);
var
  i,flag: integer;
  aux: Integer;

begin
  AssignFile(flogin,'login.txt');
  i:=0;
  flag:= 0;

  if FileExists('login.txt') then
  BEGIN
    RESET(flogin);
  END
  ELSE
  BEGIN
   REWRITE(flogin);
  END;

  Seek(flogin,0);

  i:=0;
  WHILE (NOT EOF(flogin)) DO
	BEGIN

		READ(flogin,USUARIOS[i]);
		i := i + 1;

  END;

  WHILE(i <= 100) DO
  BEGIN


    IF (USUARIOS[i].ocupado = FALSE) THEN
    BEGIN
        flag:= 1;
        // PERGUNTAR SE O NOME É VALIDO
        IF( perguntaNome(edcadusuario.Text) = 1) THEN
        BEGIN
             aux := verificaEspaco();
             if(aux <> -1) THEN
             begin
                if (edcadsenha.Text = edcadsenha2.Text) then
                begin

                  USUARIOS[aux].ocupado := true;
                  USUARIOS[aux].usuario := UpperCase(edcadusuario.Text);
                  USUARIOS[aux].senha := UpperCase(edcadsenha.Text);
                  ShowMessage('Usuário cadastrado com sucesso!');

                  REWRITE(flogin);
                  i := 0;
                  WHILE i < 100 DO
                  BEGIN

                    IF ( USUARIOS[i].ocupado = TRUE) THEN
                    BEGIN
                      WRITE(flogin, USUARIOS[i]);
                    END;
                    i := i + 1;
                  END;
                  CLOSEFILE(flogin);
                  frmCadastro.Close();
                  break;
                end
                else
                begin
                   ShowMessage('O nome de usuário (login) é válido mas as senhas são diferentes!');
                   break;
                end;
             end
             else
             begin
               ShowMessage('Número máximo de login cadastrados foi atingido!');
               Exit;
             end;

        END
        ELSE
        BEGIN
          ShowMessage('O nome de usuário (login) já cadastrado!');
          Exit;
        END;

    END;
    Inc(i);
  END;

  if(flag = 0) THEN
  BEGIN
      ShowMessage('O número máximo de usuários foi atingido!');
      frmCadastro.Close();
      exit;
  END;

end;

end.
