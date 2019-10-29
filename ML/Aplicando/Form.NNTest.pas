unit Form.NNTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Math, fann, data, defs, func, Vcl.ExtCtrls, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, VclTee.TeeGDIPlus, VCLTee.Series, VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart,
  VCLTee.DBChart, Vcl.Grids, Vcl.DBGrids;

type
  TfrmNNTest = class(TForm)
    PageControl1: TPageControl;
    TabTreinoTest: TTabSheet;
    PanelControles: TPanel;
    ButtonProcessar: TButton;
    ButtonGerarDados: TButton;
    ButtonCompras: TButton;
    MemoLog: TMemo;
    TabResultado: TTabSheet;
    DBGrid1: TDBGrid;
    dtsSaida: TDataSource;
    Splitter1: TSplitter;
    DBChart1: TDBChart;
    Series1: TPointSeries;
    Series3: TLineSeries;
    Series2: TPointSeries;
    TabTexto: TTabSheet;
    Panel1: TPanel;
    MemoSaida: TMemo;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    MemoEntrada: TMemo;
    Button1: TButton;
    procedure ButtonProcessarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonGerarDadosClick(Sender: TObject);
    procedure ButtonComprasClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FQtd: Integer;
    FArqDados: string;
    procedure GravaLog(pMsg: string);
  public
    function NNetCreate(const hidden_layers, inputs, hidden_layer_size, outputs, activation_func_hidden, activation_func_output: Integer): PFann;
    function NNetManualTest(pnn: PFann; const path: string; const problem: Integer): Integer;
    function NNetTrainAndTest(pnn: PFann; const pathTrain,pathTest: string; const problem: Integer): Integer;

    function NNetTrainAndTestCompras(pnn: PFann; const pathTrain,pathTest: string; const problem: Integer): Integer;
    function NNetManualTestCompras(pnn: PFann; const path: string; const problem: Integer; pLastLoop: Boolean): Integer;
  end;

var
  frmNNTest: TfrmNNTest;

implementation

{$R *.dfm}

uses Data.Dados;

procedure TfrmNNTest.Button1Click(Sender: TObject);
var
  lResultado: string;
begin
  FormatSettings.ThousandSeparator := ',';
  FormatSettings.DecimalSeparator := '.';

//  dmdDados.memDadosSaidaComprasLinear.First;
//  while not dmdDados.memDadosSaidaComprasLinear.Eof do
//  begin
//    lResultado := lResultado + ', ' + FormatFloat('0.,00', dmdDados.memDadosSaidaComprasLinear.FieldByName('y').AsFloat);
//
//    dmdDados.memDadosSaidaComprasLinear.Next;
//  end;

//  dmdDados.memDadosSaidaNN.First;
//  while not dmdDados.memDadosSaidaNN.Eof do
//  begin
//    lResultado := lResultado + ', ' + FormatFloat('0.,00', dmdDados.memDadosSaidaNN.FieldByName('y').AsFloat);
//
//    dmdDados.memDadosSaidaNN.Next;
//  end;

//  dmdDados.qryCompras.First;
//  while not dmdDados.qryCompras.Eof do
//  begin
//    lResultado := lResultado + ', ' + FormatFloat('0.00', dmdDados.qryCompras.FieldByName('total').AsFloat);
//
//    dmdDados.qryCompras.Next;
//  end;

//  var lData: TDate := StrToDate('01/01/2017');
//  for var i: Integer := 0 to dmdDados.memDadosSaidaComprasLinear.RecordCount -1 do
//  begin
//    lResultado := lResultado + ', ' + FormatDateTime('yyyymm', lData);
//    lData := IncMonth(lData, 1);
//  end;

//  ShowMessage(lResultado);
end;

procedure TfrmNNTest.ButtonComprasClick(Sender: TObject);
var
  nnet: PFann;
  rawData,nrmData: TDataArr;
  loop,perm,misclassified: Integer;
  sumReg: array[0..5] of Integer;
  strPerm: string;
