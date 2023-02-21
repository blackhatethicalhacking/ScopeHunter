#!/bin/bash
curl --silent "https://raw.githubusercontent.com/blackhatethicalhacking/Subdomain_Bruteforce_bheh/main/ascii.sh" | lolcat
echo ""
# Generate a random Sun Tzu quote for offensive security

# Array of Sun Tzu quotes
quotes=("The supreme art of war is to subdue the enemy without fighting." "All warfare is based on deception." "He who knows when he can fight and when he cannot, will be victorious." "The whole secret lies in confusing the enemy, so that he cannot fathom our real intent." "To win one hundred victories in one hundred battles is not the acme of skill. To subdue the enemy without fighting is the acme of skill.")

# Get a random quote from the array
random_quote=${quotes[$RANDOM % ${#quotes[@]}]}

# Print the quote
echo "Offensive security tip: $random_quote - Sun Tzu" | lolcat
sleep 1
echo "MEANS, IT'S ☕ 1337 ⚡ TIME, 369 ☯ " | lolcat
sleep 1
curl --silent "https://raw.githubusercontent.com/blackhatethicalhacking/ScopeHunter/main/ScopeHunter_ascii.sh" | lolcat
echo ""
echo "[YOUR ARE USING ScopeHunter.sh] - (v1.0) CODED BY Chris 'SaintDruG' Abou-Chabké WITH ❤ FOR blackhatethicalhacking.com for Educational Purposes only!" | lolcat
sleep 1
#check if the user is connected to the internet
tput bold;echo "CHECKING IF YOU ARE CONNECTED TO THE INTERNET!" | lolcat
# Check connection
wget -q --spider https://google.com
if [ $? -ne 0 ];then
    echo "++++ CONNECT TO THE INTERNET BEFORE RUNNING ScopeHunter.sh!" | lolcat
    exit 1
fi
tput bold;echo "++++ CONNECTION FOUND, LET'S GO!" | lolcat

function main_menu() {
  # Define arrays for providers and data urls
  providers=( "HackerOne" "BugCrowd" "Intigriti" "YesWeHack" )
  data_urls=(
    "https://raw.githubusercontent.com/arkadiyt/bounty-targets-data/main/data/hackerone_data.json"
    "https://raw.githubusercontent.com/arkadiyt/bounty-targets-data/main/data/bugcrowd_data.json"
    "https://raw.githubusercontent.com/arkadiyt/bounty-targets-data/main/data/intigriti_data.json"
    "https://raw.githubusercontent.com/arkadiyt/bounty-targets-data/main/data/yeswehack_data.json"
  )

  # Show providers
  echo "Available Providers:"
  for provider in "${providers[@]}"; do
    echo -e "\033[33m$provider\033[0m"
  done

  # Ask for target company name
  echo -e "\033[32mEnter target company name: \033[0m"
  read company

  # Loop through each provider and check for results
  for i in "${!providers[@]}"; do
    provider=${providers[i]}
    data_url=${data_urls[i]}

    filtered_targets=$(curl $data_url 2>/dev/null | grep -i $company | awk -F'"' '{print $4}')

    if [[ ! -z $filtered_targets ]]; then
      count=$(echo "$filtered_targets" | wc -l)
      echo -e "\033[36mFound \033[31m$count\033[0m \033[36mtarget(s) in $provider. Results saved under \033[33m$company\033[0m"

      mkdir -p "${company}"
      echo "${filtered_targets}" > "${company}/${provider}_${company}.txt"
    else
      echo -e "\033[36m${company} not found in the database on \033[36m${provider}"
    fi
  done
  # Ask user if they want to continue or exit
  echo -e "\033[32mDo you want to search again? (yes/no) \033[0m"
  read choice

  if [ "$choice" == "yes" ]; then
    main_menu
  else
    exit 0
  fi
}
main_menu
#written by Chris "SaintDruG" Abou-Chabke for blackhatethicalhacking.com 2023
