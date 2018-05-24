program prjAgenda;

uses
  Vcl.Forms,
  uLogin in 'uLogin.pas' {frmLogin},
  uAgenda in 'uAgenda.pas' {frmAgenda},
  uCadastro in 'uCadastro.pas' {frmCadastro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmAgenda, frmAgenda);
  Application.CreateForm(TfrmCadastro, frmCadastro);
  Application.Run;
end.
