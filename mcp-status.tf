; dns-com-awns-status
;
; Depends on MCP/2.1 macros - load this after them
; http://www.awns.com/tkMOO-light/plugins/
; v1.0 Ok, this works well.
; v0.1 2005.03.10 clean status after 30s
; v0.0 2005.03.10 by Biafra a t MOOsaico
;
; o  It works with X and a Window Manager as it uses the window title
; o  It works too with a remote shell connection with putty

; /xtitle
/require tools.tf

/def -Ttiny.moo mcp21_dns-com-awns-status = \
    /xtitle %{mcp_tag_text} %;\
    /repeat -30 1 /xtitle %{mcp21_fg_world}

/set mcp21_dns_com_awns_status_min_version=1.0
/set mcp21_dns_com_awns_status_max_version=1.0
/mcp21_add_package dns-com-awns-status

