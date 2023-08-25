#!/bin/bash
#to run this script go into the folder where it is then run: ./install_conkyv2.sh
rm -r /home/$USER/.conky/niceconk
rm /home/$USER/.config/autostart/conky-timetrek.desktop
#
set -eu
dpkg -l | grep -qw conky-all || sudo apt-get install conky-all -y
#
#
mkdir -p /home/$USER/.conky/niceconk/
mkdir -p /home/$USER/.fonts/
#
#
cat << 'EOF' | tee /home/$USER/.conky/niceconk/timetrek
background no
update_interval 1

own_window_class systemConky
own_window yes
#all options for own_window_type are normal, desktop, dock, panel or override
own_window_type dock
own_window_argb_visual yes
own_window_argb_value 230
own_window_transparent no
own_window_hints undecorated,below,sticky,skip_taskbar,skip_pager

use_xft yes
xft_alpha 1
override_utf8_locale yes
total_run_times 0

double_buffer yes
no_buffers yes
draw_shades no
draw_outline no
draw_borders no
draw_graph_borders no

top_name_width 9
uppercase no

# number of cpu/net samples to average
# set to 1 to disable averaging
cpu_avg_samples 2
net_avg_samples 2
use_spacer right

default_color E0EBF1 #E6E6FA

alignment top_right
gap_x 15
gap_y 15
minimum_size 410 247
maximum_width 410

border_outer_margin 2

text_buffer_size 1024
imlib_cache_size 0

#Shades of Gray#
color0 E6E6FA
color1 DDDDDD
color2 AAAAAA
color3 888888
#Orange#
color4 996633
#MY Light Green#
color5 90EE90
#MY Blue Light TEXT#
color6 55ABFF
#Light Orange#
color7 FFA300
#MY Blue Light BARS#
color8 1E90FF
#My Blue Graph#
#001030 0057FF#
#My Gray Graph#
#474747 E9E9E9#
#My Orange Graph#
#562E00 FF8800#
###End Color###

lua_load /home/xxuserxx/.conky/niceconk/time_bar.lua
lua_draw_hook_post draw_boxes

own_window_colour 2F343F

TEXT
#
#TIME
#
#############################################
${voffset -9}${color3}${hr}${color}
${voffset -5}${voffset 0}${goto 230}${font DejaVu Sans Mono:bold:size=13}${color5}${time %H}${color} : ${color7}${time %M}${color} : ${color6}${time %S}${color}${font}
${voffset 31}${font DejaVu Sans Mono:bold:size=13}${alignc}${time %A, %B %d, %Y}${font}
#${voffset -10}${color3}${hr}${color}
#
#CPU
#
${voffset -8}${offset 4}${font DejaVu Sans Mono:bold:size=9}Cpu: ${color5}$cpu%${color} ${voffset -4}${goto 75}${cpugraph 562E00 FF8800}
#
#DRIVE and RAM
#
${voffset -8}${offset 4}${font DejaVu Sans Mono:bold:size=9}Root: ${color6}${fs_used_perc /}%${color} ${color7}  ${fs_used /}${color} / ${fs_size /}${color}   ${color5}${fs_bar 4 /}${color}
${voffset 0}${offset 4}${font DejaVu Sans Mono:bold:size=9}Home: ${color6}${fs_used_perc /home}%${color} ${color7}  ${fs_used /home}${color} / ${fs_size /home}${color}   ${color5}${fs_bar 4 /home}${color}
${voffset 0}${offset 4}${font DejaVu Sans Mono:bold:size=9}Ram: ${color6}$memperc%${color} ${color7}  $mem${color} / $memmax${color}   ${color5}${membar 4}${color}
#
#NETWORK
#
${voffset 0}${offset 4}${font DejaVu Sans Mono:bold:size=9}Down: ${color7}${downspeed wlan0}${color} ${alignr}${color1}Up: ${color} ${color7}${upspeed wlan0}${font}${color}
${voffset -17}${color3}${stippled_hr}${color}
${voffset -13}${downspeedgraph wlan0 25,200 474747 E9E9E9}${alignr}${upspeedgraph wlan0 25,200 E9E9E9 474747}
${voffset -23}${color3}${stippled_hr}${color}
${voffset 2}${offset 4}${font DejaVu Sans Mono:bold:size=9}${voffset -10}Received:   ${color7}${totaldown wlan0}${color} ${alignr}Sent:   ${color7}${totalup wlan0}${color}
#
#SYSTEM
#
${voffset 0}${offset 4}${font DejaVu Sans Mono:bold:size=9}Proccesing:  ${running_processes}/ ${color7}${processes}${color} $alignr TCP Connections:   ${color7}${tcp_portmon 1 65535 count}${color}
${voffset 0}${offset 4}${font DejaVu Sans Mono:bold:size=9}$sysname:  ${color7}$kernel${color} $machine $alignr Uptime:  ${color7}$uptime${color}
${voffset -5}${color3}${hr}${color}
${voffset -120}

##==================================== Regards, Etles_Team and trytip ============================================##
EOF
#
#
#
#
#
#
#
#
#
cat << 'EOF' | tee /home/$USER/.conky/niceconk/time_bar.lua
--[[
Time Bar 19 June 2011
by mrpeach
Edited by Etles_Team in 19 January 2016.

20 June 2011 script for HOURS, MINUTES & SECONDS added by Sector11

Call this script as follow in conkyrc file before (TEXT) :
    lua_load ~/.conky/Conky-Name/scripts/lua/time_bar.lua
    lua_draw_hook_pre draw_boxes

]] 

