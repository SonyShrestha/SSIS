<h2>Table to CSV</h2>
Things to do:<br>
Load Data from Table and dump it into CSV file.
<br><br>
Steps Used:<br>
<ol>
<li>Execute SQL Task</li>
<li>Data Flow Task</li>
</ol>
<br>
Note:<br>
Execute SQL Task is used to execute SQL query.<br>
Data Flow Task is used to send data from source(sql,flat file,csv) to destination(sql,flat file,csv).
<br><br><br>
<h2>Temporary Table to CSV</h2>
Things to do:<br>
Load Data from Temporary Table and dump it into CSV file.
<br><br>
Steps Used:<br>
<ol>
<li>Execute SQL Task</li>
<li>Data Flow Task</li>
</ol>
Note:<br>
Execute SQL Task is used to execute SQL query.<br>
Data Flow Task is used to send data from source(sql,flat file,csv) to destination(sql,flat file,csv).
<br><br>
Variables Set:
<br>
DelayValidation: TRUE<br>
RetainSameConnection: TRUE
<br><br><br>
<h2>CSV to Table</h2>
Things to do:<br>
Load Data from CSV file and dump it into SQL Table.<br>
Steps Used:<br>
<ol>
<li>Data Flow Task</li>
</ol>
Note:<br>
Data Flow Task is used to send data from source(sql,flat file,csv) to destination(sql,flat file,csv).
<br><br><br>
<h2>OLTP to DataWarehouse</h2>
Things to do:<br>
Load data from raw database to DWHDemo Database through Staging Database.<br>
Raw database will contain raw data.<br>
Staging area database will have only new records.<br>
DWHDemo database will contain latest records based on merge operation performed.<br><br>
Steps Used:<br>
<ol>
<li>Expression Task</li>
<li>Execute SQL Task</li>
<li>Data Flow Task</li>
</ol>
<br>
Note:<br>
Expression task is used to evaluate some expressions.
<br>
Execute SQL Task is used to execute SQL query.<br>
Data Flow Task is used to send data from source (sql,flat file,csv) to destination (sql,flat file,csv).
<br><br><br>
<h2>Meta Data Testing</h2>
Things to do:<br>
For each csv files under given directory, check whether Meta Data of csv file is as desired or not.<br><br>
Steps Used:
<ol>
<li>Foreach Loop Container</li>
<li>Script Task</li>
<li>Data Flow Task</li>
<li>Execute SQL Task</li>
<li>File System Task</li>
</ol>
<br>
C# code to check if MetaData is same as expected or not<br><br>
if (r.ReadLine().Trim()== Dts.Variables["User::MetaDataString"].Value.ToString()){
    Dts.Variables["User::Flag"].Value = true;
    MessageBox.Show(Dts.Variables["User::Flag"].Value.ToString());
    }
    else{
    Dts.Variables["User::Flag"].Value = false;
    MessageBox.Show(Dts.Variables["User::Flag"].Value.ToString());
    }
    r.Close();
<br><br>
Note:<br>
Foreach Loop Container is used to iterate through all files in a directory.<br>
Script Task is used to execute a piece of code written in C# Language.<br>
Data Flow Task is used to trasfer data from source to destination.<br>
Execute SQL Script is used to execute SQL Query.<br>
File System Task is used to perform file related operations such as move, copy files and directories.
<br><br><br>
<h2>ForLoop n times</h2>
Things to do:<br>
Iterate a loop n number of times<br><br>
Steps Used:<br>
Script Task<br><br>
Note:<br>
Script Task is used to execute a piece of code written in C# Language.
<br><br><br>
<h2>File Name from FilePath</h2>
Things to do:<br>
Get file name out of file path<br><br>
Expression Used:<br>
FileName: RIGHT( @[User::FilePath], FINDSTRING(REVERSE(@[User::FilePath]),"\\",1)-1)
<br><br><br>
<h2>File Date from File Path</h2>
Things to do:<br>
Get date component out of file path<br><br>
Expression Used:<br>
File Name: REPLACE(RIGHT( @[User::FilePath], FINDSTRING(REVERSE(@[User::FilePath]),"\\",1)-1),".csv","") <br>
File Component: SUBSTRING( @[User::FileName] ,1, len( @[User::FileName] )-8) <br>
Date Component: RIGHT( @[User::FileName],8)<br>
<br><br>
<h2>Date in format YYYYMMDD</h2>
Things to do:<br>
Get Date in format YYYYMMDD from current date<br><br>
Expression Used:<br>
Date: REPLACE((DT_WSTR, 10) (DT_DBDATE) @[User::CurrentDate],"-","")
<br><br><br>
<h2>ZipUnzip</h2>
Under this package, we will zip and unzip files using Execute Process Task in SSIS.
<br>
<br>
Execute Process Task step can also be used to open Calculator and Word as:
<ul>
    <li>calc</li>
    <li>winword</li>
