unit Classe.AutoSave.OTA;

interface

uses
  ToolsApi, Vcl.ExtCtrls, Vcl.Menus, Vcl.Forms, System.UITypes, System.Classes,
  Vcl.ActnList, System.SysUtils;

type
  TAutoSaveWizard = class(TInterfacedObject, IOTAWizard)
  private
    FMenuItem: TMenuItem;
    FAction: TAction;
  private
    class var
      FWizardIndex: Integer;

  protected
    { IOTAWizard }
    procedure Execute;
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
    procedure AfterSave;
    procedure BeforeSave;
    procedure Destroyed;
    procedure Modified;

    procedure DoMenuClick(Sender: TObject);
  public
    constructor Create;
    destructor Destroy; override;
    class property WizardIndex: Integer read FWizardIndex write FWizardIndex;
  end;

  function InitWizard(const BorlandIDEServices: IBorlandIDEServices; RegisterProc : TWizardRegisterProc;
    var Terminate: TWizardTerminateProc) : Boolean; StdCall;

  function InitialiseWizard(BIDES : IBorlandIDEServices): TAutoSaveWizard;

exports
  InitWizard name WizardEntryPoint;

implementation

function InitialiseWizard(BIDES : IBorlandIDEServices): TAutoSaveWizard;
begin
  Result := TAutoSaveWizard.Create;
  Application.Handle := (BIDES As IOTAServices).GetParentHandle;
end;

function InitWizard(const BorlandIDEServices: IBorlandIDEServices; RegisterProc : TWizardRegisterProc;
  var Terminate: TWizardTerminateProc) : Boolean; StdCall;
begin
  Result := BorlandIDEServices <> Nil;
  RegisterProc(InitialiseWizard(BorlandIDEServices));
end;


{ TAutoSaveWizard }


procedure TAutoSaveWizard.AfterSave;
begin
  // Do Nothing
end;

procedure TAutoSaveWizard.BeforeSave;
begin
  // Do Nothing
end;

constructor TAutoSaveWizard.Create;
var
  lNtas: INTAServices;
  lMenuView: TMenuItem;
  lDivider: TMenuItem;
  i: Integer;
  lList: TActionList;
begin
  lList := nil;
  lNtas := (BorlandIDEServices As INTAServices);
  if Assigned(lNtas) and (Assigned(lNtas.MainMenu)) then
  begin
    for i := 0 to lNtas.MainMenu.Items.Count -1 do
    begin
      if Assigned(lNtas.MainMenu.Items[i].Action) then
      begin
        if lNtas.MainMenu.Items[i].Action is TAction then
        begin
          lList := TActionList(TAction(lNtas.MainMenu.Items[i].Action).ActionList);
//          Application.MessageBox(pChar(lNtas.MainMenu.Items[i].Action.Name + ' - ' + TAction(lNtas.MainMenu.Items[i].Action).Caption), PChar('Action ' + IntToStr(i)), 0);
        end;
      end;
    end;

    lMenuView := lNtas.MainMenu.Items.Find('View');
    if Assigned(lMenuView) then
    begin
      lDivider := lMenuView.Find('-');
      if Assigned(lDivider) then
      begin
        if Assigned(lList) then
        begin
          FAction := TAction.Create(nil);
          FAction.ActionList := lList;
          FAction.Caption := 'Teste Auto Save';
          FAction.ShortCut := ShortCut(vkQ, [ssCtrl, ssShift]);
          FAction.OnExecute := DoMenuClick;
        end;

        FMenuItem := TMenuItem.Create(lMenuView);
        FMenuItem.Action := FAction;
//        FMenuItem.Caption := '&Auto Save - Turma CC';
//        FMenuItem.OnClick := DoMenuClick;
//        FMenuItem.ShortCut := ShortCut(vkQ, [ssCtrl, ssShift]);
        lMenuView.Insert(lDivider.MenuIndex, FMenuItem);
      end;
    end;
  end;
end;

destructor TAutoSaveWizard.Destroy;
begin
  FMenuItem.Free;
  FAction.Free;
  inherited;
end;

procedure TAutoSaveWizard.Destroyed;
begin
  // Do Nothing
end;

procedure TAutoSaveWizard.DoMenuClick(Sender: TObject);
var
  lIterator: IOTAEditBufferIterator;
  i: Integer;
  lNames: string;
begin
  //Application.MessageBox('Teste', 'Teste', 0);
  if (BorlandIDEServices as IOTAEditorServices).GetEditBufferIterator(lIterator) then
  begin
    for i := 0 to lIterator.Count -1 do
    begin
      lNames := lNames + lIterator.EditBuffers[i].Module.FileName + sLineBreak;

      if Pos('19.0\source\', lIterator.EditBuffers[i].Module.FileName.ToLower) > 0 then
      begin
        // Cuidar index após close, vai gerar erro
        lIterator.EditBuffers[i].Module.Close;
      end;

      if lIterator.EditBuffers[i].IsModified then
      begin
        lIterator.EditBuffers[i].Module.Save(False, True { Pergunta })
      end;
    end;
    Application.MessageBox(PChar(lNames), 'Buffers', 0);
  end;
end;

procedure TAutoSaveWizard.Execute;
begin
  // Do Nothing
end;

function TAutoSaveWizard.GetIDString: string;
begin
  Result := 'AutoSaveWizardTurmaCC';
end;

function TAutoSaveWizard.GetName: string;
begin
  Result := 'Open Tools Auto Save';
end;

function TAutoSaveWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

procedure TAutoSaveWizard.Modified;
begin
  // Do Nothing
end;


initialization

finalization
  if TAutoSaveWizard.FWizardIndex > 0 then
  begin
    (BorlandIDEServices as IOTAWizardServices).RemoveWizard(TAutoSaveWizard.FWizardIndex);
  end;

end.
