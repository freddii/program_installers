#!/bin/sh
#to run this script go into the folder where it is then run: ./install_whisker-commands.sh
#personal data
#
set -eu
#
#disable beep sound for deleting from trash:
#xset b off
#
#add short commands to whisker
file_whiskerrc=$(cd $HOME/.config/xfce4/panel/ && ls | egrep 'whiskermenu[0-9,_.-]{1,20}.rc' -o | tail -1)
today=`date '+%Y_%m_%d__%H_%M_%S'`;
cp $HOME/.config/xfce4/panel/$file_whiskerrc $HOME/.config/xfce4/panel/$file_whiskerrc"_old_"$today
sudo sed -n -i '/search-actions/q;p' $HOME/.config/xfce4/panel/$file_whiskerrc
#
#cat << 'EOF' | tee $HOME/.config/xfce4/panel/$file_whiskerrc
#EOF
#
tee -a $HOME/.config/xfce4/panel/$file_whiskerrc << END
search-actions=63
 
[action0]
name=Handbuchseiten
pattern=#
command=exo-open --launch TerminalEmulator man %s
regex=false
 
[action1]
name=Im Terminal ausführen
pattern=!
command=exo-open --launch TerminalEmulator %s
regex=false
 
[action2]
name=open address
pattern=^(file|http|https):\\/\\/(.*)$
command=exo-open \\0
regex=true
 
[action3]
name=amazon.de
pattern=!a
command=exo-open --launch WebBrowser https://www.amazon.de/s?ie=UTF8&field-keywords=%u
regex=false
 
[action4]
name=alexa.com
pattern=!alex
command=exo-open --launch WebBrowser http://www.alexa.com/siteinfo/%u
regex=false
 
[action5]
name=alibaba
pattern=!ali
command=exo-open --launch WebBrowser http://www.alibaba.com/trade/search?fsb=y&IndexArea=product_en&CatId=&SearchText=%u
regex=false
 
[action6]
name=archive.org
pattern=!ar
command=exo-open --launch WebBrowser https://web.archive.org/web/*/%u
regex=false
 
[action7]
name=open-link-in-browser
pattern=!b
command=exo-open --launch WebBrowser %s
regex=false
 
[action8]
name=chip.de
pattern=!c
command=exo-open --launch WebBrowser http://search.chip.de/?q=%u
regex=false
 
[action9]
name=packages.debian
pattern=!deb
command=exo-open --launch WebBrowser https://packages.debian.org/search?keywords=%u&searchon=names&suite=all&section=all
regex=false
 
[action10]
name=dict.uni-leipzig
pattern=!dul
command=exo-open --launch WebBrowser http://dict.uni-leipzig.de/index.php?wort=%u
regex=false
 
[action11]
name=ebaykleinanzeigen
pattern=!ek
command=exo-open --launch WebBrowser https://www.ebay-kleinanzeigen.de/s-%u/k0
regex=false
 
[action12]
name=explainshell
pattern=!ex
command=exo-open --launch WebBrowser http://explainshell.com/explain?cmd=%u
regex=false
 
[action13]
name=fredfire1
pattern=!ff
command=exo-open --launch WebBrowser https://fredfire1.wordpress.com/?s=%u&submit=Search
regex=false
 
[action14]
name=fredfire1-admin
pattern=!ffa
command=exo-open --launch WebBrowser https://fredfire1.wordpress.com/wp-admin/edit.php?s=%u&post_status=all&post_type=post&action=-1&m=0&cat=0&paged=1&action2=-1
regex=false
 
[action15]
name=github
pattern=!gi
command=exo-open --launch WebBrowser https://github.com/search?utf8=%E2%9C%93&q=%u
regex=false
 
[action16]
name=google
pattern=!go
command=exo-open --launch WebBrowser https://www.google.de/search?q=%u
regex=false
 
[action17]
name=hackaday
pattern=!h
command=exo-open --launch WebBrowser http://hackaday.com/?s=%u
regex=false
 
[action18]
name=metager
pattern=!m
command=exo-open --launch WebBrowser https://metager.de/meta/meta.ger3?focus=web&eingabe=%u
regex=false
 
[action19]
name=openstreetmap
pattern=!o
command=exo-open --launch WebBrowser https://www.openstreetmap.org/search?query=%u
regex=false
 
[action20]
name=proxy startpage
pattern=!ps
command=exo-open --launch WebBrowser https://www.startpage.com/do/dsearch?query=%u
regex=false
 
