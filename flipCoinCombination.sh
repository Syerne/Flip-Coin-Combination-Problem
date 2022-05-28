echo "welcome to the flip coin combination"
head=1
declare -A Doublet

for ((i=1; i<=50; i++))
do
	randomCheck1=$((RANDOM % 2))
	randomCheck2=$((RANDOM % 2))

	if (( $randomCheck1 == 1 && $randomCheck2 == 1 ))
	then
        	echo "H H"
		((Doublet[HH]++))
	elif (( $randomCheck1 == 0 && $randomCheck2 == 1 ))
	then
		echo "T H"
		((Doublet[HT]++))
	elif (( $randomCheck1 == 1 && $randomCheck2 == 0 ))
        then
                echo "H T"
                ((Doublet[TH]++))
	
	else
		echo "T T"
		((Doublet[TT]++))
	fi
done

echo ${!Doublet[@]}
echo ${Doublet[@]}

HH=`awk "BEGIN {print (${Doublet[HH]}/50)*100}"`
echo "HH = $HH%"
HT=`awk "BEGIN {print (${Doublet[HT]}/50)*100}"`
echo "HT = $HT%"
TH=`awk "BEGIN {print (${Doublet[TH]}/50)*100}"`
echo "TH = $TH%"
TT=`awk "BEGIN {print (${Doublet[TT]}/50)*100}"`
echo "TT = $TT%"

