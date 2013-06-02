<!---
    |----------------------------------------------------------------------------------------------|
	| Parameter  | Required | Type    | Default | Description                                      |
    |----------------------------------------------------------------------------------------------|
	| name       | Yes      | string  |         | table name, in pluralized form                   |
	| force      | No       | boolean | false   | drop existing table of same name before creating |
	| id         | No       | boolean | true    | if false, defines a table with no primary key    |
	| primaryKey | No       | string  | id      | overrides default primary key name
    |----------------------------------------------------------------------------------------------|

    EXAMPLE:
      t = createTable(name='employees',force=false,id=true,primaryKey='empId');
      t.string(columnNames='name', default='', null=true, limit='255');
      t.text(columnNames='bio', default='', null=true);
      t.time(columnNames='lunchStarts', default='', null=true);
      t.datetime(columnNames='employmentStarted', default='', null=true);
      t.integer(columnNames='age', default='', null=true, limit='1');
      t.decimal(columnNames='hourlyWage', default='', null=true, precision='1', scale='2');
      t.date(columnNames='dateOfBirth', default='', null=true);
--->
<cfcomponent extends="plugins.dbmigrate.Migration" hint="Adds competition entrant table">
  <cffunction name="up">
    <cfscript>
      t = createTable(name='entrants');
      t.string(columnNames="firstname,surname,email,gender,age", null=false, limit=255);
      t.integer(columnNames="children,grandchildren,niecesnephews", null=false);
      t.integer(columnNames="newsletter", null=false, limit=1);
      t.integer(columnNames="emailconfirmed", null=false, default=0, limit=1);
      
      t.timestamps();
      t.create();
      
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
      dropTable('entrants');
    </cfscript>
  </cffunction>
</cfcomponent>
