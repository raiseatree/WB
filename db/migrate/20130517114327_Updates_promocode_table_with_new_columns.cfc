<!---
    |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
	| Parameter     | Required | Type    | Default | Description                                                                                                                                           |
    |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
	| table         | Yes      | string  |         | existing table name                                                                                                                                   |
	| columnType    | Yes      | string  |         | type of column to add                                                                                                                                 |
	| columnName    | No       | string  |         | name for new column, required if columnType is not 'reference'                                                                                        |
	| referenceName | No       | string  |         | name for new reference column, see documentation for references function, required if columnType is 'reference'                                       |
	| default       | No       | string  |         | default value for column                                                                                                                              |
	| null          | No       | boolean |         | whether nulls are allowed                                                                                                                             |
	| limit         | No       | number  |         | character or integer size limit for column                                                                                                            |
	| precision     | No       | number  |         | precision value for decimal columns, i.e. number of digits the column can hold                                                                        |
	| scale         | No       | number  |         | scale value for decimal columns, i.e. number of digits that can be placed to the right of the decimal point (must be less than or equal to precision) |
    |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

    EXAMPLE:
      addColumn(table='users', columnType='string', columnName='password', default='', null=true);
--->
<cfcomponent extends="plugins.dbmigrate.Migration" hint="Updates promocode table with new columns">
  <cffunction name="up">
    <cfscript>
	    addColumn(table='promocodes', columnType='string', columnName='paypalcodefortnightly', default='', null=true);
	    addColumn(table='promocodes', columnType='string', columnName='paypalcodemonthly', default='', null=true);
	    addColumn(table='promocodes', columnType='string', columnName='message', default='', null=true);
	    removeColumn(table='promocodes',columnName='firstfee');
	    removeColumn(table='promocodes',columnName='nodaysdelay');
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
		removeColumn(table='promocodes',columnName='paypalcode');
    </cfscript>
  </cffunction>
</cfcomponent>