[action21]
name=raspberrypi.org
pattern=!rpi
command=exo-open --launch WebBrowser https://www.raspberrypi.org/?s=%u
regex=false
 
[action22]
name=startpage
pattern=!s
command=exo-open --launch WebBrowser https://www.startpage.com/do/dsearch?query=%u
regex=false
 
[action23]
name=superuser
pattern=!su
command=exo-open --launch WebBrowser https://superuser.com/search?q=%u
regex=false
 
[action24]
name=thingiverse
pattern=!t
command=exo-open --launch WebBrowser http://www.thingiverse.com/search?q=%u
regex=false
 
[action25]
name=utrace
pattern=!u
command=exo-open --launch WebBrowser http://www.utrace.de/?query=%u
regex=false
 
[action26]
name=vimeo
pattern=!v
command=exo-open --launch WebBrowser https://vimeo.com/search?q=%u
regex=false
 
[action27]
name=Wikipedia
pattern=!w
command=exo-open --launch WebBrowser https://de.wikipedia.org/wiki/%u
regex=false
 
[action28]
name=wolframalpha
pattern=!wa
command=exo-open --launch WebBrowser https://www.wolframalpha.com/input/?i=%u
regex=false
 
[action29]
name=wordpress
pattern=!wp
command=exo-open --launch WebBrowser https://en.search.wordpress.com/?src=organic&q=%u
regex=false
 
[action30]
name=yandex
pattern=!ya
command=exo-open --launch WebBrowser https://yandex.com/search/?text=%u
regex=false
 
[action31]
name=youtube
pattern=!y
command=exo-open --launch WebBrowser https://www.youtube.com/results?search_query=%u
regex=false
 
[action32]
name=archive.today
pattern=!art
command=exo-open --launch WebBrowser https://archive.today/?run=1&url=%u
regex=false
 
[action33]
name=assetstore.unity3d
pattern=!ua
command=exo-open --launch WebBrowser https://www.assetstore.unity3d.com/en/#!/search/page=1/sortby=relevance/query=%u
regex=false
 
[action34]
name=godot
pattern=!g
command=exo-open --launch WebBrowser http://docs.godotengine.org/en/stable/search.html?q=%s
regex=false

[action35]
name=alternativeto
pattern=!alt
command=exo-open --launch WebBrowser https://alternativeto.net/browse/search?q=%u
regex=false

[action36]
name=chefkoch
pattern=!ck
command=exo-open --launch WebBrowser https://www.chefkoch.de/rs/s0/%u/Rezepte.html
regex=false

[action37]
name=dict.cc
pattern=!dict
command=exo-open --launch WebBrowser https://de-en.dict.cc/?s=%u
regex=false

[action38]
name=ebay.de
pattern=!e
command=exo-open --launch WebBrowser https://www.ebay.de/sch/i.html?_from=R40&_nkw=%u
regex=false

[action39]
name=fredfire1-local
pattern=!fl
command=exo-open --launch WebBrowser http://raspberrypi.fritz.box/?s=%u
regex=false

[action40]
name=fredfire1-local
pattern=!f
command=exo-open --launch WebBrowser http://192.168.122.172/wordpress/?s=%u
regex=false

[action41]
name=translate-german-english
pattern=!tr
command=exo-open --launch TerminalEmulator ding  %s
regex=false

[action42]
name=kiwix-wikipedia
pattern=!kw
command=kiwix-desktop /home/xxUserxx/Documents/zim-files/wikipedia_de_all_maxi_2019-08.zim
regex=false

[action43]
name=scholar.google
pattern=!gs
command=exo-open --launch WebBrowser https://scholar.google.de/scholar?q=%u
regex=false

[action44]
name=metagermaps
pattern=!mm
command=exo-open --launch WebBrowser https://maps.metager.de/map/%u
regex=false

[action45]
name=Technik-und-Naturwissenschaften-bibo
pattern=!tib
command=exo-open --launch WebBrowser https://www.tib.eu/de/suchen?tx_tibsearch_search[query]=%u
regex=false

[action46]
name=zwangsversteigerung
pattern=!zvg
command=exo-open --launch WebBrowser https://www.zvg24.net/zwangsversteigerung/%u?search_form[location_id]=&search_form[search]=%u
regex=false

[action47]
name=zutun
pattern=!zt
command=exo-open --launch WebBrowser https://zutun.de/suche/%u//25
regex=false

[action48]
name=metajobs
pattern=!mj
command=exo-open --launch WebBrowser https://www.metajob.de/jobs-%u
regex=false

