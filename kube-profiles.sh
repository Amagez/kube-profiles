#!/bin/bash
# Description: simple shell script to show kubectl-context profiles and switch context to use
# Author: Quach Chi Cuong

FILE_TMP="/tmp/kubectl-contexts-kube-profiles-$RANDOM.txt"
DEFAULT_KUBE_CONFIG_DIR="$HOME/.kube/config"

arg1=$1
if [[ "${arg1}" == "ns" ]];then
    arg2=$2
    if [[ -z "${arg2}" ]];then
        echo "ERROR: missing input namespace to set for current context"
        exit 1
    fi

    kubectl config set-context --current --namespace=$arg2
    echo "Set default namespace for current context: $arg2"
    exit 0
fi

# Get list kubectl contexts
echo "List of kubectl contexts in your local:"
echo ""

cat ${DEFAULT_KUBE_CONFIG_DIR} | grep -i -A4 "\- context:" | grep -i "name:" | awk -F'name:' '{print $2}' | sort | uniq | tr -d ' ' > ${FILE_TMP}
cat -n ${FILE_TMP}

echo ""
echo "Which kubectl contexts that you want to use [number] ? "

if [[ -z $arg1 ]];then
    read -p "Number: " no_context
else
    echo "Number: ${no_context}"
    no_context="$arg1"
fi

# Check if answer is in list kubectl contexts
if [[ ! $(cat -n ${FILE_TMP} | grep "^[[:space:]]*${no_context}") ]];then
    echo ""
    echo "ERROR: your choice number is not correct. Please choose correct number in console. "
    exit 1
fi

context_name=$(sed -n ${no_context}p $FILE_TMP)
echo "Choosen context: $context_name"

echo ""

kubectl config use-context $context_name

new_context_name=$(cat $DEFAULT_KUBE_CONFIG_DIR | grep -i "current-context:" | awk -F':' '{print $2}' | tr -d ' ')
echo "Your current kubectl context now: ${new_context_name}"

# Clean up
rm -f ${FILE_TMP}

exit 0
