
local ffi = require 'ffi'

require 'extern.sfml.config'
require 'extern.sfml.network.types'

ffi.cdef [[

  typedef enum {
    sfHttpGet,
    sfHttpPost,
    sfHttpHead
  } sfHttpMethod;

  typedef enum {
    sfHttpOk        = 200,
    sfHttpCreated   = 201,
    sfHttpAccepted  = 202,
    sfHttpNoContent = 204,
    sfHttpMultipleChoices  = 300,
    sfHttpMovedPermanently = 301,
    sfHttpMovedTemporarily = 302,
    sfHttpNotModified      = 304,
    sfHttpBadRequest   = 400,
    sfHttpUnauthorized = 401,
    sfHttpForbidden    = 403,
    sfHttpNotFound     = 404,
    sfHttpInternalServerError = 500,
    sfHttpNotImplemented      = 501,
    sfHttpBadGateway          = 502,
    sfHttpServiceNotAvailable = 503,
    sfHttpInvalidResponse  = 1000,
    sfHttpConnectionFailed = 1001
  } sfHttpStatus;

  sfHttpRequest* sfHttpRequest_Create();
  void sfHttpRequest_Destroy(sfHttpRequest* HttpRequest);
  void sfHttpRequest_SetField(sfHttpRequest* HttpRequest, const char* Field, const char* Value);
  void sfHttpRequest_SetMethod(sfHttpRequest* HttpRequest, sfHttpMethod Method);
  void sfHttpRequest_SetURI(sfHttpRequest* HttpRequest, const char* URI);
  void sfHttpRequest_SetHttpVersion(sfHttpRequest* HttpRequest, unsigned int Major, unsigned int Minor);
  void sfHttpRequest_SetBody(sfHttpRequest* HttpRequest, const char* Body);
  void sfHttpResponse_Destroy(sfHttpResponse* HttpResponse);
  const char* sfHttpResponse_GetField(sfHttpResponse* HttpResponse, const char* Field);
  sfHttpStatus sfHttpResponse_GetStatus(sfHttpResponse* HttpResponse);
  unsigned int sfHttpResponse_GetMajorVersion(sfHttpResponse* HttpResponse);
  unsigned int sfHttpResponse_GetMinorVersion(sfHttpResponse* HttpResponse);
  const char* sfHttpResponse_GetBody(sfHttpResponse* HttpResponse);
  sfHttp* sfHttp_Create();
  void sfHttp_Destroy(sfHttp* Http);
  void sfHttp_SetHost(sfHttp* Http, const char* Host, unsigned short Port);
  sfHttpResponse* sfHttp_SendRequest(sfHttp* Http, sfHttpRequest* Request, float Timeout);

]]
