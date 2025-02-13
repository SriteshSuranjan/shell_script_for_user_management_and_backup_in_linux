# Shell Script for User Management and Backup in Linux

## Overview

This project involves creating a shell script that automates user management tasks and backup processes in a Linux environment. The primary goal is to enable efficient management of user accounts and secure backup of specified directories. This script simplifies user management and backup procedures while offering flexibility through the command-line interface.

## Tools Required

- **Linux Operating System** (any popular distribution like Ubuntu, Fedora, etc.)
- **Bash Shell** (default in most Linux distributions)
- **Git and GitHub** (for version control and code repository)
- **Text Editor** (e.g., Vim, Nano, Visual Studio Code)

## Features

### 1. **User Management**
- **Create User**: Allows the creation of new user accounts.
- **Delete User**: Deletes an existing user and their associated home directory.
- **Reset Password**: Resets the password of an existing user.
- **List Users**: Lists all users in the system, ordered by creation date.
- **Create/Manage Groups**: Supports the creation and management of user groups.

### 2. **Backup Feature**
- **Backup Directory**: Compresses and archives a specified directory to ensure its backup.
- **Flexible Backup**: Option to select which directory to back up and specify the backup location.

### 3. **User-Friendly Command Line Interface**
- The script is designed with clear options for user interaction.
- Usage information is displayed when the `-h` or `--help` option is selected.

## Requirements

- **Linux-based System**: Ubuntu, Fedora, or any other Linux distribution.
- **Bash Shell**: The script is written in Bash for compatibility with most Linux systems.
- **Root Permissions**: Some functions (e.g., adding/deleting users) may require root privileges.

## Installation Instructions

### 1. Clone the Repository

Clone this repository to your local machine using Git:

```bash
git clone https://github.com/SriteshSuranjan/user-management-backup.git
```

### 2. Make the Script Executable

Navigate to the project directory and make the script executable:

```bash
cd user-management-backup
chmod +x user_management_backup.sh
```

## Usage

### Command-Line Options

Run the script with any of the following options:

```bash
./user_management_backup.sh [OPTIONS]
```

#### Available Options:

- **`-c`, `--create`**: Create a new user account.
- **`-d`, `--delete`**: Delete an existing user account.
- **`-r`, `--reset`**: Reset the password for an existing user account.
- **`-l`, `--list`**: List all user accounts on the system.
- **`-b`, `--backup`**: Backup a specified directory (compressed).
- **`-h`, `--help`**: Display help information and usage instructions.

#### Example Usage:

- **Create a new user**:
  ```bash
  ./user_management_backup.sh -c
  ```

- **Delete a user**:
  ```bash
  ./user_management_backup.sh -d
  ```

- **List all users**:
  ```bash
  ./user_management_backup.sh -l
  ```

- **Backup a directory**:
  ```bash
  ./user_management_backup.sh -b /path/to/directory
  ```

## Contributing

1. **Fork the repository**: Fork this repository to your own GitHub account.
2. **Make changes**: Create a feature branch and make your changes.
3. **Submit a pull request**: Once your changes are complete, submit a pull request to merge your changes into the main branch.

## License

This project is open-source and available under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Acknowledgments

- Thanks to the Linux community for the powerful tools used to create this script.
- This script is designed to simplify user management and backup processes on Linux-based systems.
```
