#!/bin/bash
#to run this script go into the folder where it is then run: ./install_conky.sh
#rm -r /home/$USER/.conkyrc
#
set -eu
#
dpkg -l | grep -qw conky-all || sudo apt-get install conky-all -y
#
cat << 'EOF' | tee /home/$USER/.conkyrc
-- vim: ts=4 sw=4 noet ai cindent syntax=lua
conky.config = {
	background = true,
	border_width = 1,
	cpu_avg_samples = 2,
	draw_borders = false,
	draw_graph_borders = true,
	draw_outline = false,
	draw_shades = false,
	use_xft = true,
	font = 'DejaVu Sans Mono:size=7',
	default_color = 'black',
	alignment ='top_right',
	gap_x = 22,
	gap_y = 22,
	net_avg_samples = 2,
	no_buffers = true,
	out_to_console = false,
	out_to_stderr = false,
	extra_newline = false,
	own_window = false,
	own_window_class = 'conky',
	own_window_type = 'override',
	own_window_transparent = true,
	stippled_borders = 0,
	update_interval = 2.5,
	uppercase = false,
	use_spacer = 'none',
	show_graph_scale = false,
	show_graph_range = false
}

conky.text = [[
CPU 1 ${color #cc2222} ${cpu cpu1}% ${cpubar cpu1} $color
CPU 2 ${color #cc2222} ${cpu cpu2}% ${cpubar cpu2} $color
RAM  $color $mem/$memmax ${color #8844ee}${membar} $color
TMP  $color ${fs_used /tmp/}/${fs_size /tmp} ${fs_bar /tmp/}
/   $color ${fs_used /}/${fs_size /} ${color #ffffcc}${fs_bar /}

$color CPU  ${color #bbffbb} ${execi 30 sensors | grep 'Core 0' | cut -c15-17} C    $color Fan ${color #ffffcc} ${execi 30 sensors | grep 'Exhaust' | cut -c14-17} RPM

${color}Name              PID     CPU%   MEM%
${color #ffcccc} ${top name 1} ${top pid 1} ${top cpu 1} ${top mem 1} $color
 ${top name 2} ${top pid 2} ${top cpu 2} ${top mem 2}
 ${top name 3} ${top pid 3} ${top cpu 3} ${top mem 3}
 ${top name 4} ${top pid 4} ${top cpu 4} ${top mem 4}

${color}wlan0 (${addr wlan0}) ${color #8844ee}${alignr}${downspeed wlan0}$color / ${color #ddddff}${upspeed wlan0}
${color #8844ee}${downspeedgraph wlan0 16,100 ff0000 0000ff} ${color #ccccff}${upspeedgraph wlan0 16,100 0000ff ff0000}
${color}enp0s10 (${addr enp0s10}) ${color #8844ee}${alignr}${downspeed enp0s10}$color / ${color #ddddff}${upspeed enp0s10}
${color #8844ee}${downspeedgraph enp0s10 16,100 ff0000 0000ff} ${color #ddddff}${upspeedgraph enp0s10 16,100 0000ff ff0000}
]]
EOF
#
net_interface_lan=$(echo $(ls /sys/class/net) | cut -d ' ' -f 1)
net_interface_wlan=$(echo $(ls /sys/class/net) | cut -d ' ' -f 3)
sed -i "s/wlan0/${net_interface_wlan}/g" $HOME/.conkyrc
sed -i "s/enp0s10/${net_interface_lan}/g" $HOME/.conkyrc
#
#other conky configs:
#https://github.com/TheodoreBellas/Conky-SideBar
#https://github.com/luizfnunes/SimpleC-one-Conky