#!/bin/sh
#AccuWeather (r) RSS weather tool for conky
#
#USAGE: weather.sh <locationcode>
#
#

METRIC=1 #Should be 0 or 1; 0 for F, 1 for C

if [ -z $1 ]; then
    echo
    echo "USAGE: weather.sh <locationcode>!"
    echo
    exit 0;
fi

#curl -s http://rss.accuweather.com/rss/liveweather_rss.asp\?metric\=${METRIC}\&locCode\=$1 | perl -ne 'if (/Currently/) {chomp;/\<title\>Currently: (.*)?\<\/title\>/; print "$1"; }'

out=`curl --connect-timeout 30 -s http://rss.accuweather.com/rss/liveweather_rss.asp\?metric\=${METRIC}\&locCode\=$1 | perl -ne 'if (/Currently/) {chomp;/\<title\>Currently: (.*)?\<\/title\>/; print "$1"; }'`

#echo $out

cond=`echo $out | cut -d':' -f 1`
temp=`echo $out | cut -d':' -f 2`


case "$cond" in
'Fog')
    echo -n "sisli"
;;
'Snow')
    echo -n "karlı"
;;
'Cloudy')
    echo -n "bulutlu"
;;
'Sunny')
   echo -n "güneşli"
;;
'T-Storms')
   echo -n "fırtınalı"
;;
'Mostly Cloudy')
   echo -n "parçalı bulutlu"
;;
'Mostly Sunny')
   echo -n "seyrek güneşli"
;;
'Clear')
   echo -n "açık"
;;
'Rain')
   echo -n "yağmurlu"
;;
*)
   echo -n  $cond'\c'
esac


echo -n "$temp"
