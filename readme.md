# Zero Downtime Presentation

This is a repository for my Architecting Zero Downtime presentation.

There are two main sections of the repo: the client and SQL Code. There are a few sections in this readme as well:
- <a href="#pptx">The PowerPoint decks</a>
- <a href="#client">The PowerPoint decks</a>
- <a href="#sql">The PowerPoint decks</a>

If you have questions, suggestions, or comments, feel free to open an issue. If you have improvements, you can try a PR, but if it messes up the talk, I won't accept it.

## <a name="pptx">PowerPoint</a>
I've included decks in the repo. One is a generic deck. The other is from VS Live Las Vegas 2023.

## <a name="client">DB Client</a>
This location contains a Visual Studio 2019 project that builds a thick client you can use to connect to a SQL Server instance and continuously run a workload. This workload matches up with the code from the SQL folder.

You can compile this in VS 2019 and run it. It might work in other versions, but that's the version I've been using.

**Note**: This requires the database and code from the SQL folder. Before clicking start on the app, the scripts 01 and 02 must be run.

When the app runs, you can start and stop the calls against the database. The default database is ZeroDowntime, and the credentials were mine for a test system. You can enter your own. These should point to the location where you have executed the SQL scripts 01 and 02.

The encrypted checkbox is for Always Encrypted, but I haven't tested this yet.

This client simulates a constant workload of querying orders, adding new customers, adding new orders, and running a sales report. Code for all the procedures called is in the SQL folder.

The Clear Errors button just resets the error count. Useful to see if a different deployment sequence or process causes errors.

The four buttons in the middle are designed as feature flags. If these are turned on, then the app expects different results from the database. These can be toggled on and off. The exception is the Proc button, which goes through 4 states in a circular loop.

The three text boxes (year, startdate, enddate) are parameters for the SalesReport stored procedure.

## <a name="sql">SQL Code</a>
This folder contains a number of files. I tend to number in this way:
- 0x - Setup stuff
- 1x - Module 1
- 2x - Module 2
- etc.

In this case, there are 4 modules after the setup. These are designed to be run in order, though I don't guarentee you can execute them all. I have tried to note where to work with the app to see the effects.

The 01 and 02 files will create a database and set up the objects needed. The 08 is used while the app is running to demo an error.

The other modules follow a format where the first file (10, 20, 30, etc.) is code that might cause errors and downtime. The other files show multiple deployments in a zero downtime process. For the first demo, the splitting the name, there are three deployments, which are in files (11, 12, 13).


