# Text and Image Uploader

A simple batch script to upload text and image files to 0x0.st and get a shareable link.

## How to Use

1. **Download the script**: Download the `UploadScript.bat` file to your computer.
2. **Run the script**: Double-click on the `UploadScript.bat` file to run it.

![Text And Image Uploader](https://github.com/user-attachments/assets/d2b35b9e-4fca-44ef-8dfc-3a3043fa8aaf)

3. **Select content type**:
    - Enter `1` to upload text.
    - Enter `2` to upload an image.

![Text And Image Uploader](https://github.com/user-attachments/assets/dd1a1fe4-17f8-40a4-8a68-a41317e0f2f8)
![Text And Image Uploader](https://github.com/user-attachments/assets/d2ebe3f0-9aba-4138-9d33-c7f4b557dcf0)

4. **Follow the prompts**:
    - If you chose to upload text, enter the text you want to upload when prompted.
    - If you chose to upload an image, enter the path to the image file when prompted.

![Text And Image Uploader](https://github.com/user-attachments/assets/bc6d5d58-279a-4858-8477-66735f0535b5)

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
