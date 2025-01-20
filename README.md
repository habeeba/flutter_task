# flutter_task

Appwrite Configuration Documentation
Project: Flutter Task App
1. Organization Setup!(https://github.com/user-attachments/assets/25edeec6-ca81-499f-8656-a56551c17440)


Organization Name: PalmOutsourcing
Plan: Free ($0.00/month)
Project Name: flutter_task
Project ID: [Auto-generated]

(https://github.com/user-attachments/assets/f9f047a3-bdf6-41b4-bd29-b08f76bce595)


2. Deployment Configuration

Selected Region: Frankfurt
Available Regions:

Frankfurt (Primary)
New York
San Francisco
Banglore
London
Amsterdam

(https://github.com/user-attachments/assets/cd33bf1d-65d7-4730-9675-cdebd2d553f3)



3. Platform Configuration

Platform: Flutter
Application Name: Flutter Task App
Package Name: com.palmoutsourcing.fluttertask
Supported Platforms:

Android (Primary)
iOS
Linux
macOS
Windows
Web
(https://github.com/user-attachments/assets/21f5c603-67bf-4297-a39e-9f43aec8acc0)
(https://github.com/user-attachments/assets/c0930066-e691-4f52-a892-f69c103db851)
(https://github.com/user-attachments/assets/6e331335-7245-4e53-8848-41baba8f1379)
(https://github.com/user-attachments/assets/97f7df2a-09d3-4850-a8ce-f5964b3a7c2d)



4. Database Structure
Database Configuration

Database Name: items_db
Database ID: [Auto-generated]
Backup Status: No backup (Free Plan)

(https://github.com/user-attachments/assets/85ecaaa3-95aa-4fa4-bb77-07eb42d59109)

Collection Setup
(https://github.com/user-attachments/assets/2cd69dc8-dfcf-47fb-bd1d-544e43eae6d7)

Collection Name: items_collection
Collection ID: [Auto-generated]
Attributes:

Title

Type: String
Size: 100 characters
Required: Yes
Constraints: Alphanumeric, hyphen, non-leading underscore, period


Description

Type: String
Size: 1000 characters
Required: Yes
Constraints: Alphanumeric, hyphen, non-leading underscore, period

(https://github.com/user-attachments/assets/5edbf6b9-a2ee-4d04-9225-7f75698694fb)
(https://github.com/user-attachments/assets/e62ebdb9-314a-4f2d-96ff-f667d62418b9)
(https://github.com/user-attachments/assets/03f25b0e-d14c-4df4-aa62-83af477f743c)



5. Security & Permissions
Collection Permissions

Role: Users
Access Levels:

Create: ✓
Read: ✓
Update: ✓
Delete: ✓

(https://github.com/user-attachments/assets/f8c98224-6574-49ac-88ec-69e17e6a3df8)

6. Sample Document Structure
jsonCopy{
    "title": "Welcome to Flutter",
    "description": "Flutter is Google's UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase."
}

added some indexes to help in filtring and searching 
(https://github.com/user-attachments/assets/3a59d7aa-7ede-47f4-a915-bb34290639d2)
(https://github.com/user-attachments/assets/eea388a7-1b2f-4460-9d47-958223d0c297)

and i used the api endpoint, project id , collection id and database id to connect to the project on my flutter app using appwrite package 
also you can create functions in appwrite and use endpoints for more complicated apis 
