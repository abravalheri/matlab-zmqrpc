# matlab-zmqrpc

ZMQ based JSON-RPC server, with an additional letters soup

## Introduction

This project is just starting... The stuff placed here was manually tested and seems to work, but it has to evolve. There are so many lines that **must** be refactored: it's missing OOP, it lacks from automated tests, and so on.

In the future, I hope this will be an implementation of [JSON-RPC](http://www.jsonrpc.org) based server in MATLAB, and perhaps a client to...

I will make an effort to isolate the transport mechanism (now [ZMQ](http://zeromq.org/)) from the server itself, and rename this repo to `matlab-rpc`

## Installing

It's just as simple as downloading the coding and putting the folder in the matlab path...

This project make use of two very good libraries [jsonlab](http://iso2mesh.sourceforge.net/cgi-bin/index.cgi?jsonlab) and [matlab-zmq](https://github.com/fagg/matlab-zmq/). Please make sure they are in the path, and consider using [require.m](https://github.com/abravalheri/require.m).

## Usage

Create a folder named `sandbox` in the same level that the root folder for this project. Inside this folder put `*.json` files describing which functions may be called by RPC. These files must have the same name than the function, except from extension, and have two properties: `params` and `result`. `params` should be an array with the name of the parameters for the function and `result` should be an array with the name of the variables returned by the function.

After doing this, the following command should be enough:

```matlab
zmqrpc.server
```

## Stuff Doesn't Work

This work is very experimental and unstable... Any feedback you can give me on this would be gratefully received (see section **Reporting a Bug** at [CONTRIBUTING](CONTRIBUTING.md)). Please, make yourself comfortable in contributing :blush:.

## Contributing

I love contributions! Please have a look at [CONTRIBUTING](CONTRIBUTING.md) and consider help me with the bellow stuff:

### Well-know list of TODOs

- Refactor code, making it OOP
- Abstract transport mechanism
- Implement a mechanism of registring handles (including namespaces)
- Isolate `Sandbox`, as an option for handle
- Have a deep look at [fileexchange/jsonrpc2](http://www.mathworks.com/matlabcentral/fileexchange/45238-jsonrpc2--a-set-of-classes-to-encode-decode-json-rpc-messages) and see if we can borrow something from there.