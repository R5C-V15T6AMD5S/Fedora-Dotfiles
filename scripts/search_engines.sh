#!/usr/bin/env bash
#
# Script name: dmsearch
# Description: Search various search engines (inspired by surfraw).
# Dependencies: dmenu and a web browser
# GitLab: https://www.gitlab.com/dwt1/dmscripts
# Contributors: Derek Taylor

# An array of search engines.  You can edit this list to add/remove
# search engines. The format must be: "engine_name - url".
# The url format must allow for the search keywords at the end of the url.
# For example: https://www.amazon.com/s?k=XXXX searches Amazon for 'XXXX'.

BROWSER="firefox"

declare -a options=(
"ArtStation - https://www.artstation.com/search?sort_by=relevance&query="
"Amazon - https://www.amazon.com/s?k="
"Archaur - https://aur.archlinux.org/packages/?O=0&K="
"Archpkg - https://archlinux.org/packages/?sort=&q="
"ArchWiki - https://wiki.archlinux.org/index.php?search="
"Arxiv - https://arxiv.org/search/?searchtype=all&source=header&query="
"BBCNews - https://www.bbc.co.uk/search?q="
"Bing - https://www.bing.com/search?q="
"Cliki - https://www.cliki.net/site/search?query="
"CNN - https://www.cnn.com/search?q="
"Coinbase - https://www.coinbase.com/price?query="
"DevianArt - https://www.deviantart.com/search?q="
"Debianpkg - https://packages.debian.org/search?suite=default&section=all&arch=any&searchon=names&keywords="
"Discogs - https://www.discogs.com/search/?&type=all&q="
"DuckDuckGo - https://duckduckgo.com/?q="
"DuckDuckGoImages - https://duckduckgo.com/?t=ffab&atb=v345-1&iax=images&ia=images&q="
"Ebay - https://www.ebay.com/sch/i.html?&_nkw="
"Genius - https://genius.com/search?q="
"Github - https://github.com/search?q="
"GitLab - https://gitlab.com/search?search="
"Google - https://www.google.com/search?q="
"GoogleImages - https://www.google.com/search?hl=en&tbm=isch&q="
"GoogleNews - https://news.google.com/search?q="
"IMDb - https://www.imdb.com/find?q="
"Reddit - https://www.reddit.com/search/?q="
"Slashdot - https://slashdot.org/index2.pl?fhfilter="
"SocialBlade - https://socialblade.com/youtube/user/"
"SourceForge - https://sourceforge.net/directory/?q="
"Stack - https://stackoverflow.com/search?q="
"Startpage - https://www.startpage.com/do/dsearch?query="
"Stockquote - https://finance.yahoo.com/quote/"
"Thesaurus - https://www.thesaurus.com/misspelling?term="
"Translate - https://translate.google.com/?sl=auto&tl=en&text="
"UrbanDictionary - https://www.urbandictionary.com/define.php?term="
"Wayback - https://web.archive.org/web/*/"
"Webster - https://www.merriam-webster.com/dictionary/"
"Wikipedia - https://en.wikipedia.org/wiki/"
"Wiktionary - https://en.wiktionary.org/wiki/"
"WolframAlpha - https://www.wolframalpha.com/input/?i="
"YouTube - https://www.youtube.com/results?search_query="
)

# Picking a search engine.
while [ -z "$engine" ]; do
    enginelist=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i 20 -p 'Choose search engine :') || exit
    engineurl=$(echo "$enginelist" | awk '{print $NF}')
    engine=$(echo "$enginelist" | awk '{print $1}')
done

# Searching the chosen engine.
while [ -z "$query" ]; do
    query=$(rofi -dmenu -p "Searching $engine :") || exit
done

# Picking a web browser.
"$BROWSER" "$engineurl""$query"


