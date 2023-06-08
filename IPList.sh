
for i in {42.110.128.0/17,112.79.128.0/17,42.107.0.0/24,42.107.16.0/20}
do
nmap -sL -n $i |cut -d' ' -f5 >>IPAddress.txt;
done

