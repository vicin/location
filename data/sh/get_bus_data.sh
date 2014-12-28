for((line=1;line<1000;line++));
do
    curl -o beijing/${line}.html -L --max-redirs 100 "http://beijing.8684.cn/so.php?k=pp&q=${line}";
done
