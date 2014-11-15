function response = builderr(id, err)
  response = struct;
  response.jsonrpc = '2.0';
  response.id = id;

  if ischar(err)
    errdesc = err;  else
    errdesc = strcat(err.identifier, '\n', err.message);
    response.data.cause = err.cause;
    response.data.stack = filterstack(err.stack);
  end

  response.message = errdesc;

  if strfind(errdesc, 'JSONparser')
    % Parse error
    % Invalid JSON was received by the server.
    % An error occurred on the server while parsing the JSON text.
    response.code = -32700;
  elseif strfind(errdesc, 'jsonapi:invalidRequest')
    % Invalid Request
    % The JSON sent is not a valid Request object.
    response.code = -32600;

  elseif strfind(errdesc, 'jsonrpc:invalidParams')
    % Invalid params
    % Invalid method parameter(s).
    response.code = -32602;
  else
    response.code = -32000;
  end
end

function stack = filterstack(origStack)
  stack = {};
  for n = 1:length(origStack)
    if isempty(strfind(origStack(n).file, 'zmqrpc'))
      stack = origStack(n:end);
      break;
    end
  end
end