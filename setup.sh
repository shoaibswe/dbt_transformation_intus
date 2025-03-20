#!/usr/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
RESET='\033[0m'

if ! command -v python3 &> /dev/null; then
    echo "Python3 not found, installing..."
    sudo apt update
    sudo apt install -y python3
fi

python_version=$(python3 -c 'import platform; print(platform.python_version())')
echo -e "${GREEN}Python version: ${python_version}${RESET}"

major=$(echo $python_version | cut -d'.' -f1)
minor=$(echo $python_version | cut -d'.' -f2)

if (( $major < 3 || $minor < 12 )); then
    echo "Please upgrade to Python3 version 3.12 or higher"
    return 1
fi

# Checking for virtual environment
if [ ! -d "dbt-venv" ]; then
    python3.12 -m venv dbt-venv
fi

# Activate v
# source ./dbt-venv/bin/activate --turn it on if run in Mac
source ./dbt-venv/Source/activate

# Installing our packages
if [ -f "requirements.txt" ]; then
    echo -e "${GREEN}Installing required libraries...${RESET}"
    pip install -r requirements.txt
else
    echo -e "${RED}[!] requirements.txt not found, please create it & specify packages required.${RESET}"
fi

# Checking if profiles already exists or not for Intus user
if [ ! -f ~/.dbt/profiles.yml ]; then
  mkdir -p ~/.dbt/

  # Prompts me for Redshift database details
  echo -e "${GREEN}Enter your Redshift host:${RESET}"
  read rs_host
  
  echo -e "${GREEN}Enter your Redshift database name:${RESET}"
  read rs_db
  
  echo -e "${GREEN}Enter your Redshift user name:${RESET}"
  read rs_user

  echo -e "${GREEN}Enter your Redshift password:${RESET}"
  read -s rs_password

  echo -e "${GREEN}Enter your Redshift port (default 5439):${RESET}"
  read rs_port
  rs_port=${rs_port:-5439}

  # Creating profiles with input
  cat > ~/.dbt/profiles.yml << EOL

dbt_redshift:
  outputs:
    dev:
      type: redshift
      host: $rs_host
      user: $rs_user
      password: "$rs_password"
      port: $rs_port
      dbname: $rs_db
      schema: public
      threads: 4
  target: dev

EOL

  clear
  echo -e "${GREEN}profiles.yml file generated successfully in ~/.dbt/${RESET}"
else
  clear
  echo -e "${BLUE}profiles.yml already exists in ~/.dbt/, skipping file generation.${RESET}"
fi