[action49]
name=joblift
pattern=!jl
command=exo-open --launch WebBrowser https://joblift.de/jobs-in-%u-im-10-km-Umkreis
regex=false

[action50]
name=chatnoir
pattern=!cn
command=exo-open --launch WebBrowser https://www.chatnoir.eu/?q=%u
regex=false

[action51]
name=uni-saarland
pattern=!us
command=exo-open --launch WebBrowser https://scidok.sulb.uni-saarland.de/simple-search?query=%u
regex=false

[action52]
name=bonnus
pattern=!bo
command=exo-open --launch WebBrowser https://bonnus.ulb.uni-bonn.de/Summon/Search?referrerBonnus=portlet&lookfor=%u
regex=false

[action53]
name=kvk.bibliothek.kit.edu
pattern=!kit
command=exo-open --launch WebBrowser https://kvk.bibliothek.kit.edu/hylib-bin/kvk/nph-kvk2.cgi?maske=kvk-redesign&lang=de&title=KIT-Bibliothek%3A+Karlsruher+Virtueller+Katalog+KVK+%3A+Ergebnisanzeige&head=%2F%2Fkvk.bibliothek.kit.edu%2Fasset%2Fhtml%2Fhead.html&header=%2F%2Fkvk.bibliothek.kit.edu%2Fasset%2Fhtml%2Fheader.html&spacer=%2F%2Fkvk.bibliothek.kit.edu%2Fasset%2Fhtml%2Fspacer.html&footer=%2F%2Fkvk.bibliothek.kit.edu%2Fasset%2Fhtml%2Ffooter.html&css=none&input-charset=utf-8&ALL=%u&TI=&AU=&CI=&ST=&PY=&SB=&SS=&PU=&VERBUENDE=&kataloge=K10PLUS&kataloge=BVB&kataloge=NRW&kataloge=HEBIS&kataloge=HEBIS_RETRO&kataloge=KOBV_SOLR&kataloge=DDB&kataloge=STABI_BERLIN&kataloge=TIB&kataloge=OEVK_GBV&kataloge=VD16&kataloge=VD17&kataloge=VD18&kataloge=VOE&kataloge=ZDB&VDL=&kataloge=LANDBIB_WLB&kataloge=LANDBIB_BAYERN&kataloge=LANDBIB_BERLIN&kataloge=LANDBIB_BRANDENBURG&kataloge=LANDBIB_HAMBURG&kataloge=LANDBIB_HESSEN&kataloge=LANDBIB_LBMV&kataloge=LANDBIB_NDS&kataloge=LANDBIB_NRW&kataloge=LANDBIB_RLB&kataloge=LANDBIB_SAARLAND&kataloge=LANDBIB_SACHSEN_ANHALT&kataloge=LANDBIB_SACHSEN&kataloge=LANDBIB_SHLB&kataloge=LANDBIB_THUERINGEN&VTHK=&kataloge=VTHK_ADV_E&kataloge=VTHK_AHS_NEUD&kataloge=VTHK_ARCHIV_N&kataloge=VTHK_AUG_MUENN&kataloge=VTHK_BIB_EKHN&kataloge=VTHK_BIB_WUERTT&kataloge=VTHK_BIR_MOD&kataloge=VTHK_BIR_S&kataloge=VTHK_BMZ_HH&kataloge=VTHK_CAR_FR&kataloge=VTHK_COME_VERB&kataloge=VTHK_DIA_S&kataloge=VTHK_DIO_A&kataloge=VTHK_DIO_AC&kataloge=VTHK_DIO_BA&kataloge=VTHK_DIO_LM&kataloge=VTHK_DIO_M&kataloge=VTHK_DIO_MS&kataloge=VTHK_DIO_ROTT&kataloge=VTHK_DIO_STPOEL&kataloge=VTHK_EAB_PB&kataloge=VTHK_EDD_K&kataloge=VTHK_EFH_BO&kataloge=VTHK_EFH_FR&kataloge=VTHK_EFH_H&kataloge=VTHK_EFH_N&kataloge=VTHK_EFH_RT&kataloge=VTHK_EHB_VERB&kataloge=VTHK_EKD_H&kataloge=VTHK_EKI_DO&kataloge=VTHK_EKP_SP&kataloge=VTHK_ERZ_FR&kataloge=VTHK_EZA_B&kataloge=VTHK_FTA_GI&kataloge=VTHK_IHL_LIEBENZELL&kataloge=VTHK_ITHF_HH&kataloge=VTHK_JAL_EMD&kataloge=VTHK_JAMI_PB&kataloge=VTHK_KFH_K&kataloge=VTHK_KHB_BI&kataloge=VTHK_KHS_B&kataloge=VTHK_KHS_W&kataloge=VTHK_KIRCHENKAMPF&kataloge=VTHK_KIVK&kataloge=VTHK_KTU_LINZ&kataloge=VTHK_LKA_BI&kataloge=VTHK_LKA_D&kataloge=VTHK_LKA_DD&kataloge=VTHK_LKA_H&kataloge=VTHK_LKA_M&kataloge=VTHK_LKI_HB&kataloge=VTHK_LKI_KA&kataloge=VTHK_LKI_KS&kataloge=VTHK_MARTINUS_MZ&kataloge=VTHK_MIKA_AC&kataloge=VTHK_OKR_OL&kataloge=VTHK_OKR_S&kataloge=VTHK_OKR_SN&kataloge=VTHK_PRE_HOG&kataloge=VTHK_PRI_FD&kataloge=VTHK_PRI_IBRIX&kataloge=VTHK_PRI_TR&kataloge=VTHK_PTH_VALL&kataloge=VTHK_RPA_HB&kataloge=VTHK_THE_DT&kataloge=VTHK_UNIT_HERRNHUT&kataloge=VTHK_ZARCH_SP&OESTERREICH=&kataloge=BIBOPAC&kataloge=LBOE&kataloge=OENB&SCHWEIZ=&kataloge=SWISSBIB&kataloge=HELVETICAT&kataloge=BASEL&kataloge=ETH&kataloge=VKCH_RERO&kataloge=BNF_PARIS&kataloge=ABES&kataloge=BNE&kataloge=REBIUN&kataloge=BOOKLOOKER&VOLLTEXTE=&kataloge=BASE&kataloge=DART_EUROPE&kataloge=DIGIBIB&kataloge=DFG_EBOOKS&kataloge=DFG_AUFSAETZE&kataloge=DOABOOKS&kataloge=DOAJ&kataloge=EROMM_WEBSEARCH&kataloge=EUROPEANA&kataloge=GOOGLE_BOOKS&kataloge=KUNST_HATHI&kataloge=ARCHIVE_ORG&kataloge=OAPEN&kataloge=ZVDD&kataloge=BHL&ref=direct&client-js=yes
regex=false