begin
  MemoLog.Clear;
  Randomize();
  ForceDirectories(FOLDER_GENERATED);
  rawData := DataLoadCompras(PATH_COMPRAS_DATA);
  nrmData := DataNormalizeCompras(rawData, -1.0, +1.0);
  strPerm := '.perm' + '0';

  DataSaveCompras(nrmData, ExtractFilePath(ParamStr(0)) + PATH_NORM_TRAIN_COMPRAS + strPerm, ExtractFilePath(ParamStr(0)) + PATH_NORM_TEST_COMPRAS + strPerm, PROBLEM_REGRESSION, dmdDados.qryCompras.RecordCount, 0);

  FillChar(sumReg, SizeOf(sumReg), 0);
  for perm:=0 to 5 do
  begin
    strPerm := '.perm' + '0'; // perm
    for loop:=1 to LOOP_TIMES do
    begin
    // para classificação
//      DataSaveCompras(nrmData, ExtractFilePath(ParamStr(0)) + PATH_NORM_TRAIN_REG + strPerm, ExtractFilePath(ParamStr(0)) + PATH_NORM_TEST_REG + strPerm, PROBLEM_REGRESSION, dmdDados.qryCompras.RecordCount, perm);

      GravaLog(EOL + '=== FANN Regression Example ===');
      nnet := NNetCreate(
        HIDDEN_LAYERS,
        NUMBER_OF_INPUTS,
        HIDDEN_LAYER_SIZE,
        1, // number of outputs
        FANN_SIGMOID,
        FANN_LINEAR );
        try
          misclassified := NNetTrainAndTestCompras( nnet, PATH_NORM_TRAIN_COMPRAS+strPerm, PATH_NORM_TEST_COMPRAS + strPerm, PROBLEM_REGRESSION);
          Inc(sumReg[perm], misclassified);
        finally
          fann_destroy( nnet );
        end;
    end;
  end;

  GravaLog(EOL + '=== Summary (after '+ i2s(LOOP_TIMES) +' repetitions) ===');
  for perm := 0 to 5 do
  begin
    GravaLog('Permutation: ' + i2s(perm));
    GravaLog('Average Misclassified Reg.: ' + f2s(sumReg[perm] / LOOP_TIMES));
  end;

  DBChart1.RefreshData;
end;

procedure TfrmNNTest.ButtonGerarDadosClick(Sender: TObject);
begin
  var lDecimal: Char := FormatSettings.DecimalSeparator;
  var lThousand: Char := FormatSettings.ThousandSeparator;
  FormatSettings.DecimalSeparator := '.';
  FormatSettings.ThousandSeparator := ',';

  dmdDados.qryCompras.Close;
  dmdDados.qryCompras.Open;

  if dmdDados.qryCompras.IsEmpty then Exit;

  if FileExists(FArqDados) then
    DeleteFile(FArqDados);

  var lStl: TStringList := TStringList.Create;

  lStl.Add(dmdDados.qryCompras.RecordCount.ToString + ' ' + '1' + ' ' + '1'); // qtd (num entradas) (num saidas)

  dmdDados.qryCompras.DisableControls;
  try
    dmdDados.qryCompras.First;
    while not dmdDados.qryCompras.Eof do
    begin
      lStl.Add(IntToStr(dmdDados.qryCompras.RecNo) + ' ' + FormatFloat('0.00', dmdDados.qryCompras.FieldByName('total').AsCurrency));
      dmdDados.qryCompras.Next;
    end;
    dmdDados.qryCompras.First;
  finally
    dmdDados.qryCompras.EnableControls;
  end;

  lStl.SaveToFile(FArqDados);
  lStl.Free;

  FormatSettings.DecimalSeparator := lDecimal;
  FormatSettings.ThousandSeparator := lThousand;
end;

procedure TfrmNNTest.ButtonProcessarClick(Sender: TObject);
var
  nnet: PFann;
  rawData,nrmData: TDataArr;
  loop,perm,misclassified: Integer;
  sumReg: array[0..5] of Integer;
  strPerm: string;
begin
  MemoLog.Clear;
  Randomize();
  ForceDirectories( FOLDER_GENERATED );
  MemoEntrada.Lines.LoadFromFile(PATH_ORIG_DATA);
  rawData := DataLoad( PATH_ORIG_DATA );
  nrmData := DataNormalize( rawData, -1.0, +1.0 );

  FillChar(sumReg, SizeOf(sumReg), 0);
  for perm:=0 to 5 do
  begin
    strPerm := '.perm' + i2s(perm);
    for loop:=1 to LOOP_TIMES do
    begin
      GravaLog(EOL + '=== Data Split ===');
