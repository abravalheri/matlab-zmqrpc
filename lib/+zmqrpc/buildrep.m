function response = buildrep(id, result, figs)
  response = struct;
  response.jsonrpc = '2.0';
  response.result  = result;
  response.id = id;
  if length(figs) > 0
    response.figure = figs;
  end
end