[action54]
name=zdb-katalog.de
pattern=!zdb
command=exo-open --launch WebBrowser https://zdb-katalog.de/list.xhtml?t=%u
regex=false

[action55]
name=uni-regensburg.de
pattern=!urb
command=exo-open --launch WebBrowser http://rzblx1.uni-regensburg.de/ezeit/searchres.phtml?bibid=ULBD&colors=7&lang=de&jq_type1=QS&jq_term1=%u
regex=false

[action56]
name=uni-bonn.de
pattern=!ubo
command=exo-open --launch WebBrowser https://epflicht.ulb.uni-bonn.de/search/quick?query=%u
regex=false

[action57]
name=kalliope-verbund.info
pattern=!kal
command=exo-open --launch WebBrowser https://kalliope-verbund.info/de/search.html?q=%u
regex=false

[action58]
name=github-code
pattern=!gh
command=exo-open --launch WebBrowser https://github.com/search?q=%u&type=code
regex=false

[action59]
name=google-translate
pattern=!got
command=exo-open --launch WebBrowser https://translate.google.com/?sl=auto&tl=de&text=%u&op=translate
regex=false

[action60]
name=peertube-sepiasearch
pattern=!pt
command=exo-open --launch WebBrowser https://sepiasearch.org/search?search=%u
regex=false

[action61]
name=hackernews-algolia
pattern=!hn
command=exo-open --launch WebBrowser https://hn.algolia.com/?q=%u
regex=false

[action62]
name=codeberg
pattern=!cb
command=exo-open --launch WebBrowser https://codeberg.org/explore/repos?tab=&sort=recentupdate&q=%u
regex=false

END
#
sed -i 's/xxUserxx/'$USER'/' $HOME/.config/xfce4/panel/$file_whiskerrc
xfce4-panel --restart

#https://www.semager.de/keywords/?q=test
#https://www.semager.de/keywords/?q=archive.is&lang=de
#https://yacy.searchlab.eu/yacysearch.html?query=oelde
#https://www.netluchs.de/netluchsJsf/faces/index.html?q=oelde