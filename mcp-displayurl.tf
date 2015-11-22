; dns-com-awns-displayurl
;
; Depends on MCP/2.1 macros - load this after them
; v0.2 2015.11.22 Use default system browser - just url, no target info
; v0.1 2005.03.10 open in new tab
; v0.0 2005.03.10 by Biafra a t MOOsaico
;
; o  If you want to force the use of a browser instead of the system
;    default one define it with $BROWSER
; o  /displayurl on|off to switch the functionality

/set displayurl_browser=~/lib/tf/mcp21-tf-packages/mcp-displayurl.sh
 
/def -Ttiny.moo mcp21_dns-com-awns-displayurl = \
    /if ({displayurl}) \
       /eval /sys %{displayurl_browser} "%{mcp_tag_url}" %;\
    /endif

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
 
