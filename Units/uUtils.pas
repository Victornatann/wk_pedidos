unit uUtils;

interface

uses Forms, StdCtrls, Dialogs, SysUtils;

procedure ValidarCamposObrigatorios(form: Tform);

implementation

procedure ValidarCamposObrigatorios(form: Tform);
var
  I: Integer;
begin
  for I := 0 to form.ComponentCount - 1 do
  begin
    if form.Components[I].Tag = 5 then
    begin

      // TEdit
      if form.Components[I] is TEdit then
        if ((form.Components[I] as TEdit).Hint <> '') and
          ((form.Components[I] as TEdit).Text = '') then
        begin
          MessageDlg('O campo ' + (form.Components[I] as TEdit).Hint +
            ' não foi preenchido', mtWarning, [mbOK], 0);
          (form.Components[I] as TEdit).SetFocus;
          abort;
        end;
    end;
  end;

end;

end.
