for((line=1;line<1000;line++));
do
    curl "http://beijing.8684.cn/so.php?k=pp&q=${line}" > beijing/${line}.html;
done
