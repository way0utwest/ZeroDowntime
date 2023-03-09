# Zero Downtime Presentation

This is a repository for my Architecting Zero Downtime presentation.

There are two main sections of the repo: the client and SQL Code.

## DB Client
This location contains a Visual Studio 2019 project that builds a thick client you can use to connect to a SQL Server instance and continuously run a workload. This workload matches up with the code from the SQL folder.

You can compile this in VS 2019 and run it. It might work in other versions, but that's the version I've been using.

**Note**: This requires the database and code from the SQL folder.

When the app runs, you can start and stop the calls against the database. The default database is ZeroDowntime, and the credentials were mine for a test system. You can enter your own. 

The encrypted checkbox is for Always Encrypted, but I haven't tested this yet.

This client simulates a constant workload of querying orders, adding new customers, adding new orders, and running a sales report. Code for all the procedures called is in the SQL folder.

The Clear Errors button just resets the error count. Useful to see if a different deployment sequence or process causes errors.

The four buttons in the middle are designed as feature flags. If these are turned on, then the app expects different results from the database. These can be toggled on and off. The exception is the Proc button, which goes through 4 states in a circular loop.

The three text boxes (year, startdate, enddate) are parameters for the SalesReport stored procedure.

## SQL Code
This folder contains a number of files. I tend to number in this way:
- 0x - Setup stuff
- 1x - Module 1
- 2x - Module 2
- etc.

In this case, there are 4 modules after the setup. These are designed to be run in order, though I don't guarentee you can execute them all. I have tried to note where to work with the app to see the effects.

The 01 and 02 files will create a database and set up the objects needed. The 08 is used while the app is running to demo an error.

The other modules follow a format where the first file (10, 20, 30, etc.) is code that might cause errors and downtime. The other files show multiple deployments in a zero downtime process.
