#!/bin/bash

echo -e "Menu:\n1.Pull image\n2.Pick how many containers of ubuntu you want\n3.Remove image\n4.Run web app in specific port\n"
read choice
if [ $choice == "1" ]
then 
    while true
    echo -e  "Which image would you like to install: centos/ubuntu/php\n"
    read response
    do
    if [ $response == "centos" ] || [ $response == "ubuntu" ] || [ $response == "php" ]
    then 
        docker pull $response
        break
    else
        echo -e "This image not in the list please check again"
    fi
    done
elif [ $choice == "2" ]
then 
    echo -e "How many containers you want?"
    read number
    for i in {1..$number}
    do
    sudo docker run -d ubuntu /bin/bash -c 'while true ; do echo Hello ; sleep 1; done' 2>/dev/null
    done
    
elif [ $choice == "3" ]
then
    echo -e "Choose image to delete: centos/ubuntu/php\n"
    read response
    do
    if [ $response == "centos" ] || [ $response == "ubuntu" ] || [ $response == "php" ]
    then
        docker rmi $response
        break
    else
        echo -e "This image is not on the list please check again"
    fi
    done
elif [ $choice == "4" ]
then
    echo -e "Enter a port that you want: \n"
    read port
    docker run -d -p $port:8080 adejonge/helloworld
    docker ps | awk 'NR==2'
fi
