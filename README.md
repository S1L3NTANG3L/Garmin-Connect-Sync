# Garmin Connect Data Extraction and Upsert Automation

## Overview
This UiPath automation extracts fitness data from Garmin Connect using a Python script, converts the data into CSV format using another Python script, and then upserts the data into an MS SQL database. The automation ensures seamless data integration for further analysis and reporting. The [GarminDB](https://github.com/tcgoetz/GarminDB) project provides Python scripts to download, parse, and analyze data from Garmin Connect, storing it in SQLite databases. The project's README offers comprehensive guidance on its features, installation, and usage. This project is merely an extension of the work done by [TC Goetz](https://github.com/tcgoetz) to automate the process.

## Prerequisites
Before running this automation, ensure you have the following:

- **UiPath Studio** installed and configured
- **Python 3.x** installed with required dependencies
- **MS SQL Server** with the necessary database and table setup
- **Garmin Connect Account** with valid credentials for data extraction

## Automation Workflow
1. **Data Extraction**:
   - A Python script is executed via UiPath to pull fitness data from Garmin Connect.
   - The extracted data is returned in JSON or structured format.
   
2. **Data Conversion**:
   - Another Python script processes the extracted data and converts it into a CSV file.
   - The CSV file is saved for further processing.

3. **Database Upsert**:
   - UiPath reads the CSV file and processes each record.
   - The data is upserted (inserted/updated) into the MS SQL database using SQL queries.

## File Structure
- `Main.xaml` - The UiPath workflow automation
- `garmindb_cli.py` - Python script for Garmin Connect API data extraction
- `sqlitetocsv.py` - Python script for converting extracted data into CSV format
- `GarminConnectConfig.json` - Configuration file with necessary parameters (e.g., API credentials)
  
## Setup and Execution
1. **Install and configure GarminDB**
   - TC Goetz has done an amazing job at developing this library, and I highly recommend you follow his installation guide before continuing.
   - Link: [GarminDB](https://github.com/tcgoetz/GarminDB)
  
2.  **Place the 2 Python scripts on your desktop**
   
3. **Configure Python Environment**:
   - Ensure Python and required libraries are installed:
     ```sh
     pip install requests pandas pyodbc garmindb
     ```
   - Update `GarminConnectConfig.json` with Garmin API credentials. The file can be found at C:\Users\User\.GarminDb on a Windows system

4. **Configure UiPath**:
   - Open `Main.xaml` in UiPath Studio.
   - Update the file paths and connection details in UiPath if necessary.
   - Connections and credentials are stored in the orchestrator for obvious reasons just reference them in the get assets and get credentials steps.

5. **Run the Automation**:
   - Execute `Main.xaml` in UiPath Studio or Orchestrator.
   - The extracted data will be stored in the MS SQL database.

## Troubleshooting
- **Python Script Fails**: Ensure Python is installed and paths are correctly set in UiPath.
- **Database Connection Issues**: Check the connection string and SQL server availability.
- **Garmin API Issues**: Verify API credentials and access permissions.

## Future Enhancements
- Add logging and error handling for better debugging.
- Implement email notifications for successful runs and failures.
- Optimize database queries for improved performance.

