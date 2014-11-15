function [rootPath, serverPath, sandboxPath, tempPath] = paths
  % Return the paths used for this library

  [serverPath, ~, ~] = fileparts(mfilename('fullpath'));
  [rootPath, ~, ~] = fileparts(serverPath);
  [rootPath, ~, ~] = fileparts(rootPath);
  [rootPath, ~, ~] = fileparts(rootPath);
  sandboxPath = fullfile(rootPath, 'sandbox');
  tempPath = fullfile(rootPath, 'temp');
end