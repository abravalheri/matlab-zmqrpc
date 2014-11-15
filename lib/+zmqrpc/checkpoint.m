function response = checkpoint
  [~, serverPath, sandboxPath, tempPath] = zmqrpc.paths;
  paths = {serverPath, sandboxPath, tempPath};

  response = 'do nothing';

  for n = 1:length(paths)
    stopfile = fullfile(paths{n}, 'stop.txt');
    statcode = exist(stopfile, 'file');
    if statcode == 2,
      delete(stopfile);
      response = 'stop';
    end

    debugfile = fullfile(paths{n}, 'debug.txt');
    statcode = exist(debugfile, 'file');
    if statcode == 2,
      delete(debugfile);
      response = 'debug';
    end
  end
end