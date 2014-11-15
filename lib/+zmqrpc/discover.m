function response = discover(varargin)
  response = struct('method', {}, 'params', {}, 'result', {}, 'description', {});
  fileArray = zmqrpc.sandbox(varargin{:});
  fileNo = length(fileArray);
  [~, ~, sandboxPath, tempPath] = zmqrpc.paths;

  for n = 1:fileNo
    [~, name, ext] = fileparts(fileArray(n).name);
    response(n).method = name;
    desc = loadjson(fullfile(sandboxPath, [name ext]));
    response(n).params = desc(1).params;

    if isfield(desc(1), 'result')
      response(n).result = desc(1).result;
    end

    if isfield(desc(1), 'description')
      response(n).description = desc(1).description;
    else
      response(n).description = help(name);
    end
  end
end