function [action, nresult, args, notification] = interpret(request, methodArray)
  nresult = 1;
  notification = 0;
  jsonrpc = '';
  args = {};

  if isfield(request, 'jsonrpc')
    jsonrpc = request.jsonrpc;
  end

  if ~strcmp(jsonrpc, '2.0')
    error('jsonrpc:invalidRequest', '`jsonrpc` field missing or other than ''2.0''.');
  end

  if ~isfield(request, 'method')
    error('jsonapi:invalidRequest', '`method` field missing.');
  end

  if ~isfield(request, 'id')
    notification = 1;
  end

  if strcmp(request.method, 'api.discover')
    action = @zmqrpc.discover;
  else
    availableMethods =  extractfield(methodArray, 'method');
    index = find(ismember(availableMethods, request.method));
    if isempty(index)
      error('jsonapi:methodNotFound',...
        'The method `%s` does not exist or is not available.', request.method);
    end

    action = str2func(request.method);
    methoddesc = methodArray(index);
    if ~isfield(methoddesc, 'result')
      nresult = 0;
    else
      resultdesc = methoddesc.result;
      if isstruct(resultdesc)
        nresult = length(fieldnames(resultdesc));
      else
        nresult = length(resultdesc);
      end
    end

    args = request.params;
    if isstruct(args)
      if isstruct(methoddesc.params)
        args = buildargs(request, methoddesc);
      else
        args = struct2cell(args);
      end
    end
  end
end

function args = buildargs(request, methoddesc)
  params = request.params;
  argnames = fieldnames(methoddesc.params);

  nargs = length(argnames);
  args = cell(1, nargs);

  for n = 1:nargs
    argname = argnames{n};
    if ~isfield(params, argname)
      error('jsonrpc:invalidParams', 'param `%s` required', argname)
    end
    args{n} = getfield(params, argname);
  end
end