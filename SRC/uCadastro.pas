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

// Retorna 1 se o nome n�o foi encontrado
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

// VERIFICA SE TEM ESPA�O
// SE RETORNA -1 N�O ENCONTROU ESPA�O
// SEN�O A POSI��O RETORNADA SER� A POSI��O A SER UTILIZADA
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
        // PERGUNTAR SE O NOME � VALIDO
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
                  ShowMessage('Usu�rio cadastrado com sucesso!');

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
                   ShowMessage('O nome de usu�rio (login) � v�lido mas as senhas s�o diferentes!');
                   break;
                end;
             end
             else
             begin
               ShowMessage('N�mero m�ximo de login cadastrados foi atingido!');
               Exit;
             end;

        END
        ELSE
        BEGIN
          ShowMessage('O nome de usu�rio (login) j� cadastrado!');
          Exit;
        END;

    END;
    Inc(i);
  END;

  if(flag = 0) THEN
  BEGIN
      ShowMessage('O n�mero m�ximo de usu�rios foi atingido!');
      frmCadastro.Close();
      exit;
  END;

end;

end.
