unit uAgenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Grids,
  Vcl.ExtCtrls, Vcl.Mask;

type
  TfrmAgenda = class(TForm)
    sgAgenda: TStringGrid;
    GroupBox1: TGroupBox;
    mainmenu: TMainMenu;
    ARQUIVO1: TMenuItem;
    INSERIR1: TMenuItem;
    N1: TMenuItem;
    sAIR1: TMenuItem;
    EDITAR1: TMenuItem;
    filtrarnome: TMenuItem;
    DELETAR1: TMenuItem;
    AJUDA1: TMenuItem;
    SOBRE1: TMenuItem;
    rgSexo: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edNome: TEdit;
    edEndereco: TEdit;
    edBairro: TEdit;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    btCadastrar: TButton;
    edIdade: TEdit;
    rgEstCiv: TRadioGroup;
    BUSCARSEXO1: TMenuItem;
    EditarContato1: TMenuItem;
    ATUALIZAR1: TMenuItem;
    edTelCom: TMaskEdit;
    edTelRes: TMaskEdit;
    edCEP: TMaskEdit;
    btEditar: TButton;
    procedure FormCreate(Sender: TObject);
    function verificaValores():BOOLEAN;
    procedure atualizagrid();
    procedure btCadastrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgAgendaClick(Sender: TObject);
    procedure sAIR1Click(Sender: TObject);
    procedure INSERIR1Click(Sender: TObject);
    procedure DELETAR1Click(Sender: TObject);
    procedure BUSCARSEXO1Click(Sender: TObject);
    procedure EditarContato1Click(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure filtrarnomeClick(Sender: TObject);
    procedure ATUALIZAR1Click(Sender: TObject);
    procedure SOBRE1Click(Sender: TObject);

  private
    { Private declarations }
  public

    { Public declarations }
  end;

type contatosagenda = record
  nome : string[30];
  idade: integer;
  telres : string[15];
  telcom : string[15];
  endereco : string [40];
  bairro : string[40];
  CEP : string[9];
  estcivi : integer;
  sexo : integer;
  ocupado: boolean;
end;

var
  frmAgenda: TfrmAgenda;
  contatos : array [0..100] of contatosagenda;
  fcontatos : file of contatosagenda;
  FLAGAGENDA : INTEGER;
  editaux : integer;
  LINHA: Integer;
   AUX : integer;
   FLAG : INTEGER;


implementation

{$R *.dfm}

uses uLogin;


procedure TfrmAgenda.atualizagrid();
var
  i,cont: Integer;
  x: Integer;
  ESTAUX,SEXOAUX: Integer;
begin
  i:= 0;
  cont := 0;
  while(i <= 100) do
  begin
    if(contatos[i].ocupado = TRUE) then
    begin
       cont := cont + 1;
    end;
    Inc(i);
  end;

  // cont+1 pois precisa considerar o cabeçalho da GRID
  sgAgenda.RowCount := cont+1;
  i:= 0;
  cont:= 1;
  while(i <= 100) do
  begin
    if(contatos[i].ocupado = TRUE) then
    begin
       sgAgenda.Cells[0,cont] := contatos[i].nome;
       sgAgenda.Cells[1,cont] := inttostr(contatos[i].idade);
       sgAgenda.Cells[2,cont] := contatos[i].telcom;
       sgAgenda.Cells[3,cont] := contatos[i].telres;
       sgAgenda.Cells[4,cont] := contatos[i].endereco;
       sgAgenda.Cells[5,cont] := contatos[i].bairro;
       sgAgenda.Cells[6,cont] := contatos[i].CEP;

        ESTAUX := contatos[i].estcivi;
        if ESTAUX = 0 then
         begin
           sgAgenda.Cells[7,cont] := 'Solteiro'
         end
         else if ESTAUX = 1 then
         begin
           sgAgenda.Cells[7,cont] := 'Casado'
         end
         else if ESTAUX = 2 then
         begin
           sgAgenda.Cells[7,cont] := 'Separado'
         end
         else if ESTAUX = 3 then
         begin
           sgAgenda.Cells[7,cont] := 'Divorciado'
         end
         else if ESTAUX = 4 then
         begin
           sgAgenda.Cells[7,cont] := 'Viúvo'
         end;

        SEXOAUX := contatos[i].sexo;
        if SEXOAUX = 0 then
         begin
           sgAgenda.Cells[8,cont] := 'Masculino'
         end
         else if SEXOAUX = 1 then
         begin
           sgAgenda.Cells[8,cont] := 'Feminino'
         end;

       cont := cont + 1;
    end;
    Inc(i);
  end;


end;


procedure TfrmAgenda.BUSCARSEXO1Click(Sender: TObject);
var
  I: Integer;
  a: Integer;
  cont: Integer;
  aux: Integer;
  AUXINPUTBOX: string;
begin
     AUXINPUTBOX := InputBox('Filtro por Sexo', ' Preencha com: ' +   #13 + '  M - Masculino '  + #13  + '  F - Feminino', '');
     LowerCase(AUXINPUTBOX);
     if AUXINPUTBOX = 'M' then
     begin
       a:= 0;
     end
     else
     begin
      a := 1;
     end;

     i:= 0;
     cont := 0;
     while(i <= 100) do
     begin
        if((contatos[i].ocupado = TRUE) and (contatos[i].sexo = a)) then
        begin
           cont := cont + 1;
        end;
        Inc(i);

     end;

     FLAG := 2;


  sgAgenda.RowCount := cont+1;


       i := 0;
       while i <= 100 do
       begin

          if ( (contatos[i].ocupado = TRUE) and (contatos[i].sexo = a) ) then
          begin
            sgAgenda.Cells[0,cont] := contatos[i].nome;
            sgAgenda.Cells[1,cont] := inttostr(contatos[i].idade);
            sgAgenda.Cells[2,cont] := contatos[i].telcom;
            sgAgenda.Cells[3,cont] := contatos[i].telres;
            sgAgenda.Cells[4,cont] := contatos[i].endereco;
            sgAgenda.Cells[5,cont] := contatos[i].bairro;
            sgAgenda.Cells[6,cont] := contatos[i].CEP;
            if contatos[i].sexo = 0  then
            begin
                sgAgenda.Cells[8, cont] := 'Masculino';
            end
            else
            begin
                sgAgenda.Cells[8, cont] := 'Feminino';
            end;

             if rgEstCiv.ItemIndex = 0 then
                sgagenda.Cells[7,cont] := 'Solteiro'

             else if rgEstCiv.ItemIndex = 1 then
              sgagenda.Cells[7,cont] := 'Casado'

            else if  rgEstCiv.ItemIndex = 2 then
               sgagenda.Cells[7,cont] := 'Separado'

            else if rgEstCiv.ItemIndex = 3 then
                sgagenda.Cells[7,cont] := 'Divorciado'

            else if rgEstCiv.ItemIndex = 4 then
               sgagenda.Cells[7,cont] := 'Viúvo'


          end;
          i := i + 1;

       end;

end;

procedure TfrmAgenda.ATUALIZAR1Click(Sender: TObject);
begin
  atualizagrid();
end;

procedure TfrmAgenda.btCadastrarClick(Sender: TObject);
   var
  I: Integer;
  editaraux: Integer;
begin
    AUX:=0;
      while( AUX <= 100) do
      begin
        if FLAG = 1  then
           begin
              if MessageDlg('Modo de edição ativado!' ,mtError, mbOKCancel, 0) = mrOk then
              begin
                if MessageDlg('Deseja desativar esse modo?' ,mtConfirmation, mbYesNo, 0) = mryes then
                begin
                   FLAG := 0;
                   Application.Restore;
                end;

              end;

              exit;
           end
           else
           begin
                 if contatos[AUX].ocupado = false then
                 begin
                   if(verificaValores() = true) then
                     begin
                        contatos[AUX].nome := ednome.Text;
                        contatos[AUX].idade := StrToInt(edIdade.Text);
                        contatos[AUX].telcom := edTelCom.Text;
                        contatos[AUX].telres := edTelRes.text;
                        contatos[AUX].endereco := edEndereco.Text;
                        contatos[AUX].bairro  := edbairro.text;
                        contatos[AUX].CEP := edCEP.Text;
                        contatos[AUX].estcivi := rgEstCiv.ItemIndex;
                        contatos[AUX].sexo := rgSexo.ItemIndex;
                        contatos[AUX].ocupado := TRUE;

                        ShowMessage('Cadastrado!');

                        ednome.Text := '';
                        edIdade.Text := '';
                        edTelCom.Text := '';
                        edTelRes.text := '';
                        edEndereco.Text := '';
                        edbairro.text := '';
                        edCEP.Text := '';
                        rgEstCiv.ItemIndex := -1;
                        rgSexo.ItemIndex := -1;

                        atualizagrid();

                        Exit;
                        //end;
                    end
                    else
                    begin
                       ShowMessage('Nome de usuário já cadastrado!');
                       Exit;
                    end;

               end
               else
          Inc(AUX);
        end;

  end;

  FLAG := 3;
end;


procedure TfrmAgenda.btEditarClick(Sender: TObject);
var
  i: Integer;
begin
       if FLAG = 3  then
          begin
            if  MessageDlg('Modo de cadastramento de dados ativo!' + #13 + 'Deseja saír do cadastramento? ', mtError, mbYesNo,0) = mrYes then
            begin
              FLAG := 1;
              EXIT;
            end
            ELSE
            BEGIN
             Exit;
            END;

          end;
          I := 0;
          while i <= 100 do
          begin
            if ednome.text = contatos[aux].nome then
            begin
              Inc(i);
            end
            else
            if ednome.Text = contatos[i].nome then
            begin
              MessageDlg('Usuário com mesmo nome encontrado na posição ' + IntToStr(i), mtError, [mbOK],0);
              exit;
            end;
            begin
              Inc(i);
            end;
          end;

                     if MessageDlg('Deseja alterar o contato?', mtConfirmation, mbYesNoCancel, 0) = mrYes then
                  begin
                      if ednome.Text <> CONTATOS[AUX].nome then
                    begin
                      contatos[AUX].nome := ednome.Text;
                    end;

                    if StrToInt(edIdade.Text)  <> CONTATOS[AUX].idade then
                    begin
                      contatos[AUX].idade := StrToInt(edIdade.Text);
                    end;


                    if edtelcom.Text <> CONTATOS[AUX].telcom then
                    begin
                      contatos[AUX].telcom := edtelcom.Text;
                    end;

                    if edtelres.Text <> CONTATOS[AUX].telres then
                    begin
                      contatos[AUX].telres := edTelRes.Text;
                    end;

                    if edEndereco.Text <> CONTATOS[AUX].endereco then
                    begin
                      contatos[AUX].endereco := edEndereco.Text ;
                    end;

                    if edcep.Text  <> CONTATOS[AUX].CEP then
                    begin
                      contatos[AUX].CEP :=  edCEP.Text ;
                    end;

                    if rgEstCiv.ItemIndex <> CONTATOS[AUX].estcivi then
                    begin
                      contatos[AUX].estcivi := rgEstCiv.ItemIndex;
                    end;

                    if rgsexo.ItemIndex <> CONTATOS[AUX].sexo then
                    begin
                      contatos[AUX].sexo := rgsexo.ItemIndex;
                    end;

                    Write(fcontatos,contatos[aux
                    ]);
                    atualizagrid();
                    MessageDlg('Usuário Modificado!', mtInformation, mbOKCancel,0);
                    editaux := 0;
                    exit;



      aux := 0;
      linha := 0;
      flag := 0;
      bteditar.enabled := false;
      editarcontato1.Enabled := false;
end;
end;


procedure TfrmAgenda.DELETAR1Click(Sender: TObject);
var i : integer;
begin

    i := 0;
    while( i <= 100) do
    begin

      if(contatos[i].ocupado = TRUE) then
      begin

            // Pesquisa pelo nome na agenda utilizando ROW + COLUNA 0
            if((contatos[i].nome = sgAgenda.Cells[0,sgAgenda.row]) AND (sgAgenda.row > 0)) then
            begin

              // messagedlg
              // TERMINAR
                if MessageDlg('Deseja excluir o contato?', mtConfirmation, mbYesNo,0) = mrYes then
                begin
                    contatos[i].ocupado := false;
                    atualizagrid();
                    CONTATOS[I].nome := #0;
                    Exit;
                end
                else
                begin
                  Exit;
                end;
              // Colocar os demais valores
              end;
      end;

      Inc(i);

    end;

end;

procedure TfrmAgenda.EditarContato1Click(Sender: TObject);
var
    LINHA: Integer;
  NOMEAUX: string;
begin
  if FLAG = 2  then
  BEGIN
    MessageDlg('Modo de Busca Ativado!', mtError,mbOKCancel,0);
    if  MessageDlg('Deseja desativar esse modo?', mtConfirmation, mbYesNo, 0) = mrYes then
    begin
      flag := 1;
      ATUALIZAGRID();
      EXIT;
    end
    else
    begin
      exit;
    end;

  END;
  FLAG := 1;
  atualizagrid();
  LINHA := SGAGENDA.Row + 1;
  NOMEAUX := '';
  NOMEAUX := SGAGENDA.Cells[0, LINHA-1];

  if LINHA >= 0 then
  begin
    editarcontato1.Enabled := true;
  end;

  AUX := 0;
  while AUX <= 100 do
  begin
    if  CONTATOS[AUX].nome = NOMEAUX THEN
    begin
      break;
    end
    else
    begin
      Inc(AUX);
    end;

  end;
  if  CONTATOS[AUX].nome = NOMEAUX THEN
  BEGIN
    ednome.Text := contatos[AUX].nome;
    edIdade.Text := IntToStr(contatos[AUX].idade);
    edTelCom.Text := contatos[AUX].telcom;
    edTelRes.text := contatos[AUX].telres;
    edEndereco.Text := contatos[AUX].endereco;
    edbairro.text := contatos[AUX].bairro;
    edCEP.Text:= contatos[AUX].CEP;
    rgEstCiv.ItemIndex := contatos[AUX].estcivi;
    rgSexo.ItemIndex := contatos[AUX].sexo;
  END
    ELSE
  BEGIN
    MessageDlg('Usuário não encontrado!', mtError, [mbOK], 0);
  END;
  btEditar.Enabled := true;
end;


procedure TfrmAgenda.FormClose(Sender: TObject; var Action: TCloseAction);
  var i: Integer;
begin

    REWRITE(fcontatos);

    i:=0;
    WHILE(i <= 100) DO
    BEGIN

      IF(contatos[i].ocupado = true) THEN
      begin

        write(fcontatos,contatos[i]);
      end;
      inc(i);
    END;

    CloseFile(fcontatos);
end;


procedure TfrmAgenda.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  sgAgenda.Cells[0,0] := 'Nome';
  sgAgenda.Cells[1,0] := 'Idade';
  sgAgenda.Cells[2,0] := 'Tel. Com.';
  sgAgenda.Cells[3,0] := 'Tel. Res.';
  sgAgenda.Cells[4,0] := 'Endereço';
  sgAgenda.Cells[5,0] := 'Bairro';
  sgAgenda.Cells[6,0] := 'CEP';
  sgAgenda.Cells[7,0] := 'Est. Civ.';
  sgAgenda.Cells[8,0] := 'Sexo';
  AssignFile(fcontatos,'contatos.txt');

  i := 0;
  while i <= 100 do
  begin
    contatos[i].ocupado := false;
    Inc(i);
  end;

  if FileExists('contatos.txt') = true   then
  begin
    Reset(fcontatos);
  end
  else
  begin
    Rewrite(fcontatos);
  end;

  Seek(fcontatos,0);

  i:=0;
  while not(Eof(fcontatos)) do
  begin
    Read(fcontatos, contatos[i]);
    Inc(i);
  end;
    FLAG := 3;
    atualizagrid();

end;


procedure TfrmAgenda.INSERIR1Click(Sender: TObject);
  var i: INTEGER;
begin

    REWRITE(fcontatos);

    i:=0;
    WHILE(i <= 100) DO
    BEGIN

      IF(contatos[i].ocupado = true) THEN
      begin

        write(fcontatos,contatos[i]);
      end;
      inc(i);
    END;

    CloseFile(fcontatos);

end;

procedure TfrmAgenda.filtrarnomeClick(Sender: TObject);
var
  buscanome: string;
  i: Integer;
  cont: Integer;
begin

  buscanome := Inputbox('Busca por nome:', 'Digite o nome completo:', '');
  i := 1;
  cont := 0;
   while(i <= 100) do
     begin
        if((contatos[i].ocupado = TRUE)) then
        begin
           cont := cont + 1;
        end;
        Inc(i);
     end;
    sgAgenda.RowCount := cont+1;
    i := 0;
    while i <= 100  do
    begin
      if contatos[i].nome = buscanome then
      begin
        break;
      end
      else
      begin
        Inc(i);
      end;
    end;

      sgAgenda.Cells[0,cont] := contatos[i].nome;
      sgAgenda.Cells[1,cont] := inttostr(contatos[i].idade);
      sgAgenda.Cells[2,cont] := contatos[i].telcom;
      sgAgenda.Cells[3,cont] := contatos[i].telres;
      sgAgenda.Cells[4,cont] := contatos[i].endereco;
      sgAgenda.Cells[5,cont] := contatos[i].bairro;
      sgAgenda.Cells[6,cont] := contatos[i].CEP;
      if contatos[i].sexo = 0  then
       begin
        sgAgenda.Cells[8, cont] := 'Masculino';
        end
        else
        begin
                sgAgenda.Cells[8, cont] := 'Feminino';
        end;

        if rgEstCiv.ItemIndex = 0 then
          sgagenda.Cells[7,cont] := 'Solteiro'

        else if rgEstCiv.ItemIndex = 1 then
          sgagenda.Cells[7,cont] := 'Casado'

        else if  rgEstCiv.ItemIndex = 2 then
           sgagenda.Cells[7,cont] := 'Separado'

        else if rgEstCiv.ItemIndex = 3 then
           sgagenda.Cells[7,cont] := 'Divorciado'

        else if rgEstCiv.ItemIndex = 4 then
            sgagenda.Cells[7,cont] := 'Viúvo';

    FLAG := 2;
end;


PROCEDURE TfrmAgenda.sAIR1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmAgenda.sgAgendaClick(Sender: TObject);
  var
  i : INTEGER;
  RowCont: Integer;
  cont: Integer;
begin
     LINHA := SGAGENDA.row;
      if LINHA <> 0 then
      begin
        EditarContato1.Enabled := true;
      end
      else
      begin
        editarcontato1.Enabled := false;
      end;

      if LINHA <> 0 then
      begin
        DELETAR1.Enabled := true;
      end
      else
      begin
        editarcontato1.Enabled := false;
      end;



end;
procedure TfrmAgenda.SOBRE1Click(Sender: TObject);
begin
    ShowMessage('Trabalho realizado pelos alunos Rafael Carminatti Polidoro e Rodrigo Luan Ferrazza da turma A03 do Centro Técnologico Universidade de Caxias do Sul (CETEC).');
end;

{
    i := 0;
    while( i <= 100) do
    begin

      // Pesquisa pelo nome na agenda utilizando ROW + COLUNA 0
      if(contatos[i].nome = sgAgenda.Cells[0,sgAgenda.row]) then
      begin
        edNome.Text := contatos[i].nome;
        edIdade.Text := inttostr(contatos[i].idade);
        edTelCom.Text := contatos[i].telcom;
        edTelRes.Text := contatos[i].telres;
        edEndereco.Text := contatos[i].endereco;
        edBairro.Text := contatos[i].bairro;
        edCEP.Text := contatos[i].CEP;
        RowCont := sgAgenda.Row;
        if sgAgenda.Cells[8, RowCont] = 'Masculino' then
        begin
          rgSexo.ItemIndex := 0;
        end
        else
        begin
          rgsexo.ItemIndex := 1;
        end;

        if sgagenda.Cells[7,RowCont] = 'Solteiro' then
           rgEstCiv.ItemIndex := 0

        else if sgagenda.Cells[7,RowCont] = 'Casado' then
          rgEstCiv.ItemIndex := 1

        else if sgagenda.Cells[7,RowCont] = 'Separado' then
           rgEstCiv.ItemIndex := 2

        else if sgagenda.Cells[7,RowCont] = 'Divorciado' then
            rgEstCiv.ItemIndex := 3

        else if sgagenda.Cells[7,RowCont] = 'Viúvo' then
            rgEstCiv.ItemIndex := 4;

      end;
      Inc(i);
    end;

end;
      }
    // Captura sgAgenda.row para:
    // EDITAR CONATATO e ATUALIZAR GRID (atualizaGRID)



function TfrmAgenda.verificaValores: BOOLEAN;
var i: integer;
begin
    // VERIFICA ENTRADA

    i := 0;
    while(i <= 100) do
    begin

        if(contatos[i].nome = edNome.Text) then
        begin
          Result := FALSE;
          Exit;
        end;
        Inc(i);
    end;
    // NOME DEVE SER DIFERENTE DOS CADASTRADOS
    // IDADE DEVE SER ..
    //
    Result := TRUE;

end;

end.
