var="DNNoutSM_kl_1"
year="2018"
tag="Legacy2018_test"
tags="cards_TauTauLegacy2018_test cards_MuTauLegacy2018_test cards_ETauLegacy2018_test"
mkdir cards_$tag

selections="s1b1jresolvedMcutDNNoutSM_kl_1 s2b0jresolvedMcutDNNoutSM_kl_1 sboostedLLMcutDNNoutSM_kl_1 VBFlooseDNNoutSM_kl_1"
channels="ETau MuTau TauTau"

masses="250 260 270 280 300 320 350 400 450 500 550 600 650 700 750 800 850 900 1000 1250 1500 1750 2000 2500 3000"

rm cards_$tag/comb.*.txt

#for sel in $selections
#do
#    mkdir cards_$tag/$sel
#    for ch in $channels
#    do
#	cp cards_$ch$tag/$sel/hh*.* cards_$tag/$sel
#	cp cards_$ch$tag/$sel/hh*.* cards_$tag/comb
#	cd cards_$tag/$sel
#	rm comb.txt
#	combineCards.py -S hh*.txt>> comb.txt
#	text2workspace.py comb.txt -P HHModel:HHdefault -o comb.root
#	cd - 
#    done
#done


#cd cards_$tag/comb
#rm comb.txt
for mass in $masses
do
    combineCards.py -S cards_*Tau$tag/comb_cat/comb.Radion$mass.txt >> cards_$tag/comb.Radion$mass.txt
    text2workspace.py cards_$tag/comb.Radion$mass.txt -o cards_$tag/comb.Radion$mass.root
done

