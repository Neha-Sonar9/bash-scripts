
#!/bin/bash
read -p "Enter service to check version: " svc
read -p "do u want to check its version(Y/N): " version

if [ "$version" = "Y" ]; then
   "$svc" -v
else
   echo "Skipped"
fi 

echo $svc



