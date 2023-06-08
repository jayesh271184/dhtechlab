dateh=`date -d '1 hour ago' "+%d/%m/%Y %H"`
datec=`date  "+%d/%m/%Y %H"`
hh=`date "+%H"`

Inputpath=/LVHDTAHDNATDATA6/PROC_INPUT/input1
input1=/LVFMDNATDATA/natlog_input_S5
input2=/LVHDTAHDNATDATA6/PROC_INPUT/inputoldhour
ARCH_ROOT=/LVHDTAHDNATDATA6/PROC_INPUT/archieve_root

cd $Inputpath;
for i in `ls -1 C_*.gz`
do
zcat $i|grep -E "$dateh|$datec|StartDate" > $input1/`basename $i .gz`;
gzip -f $input1/`basename $i .gz`
zcat $i|grep -Ev "$dateh|$datec" > $input2/`basename $i .gz`;
gzip -f $input2/`basename $i .gz`;
mv $i $ARCH_ROOT
done;

cd $Inputpath;
for j in `ls -1 D_*.gz`
do
zcat $j|grep -E "$dateh|$datec|StartDate" > $input1/`basename $j .gz`;
gzip -f $input1/`basename $j .gz`
zcat $j|grep -Ev "$dateh|$datec" > $input2/`basename $j .gz`;
gzip -f $input2/`basename $j .gz`;
mv $j $ARCH_ROOT
done;
