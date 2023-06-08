echo `date`
cd /u02/dpccfiles/source/
for entry in CDRs2022*.csv
do
  sqlldr userid=bisupport/bisupport control=../CDR.ctl DATA=/u02/dpccfiles/source/$entry BAD=/u02/dpccfiles/bad/$entry log=/u02/dpccfiles/log/$entry
  mv /u02/dpccfiles/source/$entry /u02/dpccfiles/processed/
done

for entry in BALANCE_EDRs*.csv
do
  sqlldr userid=bisupport/bisupport control=../BALANCE.ctl DATA=/u02/dpccfiles/source/$entry BAD=/u02/dpccfiles/bad/$entry log=/u02/dpccfiles/log/$entry
  mv /u02/dpccfiles/source/$entry /u02/dpccfiles/processed/
done

for entry in SUBSCRIPTION_EDRs*.csv
do
  sqlldr userid=bisupport/bisupport control=../SUBSCRIPTION.ctl DATA=/u02/dpccfiles/source/$entry BAD=/u02/dpccfiles/bad/$entry log=/u02/dpccfiles/log/$entry
  mv /u02/dpccfiles/source/$entry /u02/dpccfiles/processed/
done

for entry in SUBSCRIBER_EDRs*.csv
do
  sqlldr userid=bisupport/bisupport control=../SUBSCRIBER.ctl DATA=/u02/dpccfiles/source/$entry BAD=/u02/dpccfiles/bad/$entry log=/u02/dpccfiles/log/$entry
  mv /u02/dpccfiles/source/$entry /u02/dpccfiles/processed/
done


echo `date`
