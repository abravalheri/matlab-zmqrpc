function files = savefigs
  figHandles = findobj('Type','figure');
  figLen = length(figHandles);
  files = cell(1, figLen);

  [~, ~, ~, tempPath] = zmqrpc.paths;

  timestamp = gentimestamp;
  for n = 1:figLen
    % get figure and axes handle
    fig = figHandles(figLen-n+1);
    ax  = get(fig, 'CurrentAxes');
    % get the title
    h = get(ax, 'Title');
    title = get(h,'String');
    % genearate path
    stamp = [timestamp '_' int2str(n)]; % unique prefrix to avoid file colisions
    name  = [stamp '_' genvarname(title) '.png'];
    figPath = fullfile(tempPath, name);
    % save figure
    set(fig, 'PaperPositionMode', 'auto')
    print(fig, '-dpng', '-r100', figPath);
    % cleanup
    % close(fig);
    files{n} = name;
  end

end

function stamp = gentimestamp
  t = clock; % current time
  day = datestr(t, 'yyyy-mm-dd');
  moment = strcat(datestr(t, 'HH'), 'h', datestr(t, 'MM'), 'm', datestr(t,'ss'), 's', datestr(t,'fff'), 'ms');

  stamp = [day '_' moment];
end