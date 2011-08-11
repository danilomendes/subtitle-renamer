find . | egrep 'avi$|mkv$' > file.txt; 

while read line;
do 
	echo "arquivo: $line";
	ep=$(echo $line | sed 's/.*\([sS][0-9]\{2\}[eE][0-9]\{2\}\).*/\1/')
	echo $ep
	legenda=$(find . | egrep -i 'srt$' | grep -i $ep)
	echo $legenda
	novo=$(echo $line | grep -i $ep | sed 's/\..\{3\}$//' | sed 's/.\{2\}//')
	echo novo nome: $novo.srt
	mv $legenda renamer.temp
	mv renamer.temp $novo.srt
	
	echo "\n";
done < file.txt

rm file.txt