//          DataSplit( {var}nrmData, 33.3, Random(9999) );
      GravaLog('Saving data...');
      DataSave( nrmData, ExtractFilePath(ParamStr(0)) + PATH_NORM_TRAIN_REG + strPerm, ExtractFilePath(ParamStr(0)) + PATH_NORM_TEST_REG + strPerm, PROBLEM_REGRESSION, perm );

      GravaLog(EOL + '=== FANN Regression Example ===');
      nnet := NNetCreate(
        HIDDEN_LAYERS,
        NUMBER_OF_INPUTS,
        HIDDEN_LAYER_SIZE,
        1, // number of outputs
        FANN_SIGMOID,
        FANN_LINEAR );
        try
          misclassified := NNetTrainAndTest( nnet, PATH_NORM_TRAIN_REG+strPerm, PATH_NORM_TEST_REG+strPerm, PROBLEM_REGRESSION );
          Inc(sumReg[perm], misclassified);
        finally
          fann_destroy( nnet );
        end;
    end;
  end;

  MemoSaida.Lines.LoadFromFile(ExtractFilePath(ParamStr(0)) + PATH_NORM_TRAIN_REG + strPerm);

  GravaLog(EOL + '=== Summary (after '+ i2s(LOOP_TIMES) +' repetitions) ===');
  for perm := 0 to 5 do
  begin
    GravaLog('Permutation: ' + i2s(perm));
    GravaLog('Average Misclassified Reg.: ' + f2s(sumReg[perm] / LOOP_TIMES));
  end;
end;

procedure TfrmNNTest.FormCreate(Sender: TObject);
begin
  FArqDados := ExtractFilePath(ParamStr(0)) + PATH_COMPRAS_DATA;
  PageControl1.ActivePage := TabTreinoTest;
  dmdDados.memDadosSaidaNN.Open;

  TLog.OnLog :=
    procedure (pMsg: string)
    begin
      GravaLog(pMsg);
    end;
end;

procedure TfrmNNTest.GravaLog(pMsg: string);
begin
  MemoLog.Lines.Insert(0, pMsg);
  Application.ProcessMessages;
end;

function TfrmNNTest.NNetCreate(const hidden_layers, inputs, hidden_layer_size, outputs, activation_func_hidden, activation_func_output: Integer): PFann;

  procedure printMany(const str: string; const times: Integer);
  begin
    if (times <= 10) then
    begin
      var lNodes: string;
      for var i: Integer := 1 to times do lNodes := lNodes + str;
      GravaLog(lNodes);
    end else
      GravaLog(Format('%s .. %s (%d)',[Trim(str), Trim(str), times]));
    GravaLog('');
  end;

var
  n, layers: Integer;
begin
  Result := nil;
  try
    n := hidden_layer_size; // just to have shorter lines below
    layers := hidden_layers + 2;
    case hidden_layers of
      0: Result := fann_create_standard(layers, inputs, outputs);
      1: Result := fann_create_standard(layers, inputs, n, outputs);
      2: Result := fann_create_standard(layers, inputs, n,n, outputs);
      3: Result := fann_create_standard(layers, inputs, n,n,n, outputs);
      4: Result := fann_create_standard(layers, inputs, n,n,n,n, outputs);
    end;
    if Assigned(Result) then
    begin
      fann_set_training_algorithm(Result, FANN_TRAIN_RPROP); // FANN_TRAIN_RPROP, FANN_TRAIN_QUICKPROP, FANN_TRAIN_BATCH, FANN_TRAIN_INCREMENTAL
      fann_set_train_error_function(Result, FANN_ERRORFUNC_LINEAR); // FANN_ERRORFUNC_TANH, FANN_ERRORFUNC_LINEAR
      fann_set_activation_function_hidden(Result, activation_func_hidden); // for each neuron of the hidden layers
      fann_set_activation_function_output(Result, activation_func_output); // for each neuron of the output layer
      fann_set_activation_steepness_hidden(Result, 0.5); // for each neuron of all hidden layers
      fann_set_activation_steepness_output(Result, 0.5); // for each neuron of the output layer
      fann_set_train_stop_function(Result, FANN_STOPFUNC_MSE);
      fann_set_bit_fail_limit(Result, 0.5);

      GravaLog('--- Network Structure ---');
      printMany('OUT ', outputs);
      for layers:=1 to hidden_layers do
        printMany('O  ', hidden_layer_size);
      printMany('IN ', inputs);
    end;
  except
    Result := nil;
  end;

  if not Assigned(Result) then
    GravaLog('Error! Can''t create neural network.');
