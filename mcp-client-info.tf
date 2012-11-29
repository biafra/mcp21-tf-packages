; dns-com-vmoo-client
;
; Depends on MCP/2.1 macros - load this after them
; look #12122 @MOOsaico
; This is free software. biafra a t MOOsaico
; v1.4 catched again by mcp-negotiate
; v1.3 remove nl-vgmoo as all implementation now use com-vmoo;
; v1.2 send columns()-1 as tf wraps at -1 max columns;
;      Right rows as /visual on takes some lines of the term
; v1.1 Send screensize right after negotiation;
; v1.0 Initial version
; (warnings cleaning by The_Ant a t MOOsaico)

/set mcp21_dns_com_vmoo_client_support=0

/def -Ttiny.moo -p20003 -mregexp -agG -F -t'^#\\$#mcp-negotiate-can (.*)dns-com-vmoo-client' = \
	/repeat -2 1 /mcp21_dns-com-vmoo-client-info

;/def -Ttiny.moo -p20003 -mregexp -agG -F -t'^#\\$#mcp-negotiate-end'  mcp21_dns-com-vmoo-client-info = \
/def  mcp21_dns-com-vmoo-client-info = \
	/mcp21_send dns-com-vmoo-client-info name: TinyFugue text-version: "$(/eval /ver)" internal-version: 0 %;\
    /mcp21_dns-com-vmoo-client-screensize $[columns()-1] $[lines()-(visual ? isize+1 : 0)] %;\

/def -h'RESIZE' -Ttiny.moo -i _resize_hook = \
    /mcp21_dns-com-vmoo-client-screensize %1 $[lines()-(visual ? isize+1 : 0)]
/def -Ttiny.moo mcp21_dns-com-vmoo-client-screensize = \
    /mcp21_send dns-com-vmoo-client-screensize cols: %1 rows: %2

/def -Ttiny.moo mcp21_dns-com-vmoo-client-disconnect = \
	/retry_off %world_name

/set mcp21_dns_com_vmoo_client_min_version=1.0
/set mcp21_dns_com_vmoo_client_max_version=1.0
/mcp21_add_package dns-com-vmoo-client
