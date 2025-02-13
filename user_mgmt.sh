#!/bin/bash

# Function to display usage information and available options
function display_usage {
	echo "Usage: $0 [OPTIONS]"
	echo "Options:"
	echo " -c, --create	Create a new user account."
	echo " -d, --delete	Delete an existing account."
	echo " -r, --reset	Reset password for an existing user account."
	echo " -l, --list	List all user accounts on the system."
	echo " -h, --help	Display this help and exit."
}

# Function to create a new user account
function create_user {
	read -p "Enter the new username: " username

	# Check if the username is already exists
	if id "$username" &>/dev/null; then
		echo "Error: The username '$username' already exists. Kindly choose a different username."
	else
		# Prompt for passowrd (Note 'read -s' to hide password input
		read -s -p "Enter the password for $username: " password
		echo
		read -s -p "Confirm the password: " password_confirm
		echo

		# Check if passwords match
                if [ "$password" != "$password_confirm" ]; then
                        echo "Error: Passwords do not match. Please try again."
                        return
                fi

		# Create the user account
		useradd -m -p "$password" "$username"
		echo "User account '$username' has been created successfully."
	fi
}

# Function to delete an existing user account
function delete_user {
	read -p "Enter the username to delete: " username

	# Check if the username exists
        if id "$username" &>/dev/null; then
                # Confirm password before deleting the user
                read -s -p "Enter the password for $username to confirm deletion: " password
                echo
                # Check if the provided password matches the one for the user
                if echo "$username:$password" | sudo chpasswd -e; then
                        # Delete the user account
                        userdel -r "$username" # -r flag removes the user's home directory
                        echo "User account '$username' has been deleted successfully."
                else
                        echo "Error: Password is incorrect. Deletion aborted."
                fi
	else
                echo "Error: The username '$username' does not exists. Kindly enter a valid username."
	fi
}

#  Function to reset the password for an existing user account
function reset_password {
	read -p "Enter the username to reset password: " username

	# Check if the username exists
	if id "$username" &>/dev/null; then
		# Prompt for password (hidden input for security)
		read -s -p "Enter the new password for $username: " password
		echo
		read -s -p "Confirm the new password: " password_confirm
        	echo

		# Check if passwords match
        	if [ "$password" != "$password_confirm" ]; then
			echo "Error: Passwords do not match. Please try again."
            	return
        	fi

		# Set the new password securely
        	echo "$username:$password" | sudo chpasswd
        	if [ $? -eq 0 ]; then
			echo "Password for user '$username' has been reset successfully."
        	else
			echo "Error: Failed to reset password for '$username'."
		fi

	else
		echo "Error: The username '$username' does not exist. Kindly enter a valid username."
	fi
}

# Function to list all user accounts on the system
function list_users {
	echo "User accounts on the system: "
	cat /etc/passwd | awk -F: '{ print "- " $1 " (UID: " $3 ")" }'
}

# Check if no arguments are provided or if the -h or --help option is given 
if [ $# -eq 0 ] || [ "$1" = "-h" ] || [ "$1" = "--help"  ]; then
	display_usage
	exit 0
fi

# Command Line Argument Parsing
while [ $# -gt 0  ]; do
	case "$1" in
		-c|--create)
			create_user
			;;
		-d|--delete)
			delete_user
			;;
		-r|--reset)
			reset_password
			;;
		-l|--list)
			list_users
			;;
        *)
            echo "Error: Invalid option '$1'. Use '--help' to see available options."
            exit 1
            ;;
    esac
    shift
done