end;

function TfrmNNTest.NNetManualTest(pnn: PFann; const path: string; const problem: Integer): Integer;
var
  inputs:  array [0..NUMBER_OF_INPUTS-1] of fann_type;
  outputs: array [0..NUMBER_OF_CLASSES-1] of fann_type;
  calc_out: PFann_Type_array;
  tf: TextFile;
  iorig,i1,i2,
  ndata,nin,nout,nerr,n: Integer;
  mserr: Single;
  s: string;
begin
  // yes I know, that simmilar test can be done with two lines, but look
  // fann_test_data() seems to have different misclassification heuristic criteria
  Result := 0;
  if not Assigned(pnn) or not FileExists(path) then
    Exit;

  AssignFile(tf, path);
  try
    Reset(tf);
    ndata := 0; // number of input data
    nin   := 0; // number of inputs
    nout  := 0; // number of outputs
    nerr  := 0; // number of errors
    mserr := 0.0; // Mean squared error

    if not EOF(tf) then
      ReadLn(tf, ndata, nin, nout);

    GravaLog(Format('ndata=%d  nin=%d  nout=%d', [ndata, nin, nout]));
    n := 0;
    while not EOF(tf) and (n < ndata) do
    begin
      FillChar(inputs, SizeOf(inputs), 0);
      FillChar(outputs, SizeOf(outputs), 0);
      ReadLn(tf, inputs[0], outputs[0]);
      Inc(n);

      calc_out:= fann_run(pnn, @inputs[0]);
      s := '';
      mserr := mserr + Sqr(outputs[0] - Calc_Out[0]);
      if (Abs(Abs(outputs[0]) - Abs(Calc_Out[0])) > 0.5) then
      begin
        s := s + 'Wrong:';
        Inc(nerr);
      end;
    end;

  finally
    CloseFile(tf);
  end;

  if (n > 0) then
    mserr := mserr / n;

  GravaLog(Format('n=%d   Misclassified=%d  MSE=%.6f',[n,nerr,mserr]));
  Result := nerr;
end;

function TfrmNNTest.NNetManualTestCompras(pnn: PFann; const path: string; const problem: Integer; pLastLoop: Boolean): Integer;
var
  inputs:  array [0..NUMBER_OF_INPUTS-1] of fann_type;
  outputs: array [0..NUMBER_OF_CLASSES-1] of fann_type;
  lOutArr: array of fann_type;
  calc_out: PFann_Type_array;
  tf: TextFile;
  iorig,i1,i2,
  lNPredict, lFinArrSize, ndata,nin,nout,nerr,n: Integer;
  lMinVal, lMaxVal, mserr: Single;
  s: string;
