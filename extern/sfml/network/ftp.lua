
local ffi = require 'ffi'

require 'extern.sfml.config'
require 'extern.sfml.network.ipaddress'
require 'extern.sfml.network.types'

ffi.cdef [[

  typedef enum {
    sfFtpBinary,
    sfFtpAscii,
    sfFtpEbcdic
  } sfFtpTransferMode;

  typedef enum {
    sfFtpRestartMarkerReply          = 110,
    sfFtpServiceReadySoon            = 120,
    sfFtpDataConnectionAlreadyOpened = 125,
    sfFtpOpeningDataConnection       = 150,
    sfFtpOk                    = 200,
    sfFtpPointlessCommand      = 202,
    sfFtpSystemStatus          = 211,
    sfFtpDirectoryStatus       = 212,
    sfFtpFileStatus            = 213,
    sfFtpHelpMessage           = 214,
    sfFtpSystemType            = 215,
    sfFtpServiceReady          = 220,
    sfFtpClosingConnection     = 221,
    sfFtpDataConnectionOpened  = 225,
    sfFtpClosingDataConnection = 226,
    sfFtpEnteringPassiveMode   = 227,
    sfFtpLoggedIn              = 230,
    sfFtpFileActionOk          = 250,
    sfFtpDirectoryOk           = 257,
    sfFtpNeedPassword       = 331,
    sfFtpNeedAccountToLogIn = 332,
    sfFtpNeedInformation    = 350,
    sfFtpServiceUnavailable        = 421,
    sfFtpDataConnectionUnavailable = 425,
    sfFtpTransferAborted           = 426,
    sfFtpFileActionAborted         = 450,
    sfFtpLocalError                = 451,
    sfFtpInsufficientStorageSpace  = 452,
    sfFtpCommandUnknown          = 500,
    sfFtpParametersUnknown       = 501,
    sfFtpCommandNotImplemented   = 502,
    sfFtpBadCommandSequence      = 503,
    sfFtpParameterNotImplemented = 504,
    sfFtpNotLoggedIn             = 530,
    sfFtpNeedAccountToStore      = 532,
    sfFtpFileUnavailable         = 550,
    sfFtpPageTypeUnknown         = 551,
    sfFtpNotEnoughMemory         = 552,
    sfFtpFilenameNotAllowed      = 553,
    sfFtpInvalidResponse  = 1000,
    sfFtpConnectionFailed = 1001,
    sfFtpConnectionClosed = 1002,
    sfFtpInvalidFile      = 1003
  } sfFtpStatus;
  
  void sfFtpListingResponse_Destroy(sfFtpListingResponse* FtpListingResponse);
  sfBool sfFtpListingResponse_IsOk(sfFtpListingResponse* FtpListingResponse);
  sfFtpStatus sfFtpListingResponse_GetStatus(sfFtpListingResponse* FtpListingResponse);
  const char* sfFtpListingResponse_GetMessage(sfFtpListingResponse* FtpListingResponse);
  size_t sfFtpListingResponse_GetCount(sfFtpListingResponse* FtpListingResponse);
  const char* sfFtpListingResponse_GetFilename(sfFtpListingResponse* FtpListingResponse, size_t Index);
  void sfFtpDirectoryResponse_Destroy(sfFtpDirectoryResponse* FtpDirectoryResponse);
  sfBool sfFtpDirectoryResponse_IsOk(sfFtpDirectoryResponse* FtpDirectoryResponse);
  sfFtpStatus sfFtpDirectoryResponse_GetStatus(sfFtpDirectoryResponse* FtpDirectoryResponse);
  const char* sfFtpDirectoryResponse_GetMessage(sfFtpDirectoryResponse* FtpDirectoryResponse);
  const char* sfFtpDirectoryResponse_GetDirectory(sfFtpDirectoryResponse* FtpDirectoryResponse);
  void sfFtpResponse_Destroy(sfFtpResponse* FtpResponse);
  sfBool sfFtpResponse_IsOk(sfFtpResponse* FtpResponse);
  sfFtpStatus sfFtpResponse_GetStatus(sfFtpResponse* FtpResponse);
  const char* sfFtpResponse_GetMessage(sfFtpResponse* FtpResponse);
  sfFtp* sfFtp_Create();
  void sfFtp_Destroy(sfFtp* Ftp);
  sfFtpResponse* sfFtp_Connect(sfFtp* Ftp, sfIPAddress Server, unsigned short Port, float Timeout);
  sfFtpResponse* sfFtp_LoginAnonymous(sfFtp* Ftp);
  sfFtpResponse* sfFtp_Login(sfFtp* Ftp, const char* UserName, const char* Password);
  sfFtpResponse* sfFtp_Disconnect(sfFtp* Ftp);
  sfFtpResponse* sfFtp_KeepAlive(sfFtp* Ftp);
  sfFtpDirectoryResponse* sfFtp_GetWorkingDirectory(sfFtp* Ftp);
  sfFtpListingResponse* sfFtp_GetDirectoryListing(sfFtp* Ftp, const char* Directory);
  sfFtpResponse* sfFtp_ChangeDirectory(sfFtp* Ftp, const char* Directory);
  sfFtpResponse* sfFtp_ParentDirectory(sfFtp* Ftp);
  sfFtpResponse* sfFtp_MakeDirectory(sfFtp* Ftp, const char* Name);
  sfFtpResponse* sfFtp_DeleteDirectory(sfFtp* Ftp, const char* Name);
  sfFtpResponse* sfFtp_RenameFile(sfFtp* Ftp, const char* File, const char* NewName);
  sfFtpResponse* sfFtp_DeleteFile(sfFtp* Ftp, const char* Name);
  sfFtpResponse* sfFtp_Download(sfFtp* Ftp, const char* DistantFile, const char* DestPath, sfFtpTransferMode Mode);
  sfFtpResponse* sfFtp_Upload(sfFtp* Ftp, const char* LocalFile, const char* DestPath, sfFtpTransferMode Mode);
  
]]
