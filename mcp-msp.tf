; dns-com-zuggsoft-msp
;
; alfa
; Depends on MCP/2.1 macros - load this after them
; Copyright (c) 2006 biafra a t MOOsaico
; This is free software
;
; Limited. Doesn't implement all features
; 0.5 work in v4
; 0.4 sound ok

/set msp_PATH=/tmp/
;/set msp_GET=wget --quiet --timestamping
;/set msp_GET=wget --timestamping
/set msp_GET=curl --silent --remote-name
/set msp_PLAY=aplay --quiet 
/if ({MCP_MSP_PATH} !/ "") \
    msp_PATH=%{MCP_MSP_PATH} %;\
/endif
/if ({MCP_MSP_GET} !/ "") \
    msp_GET=%{MCP_MSP_GET} %;\
/endif
/if ({MCP_MSP_PLAY} !/ "") \
    msp_PLAY=%{MCP_MSP_PLAY} %;\
/endif

/def -Ttiny.moo mcp21_dns-com-zuggsoft-msp-sound = \
    /test $[regmatch('([-_0-9a-z]+\.wav)',{mcp_tag_name})] %;\
    /let oshpause=%{shpause} %;\
    /set shpause=0 %;\
    /sys (mkdir -p %{msp_PATH}%PL 2> /dev/null ) %;\
    /sh -q (cd %{msp_PATH}%PL ;  %{msp_GET} "%{mcp_tag_u}%{mcp_tag_name}" ; %{msp_PLAY} %P1 \&) 2> /dev/null \& %;\
    /set shpause=%{oshpause}

/set mcp21_dns_com_zuggsoft_msp_min_version=1.0
/set mcp21_dns_com_zuggsoft_msp_max_version=2.0
/mcp21_add_package dns-com-zuggsoft-msp

