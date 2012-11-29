; dns-com-awns-displayurl
;
; Depends on MCP/2.1 macros - load this after them
; http://www.awns.com/tkMOO-light/plugins/
; v0.1 2005.03.10 open in new tab
; v0.0 2005.03.10 by Biafra a t MOOsaico
;
; o  Change "dns_com_awns_displayurl_browserremote" to support
;    the browser you use
;    ex: http://www.mozilla.org/unix/remote.html
; o  /displayurl on|off to switch the functionality

;/set displayurl_browser_remote=firefox -remote
/set displayurl_browser_remote=mozilla -remote
 
/def -Ttiny.moo mcp21_dns-com-awns-displayurl = \
    /if ({displayurl}) \
       /eval /sys %{displayurl_browser_remote} "openurl(%{mcp_tag_url},new-window)" %;\
    /endif
;       /eval /sys %{displayurl_browser_remote} "openurl(%{mcp_tag_url},new-tab)" %;\
;    /endif

/set displayurl=1
/def displayurl = \
    /if ({1} =~ "on") \
        /set displayurl=1 %;\
        /echo \% dns-com-awns-displayurl turned on %;\
    /elseif ({1} =~ "off") \
        /set displayurl=0 %;\
        /echo \% dns-com-awns-displayurl turned off %;\
    /else \
        /echo \% Syntax: /displayurl on|off %;\
    /endif
 
/set mcp21_dns_com_awns_displayurl_min_version=1.0
/set mcp21_dns_com_awns_displayurl_max_version=1.0
/mcp21_add_package dns-com-awns-displayurl
 
