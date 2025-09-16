#!/usr/bin/env bash

# Limite de caracteres para o título
max_title_length=25

# Verifica se o Spotify está rodando
if ! pgrep -x spotify > /dev/null; then
    echo ""
    exit 0
fi

# Verifica se playerctl responde corretamente
if ! playerctl --player=spotify status &>/dev/null; then
    echo ""
    exit 0
fi

status=$(playerctl --player=spotify status)
artist=$(playerctl --player=spotify metadata artist)
title=$(playerctl --player=spotify metadata title)
position=$(playerctl --player=spotify position | awk -F. '{print $1}')
duration=$(playerctl --player=spotify metadata mpris:length 2>/dev/null | awk '{print int($1 / 1000000)}')

# Formata posição e duração
format_time() {
    local t=$1
    printf "%02d:%02d" $((t / 60)) $((t % 60))
}

pos_fmt=$(format_time "$position")
dur_fmt=$(format_time "$duration")

# Truncamento apenas do título (se necessário)
if [ "${#title}" -gt "$max_title_length" ]; then
    title="${title:0:$((max_title_length - 3))}..."
fi

# Ícones
icon_play=""
icon_pause=""

# Texto final
output="$artist - $title [$pos_fmt/$dur_fmt]"

if [ "$status" = "Playing" ]; then
    echo "$icon_play $output"
elif [ "$status" = "Paused" ]; then
    echo "$icon_pause $output"
else
    echo ""
fi

