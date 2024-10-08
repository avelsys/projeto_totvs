unit Commons.Funcoes;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Winapi.TlHelp32,
  System.SysUtils,
  System.Character,
  IdHTTP,
  IdSSL,
  IdSSLOpenSSL;


  /// <summary>
  ///   Verifica se uma API ou site esta no ar
  /// </summary>
  /// <param name="AUrl">
  ///   URL/Endereço do site
  /// </param>
  /// <returns>
  ///   Retorna verdadeiro caso esteja on line
  /// </returns>
  function IsApiOnline(const AUrl: string): Boolean;
  /// <summary>
  ///   Remove os caracrteres especiais de uma string
  /// </summary>
  /// <param name="AValor">
  ///   Valor da string que terá os caracteres especiais removido
  /// </param>
  /// <returns>
  ///   Retona a string sem caracteres especiais
  /// </returns>
  function RemoverCaracteresEspeciais(const AValor: string): string;
  /// <summary>
  ///   Pega o processo de um EXE ativo
  /// </summary>
  /// <param name="AExecutavelNome">
  ///   Nome do executável para verificar se o processo está ativo
  /// </param>
  /// <returns>
  ///   Retorna p valor Handler
  /// </returns>
  function PegarProcessoExecucaoPorNome(const AExecutavelNome: string): THandle;
  /// <summary>
  ///   Abre aplicação externa
  /// </summary>
  /// <param name="AExecutavelNome">
  ///   Nome do executável que será fechado
  /// </param>
  /// <returns>
  ///   Retorna verdadeiro caso tenha aberto a aplicaão externa
  /// </returns>
  function AbreAplicacaoExterna(const AExecutavelNome: string): Boolean;
  /// <summary>
  ///   Fecha aplicação externa
  /// </summary>
  /// <param name="AExecutavelNome">
  ///   Nome do executável que será fechado
  /// </param>
  /// <returns>
  ///   Retorna verdadeiro caso tenha fechado a aplicação
  /// </returns>
  function FecharAplicacaoExterna(const AExecutavelNome: string): Boolean;

implementation

function AbreAplicacaoExterna(const AExecutavelNome: string): Boolean;
var
  LProcessInfo: TProcessInformation;
  LStartupInfo: TStartupInfo;
begin
  Result := False;
  ZeroMemory(@LStartupInfo, SizeOf(LStartupInfo));
  LStartupInfo.cb := SizeOf(LStartupInfo);

  if CreateProcess(PChar(AExecutavelNome), nil, nil, nil, False, 0, nil, nil, LStartupInfo, LProcessInfo) then
  begin
    Sleep(1000);
    Result := True;
  end;
end;

function FecharAplicacaoExterna(const AExecutavelNome: string): Boolean;
var
  LSnapshot: THandle;
  LProcessEntry: TProcessEntry32;
begin
  Result := False;
  LSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  if LSnapshot = INVALID_HANDLE_VALUE then
    Exit;

  try
    LProcessEntry.dwSize := SizeOf(LProcessEntry);
    if Process32First(LSnapshot, LProcessEntry) then
    begin
      repeat
        if AnsiSameText(ExtractFileName(LProcessEntry.szExeFile), AExecutavelNome) then
        begin
          var ProcessHandle := OpenProcess(PROCESS_TERMINATE, False, LProcessEntry.th32ProcessID);
          try
            if ProcessHandle <> 0 then
            begin
              TerminateProcess(ProcessHandle, 0);
              Result := True;
            end;
          finally
            CloseHandle(ProcessHandle);
          end;
        end;
      until not Process32Next(LSnapshot, LProcessEntry);
    end;
  finally
    CloseHandle(LSnapshot);
  end;
end;

function PegarProcessoExecucaoPorNome(const AExecutavelNome: string): THandle;
var
  LHSnapshot: THandle;
  LProcEntry: TProcessEntry32;
begin
  Result      := 0;
  LHSnapshot  := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  if LHSnapshot = INVALID_HANDLE_VALUE then Exit;

  LProcEntry.dwSize := SizeOf(TProcessEntry32);
  if Process32First(LHSnapshot, LProcEntry) then
  begin
    repeat
      if SameText(LProcEntry.szExeFile, AExecutavelNome) then
      begin
        Result := OpenProcess(PROCESS_TERMINATE or PROCESS_QUERY_INFORMATION, False, LProcEntry.th32ProcessID);
        Break;
      end;
    until not Process32Next(LHSnapshot, LProcEntry);
  end;
  CloseHandle(LHSnapshot);
end;


function RemoverCaracteresEspeciais(const AValor: string): string;
var
  LInd: Integer;
begin
  Result := EmptyStr;
  for LInd := 1 to Length(AValor) do
  begin
    if AValor[LInd].IsLetterOrDigit  then
      Result := Result + AValor[LInd];
  end;
end;

function IsApiOnline(const AUrl: string): Boolean;
var
  LHTTP: TIdHTTP;
  LSSLHandler: TIdSSLIOHandlerSocketOpenSSL;
begin
  LHTTP         := TIdHTTP.Create(nil);
  try
    LSSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    try
      LSSLHandler.SSLOptions.Method       := sslvTLSv1_2;
      LSSLHandler.SSLOptions.SSLVersions  := [sslvTLSv1_2];

      LHTTP.IOHandler       := LSSLHandler;
      LHTTP.HandleRedirects := True;
      try
        LHTTP.Head(AUrl);
        Result := True;
      except
        on E: Exception do
          Result := False;
      end;
    finally
      LSSLHandler.Free;
    end;
  finally
    LHTTP.Free;
  end;
end;

end.
