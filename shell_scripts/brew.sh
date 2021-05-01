#echo "brew.sh running..."

if (( ${+HAS_ARM_CPU} )); then eval $(/opt/homebrew/bin/brew shellenv); fi
