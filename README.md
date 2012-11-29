mcp21-tf-packages
=================

TinyFugue MOO Client Protocol MCP/2.1 packages

Get the MCP/2.1 macros from [Ben Jackson](http://ben.com/MOO/tf-mcp.html).
Unpack it in your `tf-lib`. With these macros you will get MCP (MOO Client
Protocol) support from tf so you can interact with some moo packages.
One of the most important one is local editing (edit text in a separate
window). Make sure your `/addworld` includes `-Ttiny.moo` on your MOO
worlds.

> **dns-com-vmoo-client**
>
> Implements some client info to be known within the MOO. Name,
> version and client window size are some of them. Nice for better
> tables and horizontal text.

> **dns-com-awns-status**
>
> The package allows the server to send short, human readable,
> informational messages to cooperating clients. The client will display
> it on a status bar. This implementation uses the window title.

> **dns-com-awns-displayurl**
>
> The package allows the server to send URLs to the client. The client
> should then use a client-side webbrowser to display the contents of the
> URL. You have to edit it and write your browser name.

> **dns-com-awns-ping**
>
> Allows both client and server to test the latency of a user's connection,
> a rough indication of net-lag. An indicator shows up on the right side
> of the worlds name on the visual bar. Of course you need /visual on.
> This is just the client test for now.

