mcp21-tf-packages
=================

TinyFugue MOO Client Protocol MCP/2.1 packages

Get the MCP/2.1 macros from [Ben Jackson](http://ben.com/MOO/tf-mcp.html).
Unpack it in your `tf-lib`. I'm using `~/lib/tf/`. With these
macros you will get MCP (MOO Client Protocol) support from tf so you can
interact with some moo packages.
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

An example for the beginning of your `.tfrc`:

    /require ~/tiny.world

    /load ~/lib/tf/mcp-2/mcp21.tf
    /load ~/lib/tf/mcp-2/mcp-negotiate.tf
    /load ~/lib/tf/mcp-2/simpleedit.tf
    /load ~/lib/tf/mcp-2/local-edit.tf
    
    /load ~/lib/tf/mcp21-tf-packages/mcp-client-info.tf
    /load ~/lib/tf/mcp21-tf-packages/mcp-displayurl.tf
    /load ~/lib/tf/mcp21-tf-packages/mcp-ping.tf
    /load ~/lib/tf/mcp21-tf-packages/mcp-status.tf
    /load ~/lib/tf/mcp21-tf-packages/mcp-msp.tf
    
    /visual on
    
    /mooping on

After connecting with your character to a MCP/2.1 enabled MOO you can use
the `@mcp` command to check the result of the packages negotiation.

    @mcp
    session: #3375
    dns-com-awns-displayurl (#11112) 1.0
    dns-com-awns-ping (#12212) 1.0
    dns-com-awns-status (#12112) 1.0
    dns-com-vmoo-client (#12122) 1.0
    dns-com-zuggsoft-msp (#12021) 1.0
    dns-org-mud-moo-simpleedit (#2212) 1.0
    mcp-negotiate (#1212) 2.0
    ---