begin
  lMinVal := 1;// maior valor
  lMaxVal := -1; // menor valor

  Result := 0;
  if not Assigned(pnn) or not FileExists(path) then
    Exit;

  AssignFile(tf, path);
  try
    Reset(tf);
    ndata := 0; // number of input data
    nin   := 0; // number of inputs
    nout  := 0; // number of outputs
    nerr  := 0; // number of errors
    mserr := 0.0; // Mean squared error

    if not EOF(tf) then
      ReadLn(tf, ndata, nin, nout);

    lFinArrSize := ndata + Trunc(ndata * 2);
    SetLength(lOutArr, lFinArrSize);

    GravaLog(Format('ndata=%d  nin=%d  nout=%d', [ndata, nin, nout]));
    n := 0;
    while not EOF(tf) and (n < ndata) do
    begin
      FillChar(inputs, SizeOf(inputs), 0);
      FillChar(outputs, SizeOf(outputs), 0);
      ReadLn(tf, inputs[0], outputs[0]);
      Inc(n);

      if outputs[0] < lMinVal then
      begin
        lMinVal := outputs[0];
      end;

      if outputs[0] > lMaxVal then
      begin
        lMaxVal := outputs[0];
      end;

      calc_out := fann_run(pnn, @inputs[0]);
      lOutArr[n] := Abs((2/calc_out[0])* (TCompras.FMedia/TCompras.FMin) * 0.9);

      s := '';
      mserr := mserr + Sqr(outputs[0] - Calc_Out[0]);
      if (Abs(Abs(outputs[0]) - Abs(Calc_Out[0])) > 0.5) then
      begin
        s := s + 'Wrong:';
        Inc(nerr);
      end;
    end;

  finally
    CloseFile(tf);
  end;

  // Predict
  lNPredict := lFinArrSize - ndata;
  for n := ndata to lFinArrSize do
  begin
    inputs[0] := inputs[0] + 1;
    calc_out := fann_run(pnn, @inputs[0]);
    lOutArr[n] := Abs((2/calc_out[0]) * (TCompras.FMedia/TCompras.FMin) * 0.9);
  end;

  if pLastLoop then
  begin
    dmdDados.memDadosSaidaNN.EmptyDataSet;

    for n := Low(lOutArr) to High(lOutArr) do
    begin
      dmdDados.memDadosSaidaNN.Append;
      dmdDados.memDadosSaidaNNx.AsFloat := n;
      dmdDados.memDadosSaidaNNy.AsFloat := lOutArr[n];
      dmdDados.memDadosSaidaNN.Post;
    end;
  end;

  if (n > 0) then
    mserr := mserr / n;

  GravaLog(Format('n=%d   Misclassified=%d  MSE=%.6f',[n,nerr,mserr]));
  Result := nerr;
end;

function TfrmNNTest.NNetTrainAndTest(pnn: PFann; const pathTrain, pathTest: string; const problem: Integer): Integer;
var
  train_data,test_data: PFann_Train_Data;
  mserr: Single;
begin
  Result := 0;
  if not Assigned(pnn) or not FileExists(pathTrain) or not FileExists(pathTest) then
    Exit;

  train_data := fann_read_train_from_file( PWideChar(AnsiString(pathTrain)));
  test_data  := fann_read_train_from_file( PWideChar(AnsiString(pathTest)));

  GravaLog('--- Train ---');
  fann_init_weights(pnn, train_data);
  fann_train_on_data(pnn, train_data,
    50,   // max epochs
    10,   // epochs between reports
    0.005  // desired error
  );

  GravaLog('--- FANN Tests ---');

  mserr := fann_test_data(pnn, train_data);
  GravaLog(Format('train: Misclassified=%d  MSE=%.6f',[fann_get_bit_fail(pnn), mserr]));

  mserr := fann_test_data(pnn, test_data);
  GravaLog(Format('test:  Misclassified=%d  MSE=%.6f',[fann_get_bit_fail(pnn), mserr]));

  GravaLog('--- Manual Tests ---');
  Result := NNetManualTest(pnn, pathTest, problem);
end;

function TfrmNNTest.NNetTrainAndTestCompras(pnn: PFann; const pathTrain, pathTest: string; const problem: Integer): Integer;
var
  train_data,test_data: PFann_Train_Data;
  mserr: Single;
begin
  Result := 0;
  Inc(FQtd);
  if not Assigned(pnn) or not FileExists(pathTrain) or not FileExists(pathTest) then
    Exit;

  train_data := fann_read_train_from_file( PWideChar(AnsiString(pathTrain)));
  test_data  := fann_read_train_from_file( PWideChar(AnsiString(pathTest)));

  GravaLog('--- Train ---');
  fann_init_weights(pnn, train_data);
  fann_train_on_data(pnn, train_data,
    50,   // max epochs
    10,   // epochs between reports
    0.005  // desired error
  );

  GravaLog('--- FANN Tests ---');

  mserr := fann_test_data(pnn, train_data);
  GravaLog(Format('train: Misclassified=%d  MSE=%.6f',[fann_get_bit_fail(pnn), mserr]));

  mserr := fann_test_data(pnn, test_data);
  GravaLog(Format('test:  Misclassified=%d  MSE=%.6f',[fann_get_bit_fail(pnn), mserr]));

  GravaLog('--- Manual Tests ---');
  Result := NNetManualTestCompras(pnn, pathTest, problem, FQtd = 60);
end;

end.
