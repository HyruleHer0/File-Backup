Backs up files according to the Backup.csv file. All configuration will be handled in the csv.

Feature goals:
- The csv properties will support hostname, input path, output path, moveType.
- The csv may support maintaining items in the input path that are new enough (ex: 6 months, 1 year old, etc.)
- The script should not delete any folders.
- The csv may support discovering new child folders and adding them to the csv.
- The move types supported should be cut and paste.
- Host name will refer to the computer that the script is being run on.