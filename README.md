# Text, Image and File Uploader Script

This is a Windows batch script designed for uploading text, images, and various file types to the online service 0x0.st. The script utilizes curl to handle the file uploads and provides direct URLs to the uploaded files.

## Features

- Upload text files
- Upload images
- Upload other file types (e.g., .txt, .pdf, .docx...)

## Prerequisites

- **Windows OS**: This script is designed for Windows environments.
- **curl**: The script uses `curl`, which is included by default in Windows 10 (version 1803 and later) and Windows 11. If you are using an older version of Windows, you may need to install `curl` manually.

## How to Use

1. **Download the script**: Download the `UploadScript.bat` file to your computer.

2. **Run the script**: Double-click on the `UploadScript.bat` file to run it.

3. **Follow the prompts**:
- **Select the type of content**: Choose between uploading text, images, or other file types.

![Text And Image Uploader](https://github.com/user-attachments/assets/dc94dae4-59c5-4fbb-8bcf-db49963b7c5d)

- **Provide file or text**: Depending on your choice, enter the text or the file path you want to upload.

![Screenshot_9](https://github.com/user-attachments/assets/674093e2-93f7-458e-8a5f-6a27ccb860f0)

- **Retrieve URL**: After uploading, the script will display a URL where you can access the uploaded content.

![Screenshot_4](https://github.com/user-attachments/assets/0bd5a72e-769e-49f0-99b9-9f9d38463c8e)

## Notes

- **File Restrictions**: The script checks file types based on the platform's restrictions. Ensure that the file types you upload comply with these restrictions.

![Screenshot_7](https://github.com/user-attachments/assets/db2d0b91-f7ae-4e83-850f-61eda0d55dfa)

- **File Restrictions**: The script allows the upload of various file types, except for the following restricted file types:
  - `.exe` (Executable files)
  - `.rar` (Compressed archive files)
  - `.jar` (Java archive files)

- **Temporary Files**: The script creates temporary files for text uploads, which are deleted after the upload is completed.

## Troubleshooting

- **File not found**: Ensure the file path you provide is correct and that the file exists.

![Screenshot_6](https://github.com/user-attachments/assets/302c31a7-0603-4f63-9445-e97ab7ceef4d)

## Contact

For any questions or issues, please open an issue in the GitHub repository.
