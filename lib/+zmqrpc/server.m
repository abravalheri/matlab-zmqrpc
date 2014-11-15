function server(varargin)
  serverObj = zmqrpc.initialize(varargin{:});
  cleanupObj = onCleanup(@() zmqrpc.finalize(serverObj));

  fprintf('ZMQ Server\n');

  methodArray = zmqrpc.discover; % Cache valid methods

  while 1
    try
      close all;
      should = zmqrpc.checkpoint;
      if strcmp(should, 'debug')
        keyboard
      elseif strcmp(should, 'stop')
        break
      end

      requestStr = zmqrpc.recvstr(serverObj.socket);
      requestArray = loadjson(requestStr);
      if ~iscell(requestArray), requestArray = {requestArray}; end % Batch operations
      responseArray = {};
      for n = 1:length(requestArray)
        request = requestArray{n};
        [action, nresult, args, notification] = zmqrpc.interpret(request, methodArray);

        if nresult > 0
          result = cell(1, nresult);
          [result{1:nresult}] = action(args{:});
        else
          action(args{:});
          result = {};
        end
        figs = zmqrpc.savefigs;

        response = zmqrpc.buildrep(request.id, result, figs);
        responseArray{1+length(responseArray)} = response;
      end
      zmqrpc.sendstr(serverObj.socket, savejson('', responseArray));
    catch err
      zmqrpc.sendstr(serverObj.socket, savejson('', zmqrpc.builderr(request.id, err)));
    end
  end
end