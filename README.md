# Text and Image Uploader

A simple batch script to upload text and image files to 0x0.st and get a shareable link.

## How to Use

1. **Download the script**: Download the `UploadScript.bat` file to your computer.
2. **Run the script**: Double-click on the `UploadScript.bat` file to run it.
3. **Select content type**:
    - Enter `1` to upload text.
    - Enter `2` to upload an image.
4. **Follow the prompts**:
    - If you chose to upload text, enter the text you want to upload when prompted.
    - If you chose to upload an image, enter the path to the image file when prompted.
5. **Get the link**: After the upload is complete, you will receive a shareable link to the uploaded content.

## Features

- **Supports both text and images**: Easily switch between uploading text and image files.
- **Simple and user-friendly**: Easy-to-follow prompts guide you through the upload process.
- **Temporary file cleanup**: Automatically deletes temporary files created during the upload process.

## Requirements

- **Windows OS**: The script is designed to run on Windows operating systems.
- **Curl**: Ensure `curl` is installed and available in your system's PATH.

## Notes

- **File not found**: If the specified file path does not exist, the script will prompt you to check the path and try again.
- **Invalid choice**: If an invalid option is selected, the script will prompt you to run it again and select a valid option.
