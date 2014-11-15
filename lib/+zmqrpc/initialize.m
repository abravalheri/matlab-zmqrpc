function serverObj = initialize(varargin)
  % Ensure aux directories exist
  [~, ~, sandboxPath, tempPath] = zmqrpc.paths;
  [~, ~, ~] = mkdir(sandboxPath);
  [~, ~, ~] = mkdir(tempPath);
  addpath(sandboxPath);

  % Params parsing
  serverObj.address = '*';
  serverObj.port = 30000;
  if nargin >= 1
    serverObj.address = varargin{1};
  end
  if nargin >= 2
    serverObj.port = varargin{2};
  end

  % ZMQ lowlevel init
  serverObj.context = zmq_ctx_new;
  serverObj.socket  = zmq_socket(serverObj.context, 'ZMQ_REP');
  serverObj.address = sprintf('tcp://%s:%d', serverObj.address, serverObj.port);
  zmq_bind(serverObj.socket, serverObj.address);
end