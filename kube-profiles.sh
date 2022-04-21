#!/bin/bash
# Description: simple shell script to show kubectl-context profiles and switch context to use
# Author: Quach Chi Cuong

FILE_TMP="/tmp/kubectl-contexts-kube-profiles-$RANDOM.txt"
DEFAULT_KUBE_CONFIG_DIR="$HOME/.kube/config"

# Get list kubectl contexts
echo "List of kubectl contexts in your local:"
echo ""

cat ${DEFAULT_KUBE_CONFIG_DIR} | grep -i -A4 "\- context:" | grep -i "name:" | awk -F'name:' '{print $2}' | sort | uniq | tr -d ' ' > ${FILE_TMP}
cat -n ${FILE_TMP}

echo ""
echo "Which kubectl contexts that you want to use [number] ? "
read -p "Number: " no_context

echo ""
context_name=$(sed -n ${no_context}p $FILE_TMP)
kubectl config use-context $context_name

new_context_name=$(cat $DEFAULT_KUBE_CONFIG_DIR | grep -i "current-context:" | awk -F':' '{print $2}' | tr -d ' ')
echo "Your current kubectl context now: ${new_context_name}"

# Clean up
rm -f ${FILE_TMP}

exit 0
