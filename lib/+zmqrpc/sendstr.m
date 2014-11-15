function sendstr(socket, message)
  offset = 1;
  len = 255;

  L = length(message);
  N = floor(L/len);

  for m = 1:N
    part = message(offset:(offset+len));
    offset = offset+len;
    zmq_send(socket, uint8(part), 'ZMQ_SNDMORE');
  end

  part = sprintf('%s\n', message(offset:end));
  zmq_send(socket, uint8(part));

  fprintf('SEND:\n''%s''\n', message);
end