require 'cairo'

function rgb_to_r_g_b(color, alpha)
return ((color / 0x10000) % 0x100) / 255., ((color / 0x100) % 0x100) / 255., (color % 0x100) / 255., alpha
end

function conky_draw_boxes()
if conky_window == nil then return end
local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
cr = cairo_create(cs)
local updates=tonumber(conky_parse('${updates}'))
if updates>1 then
--======================================================================================================================--
--hour box settings
----------------------------
local hour_start_x=10           -- left &right
local hour_start_y=15            -- up & down
local hour_width=12             -- Actually it's the height
local hour_total_length=200     -- total length of all boxes and gaps
local hour_bg_color=0xFFFFFF    -- background color of box
local hour_fg_color=0x90EE90    -- foreground color
local hour_gap=2                -- if display shows no divisions this is probably set too high
----------------------------
--minute box settings
----------------------------
local minute_start_x=10         -- left &right
local minute_start_y=31         -- up & down
local minute_width=12           -- Actually it's the height
local minute_total_length=400   -- total length of all boxes and gaps
local minute_bg_color=0xFFFFFF  -- background color of box
local minute_fg_color=0xFFA300  -- foreground color
local minute_gap=2              -- if display shows no divisions this is probably set too high
----------------------------
--second box settings
----------------------------
local second_start_x=10         -- left &right
local second_start_y=47         -- up & down
local second_width=12           -- Actually it's the height
local second_total_length=400   -- total length of all boxes and gaps
local second_bg_color=0xFFFFFF  -- background color of box
local second_fg_color=0x55ABFF  -- foreground color
local second_gap=2              -- if display shows no divisions this is probably set too high

--=====================================================================================================================--
-- Hour Settings
----------------------------
local hour_bits=12
local hour2num=tonumber(os.date("%I"))
-------------------------------------------------
local box_total=hour_total_length-(hour_gap*(hour_bits-1))
local box_len=box_total/hour_bits
cairo_set_source_rgba(cr,rgb_to_r_g_b(hour_bg_color,0.2))
for i=1,hour_bits do
if i<=tonumber(hour2num) then
cairo_set_source_rgba(cr,rgb_to_r_g_b(hour_fg_color,1))
else
cairo_set_source_rgba(cr,rgb_to_r_g_b(hour_bg_color,0.2))
end
cairo_rectangle(cr,hour_start_x+(box_len*(i-1))+(hour_gap*(i-1)),hour_start_y, box_len, hour_width)
cairo_fill (cr)
end
----------------------------
-- Minute Settings
----------------------------
local minute_bits=60
local minute2num=tonumber(os.date("%M"))
-------------------------------------------------
local box_total=minute_total_length-(minute_gap*(minute_bits-1))
local box_len=box_total/minute_bits
cairo_set_source_rgba(cr,rgb_to_r_g_b(minute_bg_color,0.2))
for i=1,minute_bits do
if i<=tonumber(minute2num) then
cairo_set_source_rgba(cr,rgb_to_r_g_b(minute_fg_color,1))
else
cairo_set_source_rgba(cr,rgb_to_r_g_b(minute_bg_color,0.2))
end
cairo_rectangle(cr,minute_start_x+(box_len*(i-1))+(minute_gap*(i-1)),minute_start_y, box_len, minute_width)
cairo_fill (cr)
end
----------------------------
-- Second Settings
----------------------------
local second_bits=60
local second2num=tonumber(os.date("%S"))
-------------------------------------------------
local box_total=second_total_length-(second_gap*(second_bits-1))
local box_len=box_total/second_bits
cairo_set_source_rgba(cr,rgb_to_r_g_b(second_bg_color,0.2))
for i=1,second_bits do
if i<=tonumber(second2num) then
cairo_set_source_rgba(cr,rgb_to_r_g_b(second_fg_color,1))
else
cairo_set_source_rgba(cr,rgb_to_r_g_b(second_bg_color,0.2))
end
cairo_rectangle(cr,second_start_x+(box_len*(i-1))+(second_gap*(i-1)),second_start_y, box_len, second_width)
cairo_fill (cr)
end
-------------------------------------------------
--##############################################################################
--##############################################################################
end-- if updates>5
cairo_destroy(cr)
cairo_surface_destroy(cs)
cr=nil
end-- end main function
--============================================ Regards, Etles_Team =====================================================--
EOF



#net_interface_lan=$(echo $(ls /sys/class/net) | cut -d ' ' -f 1)
net_interface_wlan=$(echo $(ls /sys/class/net) | cut -d ' ' -f 3)
sed -i "s/wlan0/${net_interface_wlan}/g" $HOME/.conky/niceconk/timetrek
sed -i "s/xxuserxx/$USER/g" $HOME/.conky/niceconk/timetrek
#
#
cat << 'EOF' | tee /home/$USER/.config/autostart/conky-timetrek.desktop
[Desktop Entry]
Type=Application
Name=conky
Exec=conky --daemonize --pause=7 -q -c /home/xxuserxx/.conky/niceconk/timetrek &
StartupNotify=false
Terminal=false
EOF
sed -i "s/xxuserxx/$USER/g" /home/$USER/.config/autostart/conky-timetrek.desktop