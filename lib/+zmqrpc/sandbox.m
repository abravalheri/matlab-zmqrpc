function fileArray = sandbox(varargin)
  [~, ~, sandboxPath, tempPath] = zmqrpc.paths;

  if nargin < 1
    varargin = {'*'};
  end

  fileArray = cellfun(@(file) dir(fullfile(sandboxPath, [file '.json'])), varargin, 'UniformOutput', false);
  fileArray = vertcat(fileArray{:});
end