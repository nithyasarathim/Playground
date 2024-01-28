#!/bin/bash

# Git CRUD Operations

# 1. Create a New File
create_file() {
    echo "Enter the name of the new file:"
    read filename
    touch "$filename"
    git add "$filename"
    git commit -m "Add $filename"
    echo "File $filename created and committed to the repository."
}

# 2. Read (List) Files in the Repository
list_files() {
    echo "Listing files in the repository:"
    git ls-tree --name-only HEAD
}

# 3. Update (Edit) a File
update_file() {
    echo "Enter the name of the file to update:"
    read filename
    if [ -e "$filename" ]; then
        # Open file in default text editor, you can change it to your preferred editor
        $EDITOR "$filename"
        git add "$filename"
        git commit -m "Update $filename"
        echo "File $filename updated and committed to the repository."
    else
        echo "File not found."
    fi
}

# 4. Delete a File
delete_file() {
    echo "Enter the name of the file to delete:"
    read filename
    if [ -e "$filename" ]; then
        git rm "$filename"
        git commit -m "Delete $filename"
        echo "File $filename deleted and committed to the repository."
    else
        echo "File not found."
    fi
}

# Main Menu

while true; do
    echo -e "\nGit CRUD Script"
    echo "1. Create a New File"
    echo "2. List Files"
    echo "3. Update a File"
    echo "4. Delete a File"
    echo "5. Quit"

    read -p "Enter your choice (1-5): " choice

    case $choice in
        1) create_file ;;
        2) list_files ;;
        3) update_file ;;
        4) delete_file ;;
        5) echo "Exiting script. Goodbye!"; exit ;;
        *) echo "Invalid choice. Please enter a number between 1 and 5." ;;
    esac
done