</ul>
<br>
<h3>To Unzip file</h3>
Executable: C:\Program Files\WinRAR\WinRAR.exe
<br>
Arguments: e D:\github\SSIS\10_ZipUnzip\Files\Compressed\Compressed.zip -o+ 
<br>
Working Directory: D:\github\SSIS\10_ZipUnzip\Files\Uncompressed

<br>
<br>
<h3>To Zip file </h3>
Executable: C:\Program Files\WinRAR\WinRAR.exe
<br>
Arguments: a -r D:\github\SSIS\10_ZipUnzip\Files\Uncompressed\Data.zip D:\github\SSIS\10_ZipUnzip\Files\Uncompressed\*.*
<br>
Working Directory:
<br>
<br>
<br>
<h2>Compressed File_to_Table</h2>
<ol>
<li>Source Folder contains .zip folder with data(current_date) as folder name</li>
<li>Check if folder name is as per convention defined or not</li>
<li>Unzip files present in .zip folder</li>
<li>Check if files name is as per convention defined or not</li>
<li>Load data from file into SQL Database</li>
<li>Log errors in between steps into table named LogTable</li>
<li>Move .zip file to archive folder after all processes are completed</li>
</ol>
<br>
<br>
<br>
<h2>Ways for Debugging and Troubleshooting</h2>
<ol>
<li>Break Point</li>
<li>Watch Window</li>
<li>Data Viewer</li>
<li>Data Flow Path</li>
<li>Precedence Constraints</li>
<li>Script Component</li>
</ol>
<br>
Break Point will pause the execution so that we can view variables being passed using watch window.<br>
Through Data Viewer we can view data being trasfered from source to destination step.
<br>
Jobs in a task are independent if they can be executed in any order. If there is a specific order in which jobs in a task have to be executed then jobs are said to have precedence constraints.
<br>
Precedence Constraint specifies whether to execute following step on success, failure or completion of previous step.
<br>
Script Component can be used to check value of variable being used using MessageBox.
<br>
<br>
<br>
<br>
<h2>Evaluation Operations</h2>
Integration Services provides the following evaluation operations:

A constraint that uses only the execution result of the precedence executable to determine whether the constrained executable runs. The execution result of the precedence executable can be completion, success, or failure. This is the default operation.

An expression that is evaluated to determine whether the constrained executable runs. If the expression evaluates to true, the constrained executable runs.

An expression and a constraint that combines the requirements of execution results of the precedence executable and the return results of evaluating the expression.

An expression or a constraint that uses either the execution results of the precedence executable or the return results of evaluating the expression.
<br>
<br>
<br>
<br>
<h2>Break Point, Watch Window and Data Viewer</h2>
Breakpoint
<br>
Many programmers use breakpoints to debug programs, viewing the value of variables and following the flow of the logic as they step through the source code. SSIS enables you to set breakpoints on the package or any Control Flow Task or Container.
<br>
<br>
Watch Window
<br>
Watch windows are used to monitor the package variables during package execution in SSIS.
<br>
<br>
Data Viewer
<br>
A data viewer is used to display data between two data flow transformations in SSIS packages.
<br>
<br>
<br>
<br>
<h2>Problematic Records</h2>
<ol>
<li>Problemtic records can be redirected to other steps.</li>
<li>Multicast step will function like dummy destination. Audit Control can also be used as dummy destination.</li>
<li>When we dump redirected error into some table, error column field is generated. Value of this field is obtained from LineageID.</li>
<ul>
<li>Step, Right Click, Show Advanced Editor</li>
<li>Input and Output Properties Tab</li>
<li>Flat File Source Output</li>
<li>Output Columns</li>
</ul>
<li>Based on input fields ErrorCode and ErrorColumn, output fields like ErrorDescription and ErrorColumnName can be generated using Script Transformation Editor Step and writing C# language. </li>
</ol>
<br>
<br>
Code to generate ErrorDescriptiona dn ErrorColumnName out of ErrorCode and ErrorColumn
<br>
 Row.ErrorDescription = this.ComponentMetaData.GetErrorDescription(Row.ErrorCode);
   if (Row.ErrorColumn == 0)
   {
              Row.ErrorColumnName = "An error that affects the entire row";
            
   }
   else   
   {
                var componentMetaData130 = this.ComponentMetaData as IDTSComponentMetaData130;

                    if (componentMetaData130 != null) 
                    {
                    Row.ErrorColumnName = componentMetaData130.GetIdentificationStringByID(Row.ErrorColumn).Replace("Customer Target.Inputs[OLE DB Destination Input].Columns[", "").Replace("]", "");
                
                    }
            
    }

<br>
<h2>Package and Project Level Parameters</h2>
Paramaters can be configured in Project level and Package level.
One project can have multiple packages.
If all packages share common variable, we can set parameters in project level.
If variables are package specific, we can create package level variables.
