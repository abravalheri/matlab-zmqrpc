function message = recvstr(socket)
  message = '';
  rc = 1;

  while rc > 0
    part = char(zmq_recv(socket, 255));
    message = [message part];
    rc = zmq_getsockopt(socket, 'ZMQ_RCVMORE');
  end

  fprintf('RECV:\n''%s''\n', message);
end