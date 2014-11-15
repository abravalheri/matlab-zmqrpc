function finalize(serverObj)
  % Finalize ZMQ low level
  zmq_unbind(serverObj.socket, serverObj.address);
  zmq_close(serverObj.socket);
  zmq_ctx_shutdown(serverObj.context);
  zmq_ctx_term(serverObj.context);
end