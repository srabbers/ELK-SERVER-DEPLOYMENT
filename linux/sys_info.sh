#!/bin/bash

if [ $UID -ne 0 ]
then
  echo "Please run this script with sudo."
  exit
fi

#Variables
output=$HOME/research/sys_info.txt
ip=$(ip addr | grep inet | tail -2 | head -1)
execs=$(sudo find /home -type f -perm 777 2>/dev/null)
cpu=$(lscpu | grep CPU)
disk=$(df -H | head -2)

#Lists
commands=(
  'date'
  'uname -a'
  'hostname -s'
)

files=(
  '/etc/passwd'
  '/etc/shadow'
)

#Check for research dir
if [ ! -d $HOME/research ]

then

mkdir $HOME/research

fi
#Output file check
if [ -f $output ]; then

  rm $output

fi

#Script Start
echo "A Quick System Audit Script" >> $output

for x in {0..2}; do
  results=$(${commands[$x]})
  echo "Results of "${commands[$x]}" command:" >>$output
  echo $results >>$output
  echo "" >>$output
done

echo "Machine Type Info:" >> $output

echo $MACHTYPE >> $output

echo -e "IP Info:"  >> $output

echo -e "$ip \n" >> $output

echo "DNS Servers: " >> $output

cat /etc/resolv.conf >> $output

echo "Memory Info:" >> $output

free >> $output

echo -e "\nCPU Info:" >> $output

lscpu | grep CPU >> $output

echo -e "\nDisk Usage:" >> $output

df -H | head -2 >> $output

echo -e "\nWho is logged in: \n $(who -a) \n" >> $output

echo -e "\nexec Files:" >>$output

for exec in $execs; do
  echo $exec >>$output
done

echo "A Quick System Audit Script" >> $output

for x in {0..2}; do
  results=$(${commands[$x]})
  echo "Results of "${commands[$x]}" command:" >>$output
  echo $results >>$output
  echo "" >>$output
done

echo "Machine Type Info:" >> $output

echo $MACHTYPE >> $output

echo -e "IP Info:"  >> $output

echo -e "$ip \n" >> $output

echo "DNS Servers: " >> $output

cat /etc/resolv.conf >> $output

echo "Memory Info:" >> $output

free >> $output

echo -e "\nCPU Info:" >> $output

lscpu | grep CPU >> $output

echo -e "\nDisk Usage:" >> $output

df -H | head -2 >> $output

echo -e "\nWho is logged in: \n $(who -a) \n" >> $output

echo -e "\nexec Files:" >>$output

for exec in $execs; do
  echo $exec >>$output
done

