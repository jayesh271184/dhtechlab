
fpath=/opt/crestelsetup/crestelpengine/modules/mediation/config/7634/services/processingservice/0
#policy path
ppath=/opt/crestelsetup/crestelpengine/modules/mediation/config/7634/policies/

for i in {00,01,02,03,07,08,09};
do
policy_name=`cat $fpath${i}/processing-service.xml | grep -i --color 'rule-group-name'| awk -F '[>]' '{print $2}' | awk -F '<' '{print $1}'`
#Policy Name - AirtelGGSN
echo $policy_name >> policy_name.txt

done
cat policy_name.txt | sort -u > new.txt
rm -rf policy_name.txt
