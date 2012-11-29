; dns-com-awns-ping
;
; Depends on MCP/2.1 macros - load this after them
; 
; This is free software. biafra a t MOOsaico
; v0.2 2006.03.21 . Added trunc()
;                 . Added v5.0 /status_add (Darren Bane)
; v0.1 2005.03.15 . turn off option
; v0.0 2005.03.12 . Initial version
;
; o  /mooping on|off to switch the functionality

/set mooping=1
/def mooping = \
    /if ({1} =~ "on") \
        /set mooping=1 %;\
        /echo \% dns-com-awns-ping turned on %;\
        /mcp21_dns-com-awns-ping %;\
    /elseif ({1} =~ "off") \
        /set mooping=0 %;\
        /echo \% dns-com-awns-ping turned off %;\
        /set ping_leds= %;\
    /else \
        /echo \% Syntax: /mooping on|off %;\
    /endif

/set ping_currentid=4000
/set ping_time=0
/set ping_leds=.
/set ping_freq=30
/def -Ttiny.moo -p20003 -mregexp -agG -F \
    -t'^#\\$#mcp-negotiate-can (.*)dns-com-awns-ping' ping_start = \
    /if ({visual} =~ "off") \
         /echo \%    dns-com-awns-ping not shown. Set %/visual on    \% %;\
    /endif %;\
    /if /ismacro status_add%; /then \
      /status_add -A@world -x ping_leds:5 %;\
    /else \
      /set warn_status=off %;\
      /if ({status_fields} !/ "*ping_leds*") \
          /if (regmatch("(.*@world :1 )(.*)",{status_fields})) \
              /set status_fields=%P1ping_leds:5 :1 %P2 %;\
          /endif %;\
      /endif %;\
     /endif %;\
    /mcp21_dns-com-awns-ping

/def -Ttiny.moo mcp21_dns-com-awns-ping = \
    /if ({mooping}) \
        /set ping_currentid=$[{ping_currentid}+1] %;\
        /let id=%ping_currentid %;\
        /set ping_time=$[time()] %;\
        /mcp21_send dns-com-awns-ping id: %id %;\
    /endif

/def -Ttiny.moo mcp21_dns-com-awns-ping-reply = \
    /set ping_rtt=$[trunc(time()-{ping_time})] %;\
    /if ({mcp_tag_id} =~ {ping_currentid}) \
        /ping_show_rtt %ping_rtt %;\
    /endif %;\
    /repeat -%{ping_freq} 1 /mcp21_dns-com-awns-ping

/def -Ttiny.moo ping_show_rtt = \
    /if ({1} == "0") \
        /set ping_leds=. %;\
    /else \
        /set ping_leds=%1 %;\
    /endif

/set mcp21_dns_com_awns_ping_min_version=1.0
/set mcp21_dns_com_awns_ping_max_version=1.0
/mcp21_add_package dns-com-awns-ping

