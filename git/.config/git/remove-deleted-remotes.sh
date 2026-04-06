#! /usr/bin/env bash

print_usage() {
    cat <<EOF
Delete remote braches that have been merged into a branch

Options:
   -r           Name of the remote branch (Defaults to origin)
   -b           Specify branch to check for merges against (Defaults to main)
   -p           Add a Branch to be Protected. Protected branches will never be removed by this command (Defaults included [main, master, develop])

   --help       Display this message
EOF
}

remote="origin"
branch="main"
declare -a protected_branches=("main" "master" "develop")
declare -a positional_arguments

###########################################
# Parse Arguments
###########################################

while [ "$#" -gt 0 ]; do
    OPTIND=1
    while getopts "m:r:p:-:" opt "$@"; do
      case $opt in
        r)
          remote="${OPTARG}"
          ;;
        p)
          protected_branches=("${protected_branches[@]}" "${OPTARG}")
          ;;
        b)
          branch="$OPTARG"
          ;;
        -) # Handle double dash elements
          dd_option="${OPTARG%%=*}"
          [[ "${OPTARG}" == *"="* ]] && dd_value="${OPTARG#*=}" || dd_value=""

          case "$dd_option" in
            help)
              print_usage
              exit 0
              ;;
            *)
              echo "Invalid option: --$OPTARG" >&2
              exit 1
              ;;
          esac
          ;;
        \?)
          echo "Invalid option: -$OPTARG" >&2
          exit 1
          ;;
        :)
          echo "Option -$OPTARG requires an argument." >&2
          exit 1
          ;;
      esac
    done
    shift $(($OPTIND - 1)) #remove processed arguments

    # Continue looping through remaining arguments, store non options in $positional_arguments array
    # This allows us to place options after search terms but still use getopts to process them
    while [[ "$#" -gt 0 ]] && [[ "${1:0:1}" != "-" ]]; do
        positional_argument=`echo "$1" | sed 's/"/\\\"/g'` # escape double quotes in regex
        positional_arguments=("${positional_arguments[@]}" "${positional_argument}")
        shift # remove processed positional arguments
    done
done



# Check if in valid git repository
git rev-parse --is-inside-work-tree > /dev/null 2>&1
result="$?"
if [ $result -ne 0 ]; then
    echo "Current Directory is not a valid git directory (${PWD})"
    exit 1
fi

# Validate Origin
git remote show "$remote" > /dev/null 2>&1
result="$?"
if [ $result -eq 128 ]; then
    echo "Provided remote does not exist: ${remote}"
    exit 1
elif [ $result -ne 0 ]; then
    echo "Error, with provided remote: ${remote}"
    exit 1
fi

## Fetch
echo "Fetching Remote: $remote"
git fetch "$remote" --prune
echo

# Requires Bash 4.0
# mapfile -t all_local_branches < <(git for-each-ref --format='%(refname:lstrip=2)' refs/heads/)
all_local_branches=($(git for-each-ref --format='%(refname:lstrip=2)' refs/heads/))
all_remote_branches=($(git for-each-ref --format='%(refname:lstrip=2)' "refs/remotes/$remote/" | sed "s|^${remote}/||"))

#echo "${all_remote_branches[*]}"

for (( i=0; i<${#all_local_branches[@]}; i++ )); do
    local_branch="${all_local_branches[$i]}"

    # Skip protected branches
    if [[ "${protected_branches[*]}" =~ "$local_branch" ]]; then
        continue
    fi


    if [[ "${all_remote_branches[*]}" =~ "$local_branch" ]]; then
        echo "$local_branch has a remote"
        continue
    fi




    #echo "$local_branch"
done



#git for-each-ref








# git fetch origin
# gir





#  git branch -a

# git remote show origin
#  git ls-remote --heads origin ENG-1194-add-prod-opx-users-to-db-2026-01-27-js


#  if git ls-remote --heads --exit-code origin my_feature_branch > /dev/null; then
#     echo "Remote branch 'my_feature_branch' exists."
# else
#     echo "Remote branch 'my_feature_branch' does not exist."
# fi
