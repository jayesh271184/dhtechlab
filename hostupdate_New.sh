DAY=`date +%Y%m%d`;
log=/u01/COL_HC/Report/;
cp /u01/COL_HC/Report//Report-PendingFileCount_${DAY}.csv /u01/COL_HC/Report/Report-PendingFileCount_${DAY}_New.csv
sed -i s/AGRTORCGNAT01/Agra-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/AGRTORCGNAT02/Agra-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/AHDSGHCGNAT01/AHDBM-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/AHDSGHCGNAT02/AHDBM-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/bankarcgnat01/BAN-Nokia/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/bankarcgnat02/BAN-Nokia/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/BRDPADCGNA01/Baroda-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/BRDPADCGNA02/Baroda-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/CALCUTCGNA01/Calicut-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/CALCUTCGNA02/Calicut-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/CHNEKTCGNAT01/Chennai1-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/CHNEKTCGNAT02/Chennai1-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/CHNNXTCGNAT01/Chennai2-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/CHNNXTCGNAT02/Chennai2-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/coherncgnat01/Kerala-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/coherncgnat02/Kerala-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/COIMATCGNA01/Coimbatore-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/COIMATCGNA02/Coimbatore-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/DELNARCGNA01/Narayana-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/DELNARCGNA02/Narayana-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/DELNARCGNA03/Narayana-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/DELNARCGNA04/Narayana-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/delokhcgn1a/Okhla-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/delokhcgn1b/Okhla-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/DELOKHCGN2A/Okhla-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/DELOKHCGN2B/Okhla-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/delokhcgn3a/Okhla-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/delokhcgn3b/Okhla-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/delokhcgn4a/Okhla-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/delokhcgn4b/Okhla-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/DELYAMCGNA01/Delhi-YamunaVihar-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/DELYAMCGNA02/Delhi-YamunaVihar-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/GRGUDYCGNAT01/Delhi-VPC-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/GRGUDYCGNAT02/Delhi-VPC-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/GUWKATCGNAT01/Guwhati-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/GUWKATCGNAT02/Guwhati-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/GUWKATCGNAT03/Guwhati-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/GUWKATCGNAT04/Guwhati-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/HARKARVCGC01/Karnal-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/HARKARVCGC02/Karnal-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/HARKARVCGC03/Karnal-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/HARKARVCGC04/Karnal-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIBH19MZP1NATC01MV/Bihar-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIBH19MZP1NATC02MV/Bihar-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIGJ02AHD1CGNA01ST/AHDVPC-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIGJ02AHD1CGNA02ST/AHDVPC-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIGJ02AHD1CGNA03ST/AHDVPC-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIGJ02AHD1CGNA04ST/AHDVPC-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIGJ02AHD1CGNA05ST/AHDVPC-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIGJ02AHD1CGNA06ST/AHDVPC-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIGJ02AHD1CGNA07ST/AHDVPC-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIGJ02AHD1CGNA08ST/AHDVPC-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIGJ02GNR1CGNA01ST/GandhiNagar-IBM/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIGJ02GNR1CGNA02ST/GandhiNagar-IBM/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIGJ02GNR1CGNA03ST/GandhiNagar-IBM/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIGJ02GNR1CGNA04ST/GandhiNagar-IBM/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIGJ02RJK3CGNA01ST/Rajkot-IBM/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIGJ02RJK3CGNA02ST/Rajkot-IBM/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIGJ02RJK3CGNA03ST/Rajkot-IBM/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIGJ02RJK3CGNA04ST/Rajkot-IBM/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIHR11SNP1NATC01ST/Sonipat-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIHR11SNP1NATC02ST/Sonipat-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIHR11SNP1NATC03ST/Sonipat-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIHR11SNP1NATC04ST/Sonipat-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIKL08KLM1NATC01MV/Kollam-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIKL08KLM1NATC02MV/Kollam-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIKL08KLM1NATC03MV/Kollam-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIKL08KLM1NATC04MV/Kollam-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIKL08KLM1NATD01MV/Kollam-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIKL08KLM1NATD02MV/Kollam-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIKL08KLM1NATD03MV/Kollam-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIKL08KLM1NATD04MV/Kollam-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIKL08PAL1NATC01MV/Pallakad-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIKL08PAL1NATC02MV/Pallakad-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIKL08PAL1NATC03MV/Pallakad-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIKL08PAL1NATC04MV/Pallakad-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIKL08PAL1NATD01MV/Pallakad-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIKL08PAL1NATD02MV/Pallakad-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIKL08PAL1NATD03MV/Pallakad-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIKL08PAL1NATD04MV/Pallakad-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/inviko22kol2natc01mv/Kolkata-Bio-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/inviko22kol2natc03mv/Kolkata-Bio-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/inviko22kol2natc04mv/Kolkata-Bio-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/inviko22kol2natd01mv/Kolkata-Bio-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/inviko22kol2natd02mv/Kolkata-Bio-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIKO22KOL2NATD03MV/Kolkata-Bio-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIKO22KOL2NATD04MV/Kolkata-Bio-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIKO22KOL3NATD01MV/Kolkata-Bio-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIMH01KLP1NATC01ST/Kolhapur-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIMH01KLP1NATC02ST/Kolhapur-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIMH01KLP1NATC03ST/Kolhapur-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIMH01KLP1NATC04ST/Kolhapur-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIMH01SLP1NATC01ST/Solapur-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIMH01SLP1NATC02ST/Solapur-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIMH01SLP1NATC03ST/Solapur-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIMH01SLP1NATC04ST/Solapur-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/invimp03jbp1natc01mv/Jabalpur-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/invimp03jbp1natc02mv/Jabalpur-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/invimp03jbp1natc03mv/Jabalpur-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/invimp03jbp1natc04mv/Jabalpur-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/invimp03jbp1natp01mv/Jabalpur-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/invimp03jbp1natp02mv/Jabalpur-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/invimp03jbp1natp03mv/Jabalpur-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/invimp03jbp1natp04mv/Jabalpur-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIMP03RPR3NATC01MV/Raipur-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIMP03RPR3NATC02MV/Raipur-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIMP03RPR3NATC03MV/Raipur-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIMP03RPR3NATC04MV/Raipur-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIMP03RPR3NATD01MV/Raipur-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIMP03RPR3NATD02MV/Raipur-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIMP03RPR3NATD03MV/Raipur-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIMP03RPR3NATD04MV/Raipur-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIOR15BSR1NATC01ST/Buvneshvar-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIOR15BSR1NATC02ST/Buvneshvar-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIOR15BSR1NATC03ST/Buvneshvar-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIOR15BSR1NATC04ST/Buvneshvar-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIPB07LDH1NATC01ER/Ludhiyana-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIPB07LDH1NATC02ER/Ludhiyana-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIPB07LDH1NATC03ER/Ludhiyana-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIPB07LDH1NATC04ER/Ludhiyana-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/invirj18jpr1cgna01st/Jaipur-IBM/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/invirj18jpr1cgna02st/Jaipur-IBM/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/invirj18jpr1cgna03st/Jaipur-IBM/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/invirj18jpr1cgna04st/Jaipur-IBM/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIRJ18KTL1NATC01ST/Kothputli-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVIRJ18KTL1NATC02ST/Kothputli-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVITN14CHN3NATC01MV/Chennai-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVITN14CHN3NATC02MV/Chennai-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVITN14CHN3NATC04MV/Chennai-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVITN14CHN3NATD01MV/Chennai-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVITN14CHN3NATD02MV/Chennai-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVITN14CHN3NATD03MV/Chennai-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/INVITN14CHN3NATD04MV/Chennai-Mavenir/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/JAIMANCGNAT01/Jaipur-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/JAIMANCGNAT02/Jaipur-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/KARHBLNCL01/Hubli-Nokia/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/KARHBLNCL02/Hubli-Nokia/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/KOLAGRCGNAT01/Kolkata-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/KOLAGRCGNAT02/Kolkata-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/LUKASMCGNAT01/Lucknow-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/LUKASMCGNAT02/Lucknow-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/mahkalecl03/Pune1-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/mahkalecl04/Pune1-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/MAHKALVCGC01/Pune2-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/MAHKALVCGC02/Pune2-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/MAHNAGVCGC01/Nagpur-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/MAHNAGVCGC02/Nagpur-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/MAHNAGVCGC03/Nagpur-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/MAHNAGVCGC04/Nagpur-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/mahnskcgn01a/Nasik-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/mahnskcgn01b/Nasik-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/mahnskcgn02a/Nasik-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/mahnskcgn02b/Nasik-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/mahnskcgn03a/Nasik-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/mahnskcgn03b/Nasik-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/mahnskcgn04a/Nasik-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/mahnskcgn04b/Nasik-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/mpybplcgn01a/Bhopal-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/mpybplcgn01b/Bhopal-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/mpybplcgn02a/Bhopal-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/mpybplcgn02b/Bhopal-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/mpybplcgn03a/Bhopal-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/mpybplcgn03b/Bhopal-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/mpybplcgn04a/Bhopal-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/mpybplcgn04b/Bhopal-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/mumaircgna02/MumbaiVPC-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/MUMAIRVCGNA01/MumbaiVPC-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/MUMAIRvCGNA03/MumbaiVPC-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/MUMAIRvCGNA04/MumbaiVPC-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/MUMARLCGNAT01/MumbaiBM-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/MUMARLCGNAT02/MumbaiBM-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/PUNMOHVCGC01/Mohali-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/PUNMOHVCGC02/Mohali-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/PUNMOHVCGC03/Mohali-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/PUNMOHVCGC04/Mohali-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/RAJJAIVCGC01/Jaipur-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/RAJJAIVCGC02/Jaipur-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/RAJJAIVCGC03/Jaipur-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/RAJJAIVCGC04/Jaipur-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/RAJJODVCGC01/Jodhpur-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/RAJJODVCGC02/Jodhpur-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/RAJJODVCGC03/Jodhpur-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/RAJJODVCGC04/Jodhpur-EIL/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/RAJKOTCGNAT01/Rajkot-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/RAJKOTCGNAT02/Rajkot-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/RAJKOTCGNAT03/Rajkot-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/RAJKOTCGNAT04/Rajkot-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/RAJKOTCGNAT05/Rajkot-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/RAJKOTCGNAT06/Rajkot-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/RAJKOTCGNAT07/Rajkot-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/RAJKOTCGNAT08/Rajkot-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/ROBASNNCL01/Asansol-Nokia/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/ROBASNNCL02/Asansol-Nokia/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/ROBBRHNCL01/Bahrampur-Nokia/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/ROBBRHNCL02/Bahrampur-Nokia/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/SURUMACGNAT01/Surat-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/SURUMACGNAT02/Surat-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/upelkoncl-0/Lucknow-Nokia/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/upelkoncl-1/Lucknow-Nokia/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/UPEVARNCL01/Varanasi-Nokia/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/UPEVARNCL02/Varanasi-Nokia/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/VIKC1/Vikroli-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/VIKC2/Vikroli-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/VIKC3/Vikroli-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/VIKC4/Vikroli-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/VIKC5/Vikroli-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
sed -i s/VIKC6/Vikroli-Cisco/g   ${log}Report-PendingFileCount_${DAY}_New.csv
