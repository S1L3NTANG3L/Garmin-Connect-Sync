# Garmin Connect Data Extraction and Upsert Automation

## Overview
This UiPath automation extracts fitness data from Garmin Connect using a Python script, converts the data into CSV format using another Python script, and then upserts the data into an MS SQL or Influx database. The automation ensures seamless data integration for further analysis and reporting. The [GarminDB](https://github.com/tcgoetz/GarminDB) project provides Python scripts to download, parse, and analyze data from Garmin Connect, storing it in SQLite databases. The project's README offers comprehensive guidance on its features, installation, and usage. This project is merely an extension of the work done by [TC Goetz](https://github.com/tcgoetz) to automate the process.

## Prerequisites
Before running this automation, ensure you have the following:

- **UiPath Studio** installed and configured
- **Python 3.x** installed with required dependencies
- **MS SQL Server** with the necessary database and table setup (Scripts in scripts folder)
- **InfluxDB** with the necessary bucket, organisation and token setup
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
- `upload_to_influx.py` - Python script for uploading data to influx db if you choose to use it for storage
- `GarminConnectConfig.json` - Configuration file with necessary parameters (e.g., API credentials)
  
## Setup and Execution
1. **Install and configure GarminDB**
   - TC Goetz has done an amazing job at developing this library, and I highly recommend you follow his installation guide before continuing.
   - Link: [GarminDB](https://github.com/tcgoetz/GarminDB)
  
2.  **Place the 2 Python scripts on your desktop and run the SQL scripts in SSMS**
   
3. **Configure Python Environment**:
   - Ensure Python and required libraries are installed:
     ```sh
     pip install requests pandas pyodbc garmindb influxdb_client
     ```
   - Update `GarminConnectConfig.json` with Garmin API credentials. The file can be found at C:\Users\User\.GarminDb on a Windows system

4. **Configure UiPath**:
   - Open `Main.xaml` in UiPath Studio.
   - Update the file paths and connection details in UiPath if necessary.
   - Connections and credentials are stored in the orchestrator for obvious reasons just reference them in the get assets and get credentials steps.
      - `Garmin Connect Sync Days` - Integer - Sets how many days back to sync, large numbers will sync more data with avry run, set very high  for first run and then to -2 or -1 for subsequent runs
      - `Garmin DB Type` - Text - Controls the database you want to use; set to `Influx` or `MSSQL`
      - `Location of my influx db` - Text - http://localhost:8086 Location of your influx db
      - `InfluxDB Garmin Connect Token` - Credential - Influxdb token API, store it in the password and just set the username to n/a
      - `InfluxDB Org` - Text - Set to your influx db org
      - `MSSQLConnectionString` - Text - `Data Source=192.168.10.10,5432;Initial Catalog=Garmin Connect;Encrypt=False;TrustServerCertificate=False;` Use this if you plan to use mssql
      - `MSSQLCredentials` - Credential - Account name and password for mssql

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

