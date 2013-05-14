<cfcomponent extends="plugins.dbmigrate.Migration" hint="creates customerchildren table">
  <cffunction name="up">
    <cfscript>
		t = createTable(name='customerchildren');
		t.string(columnNames="name,gender", null=false, limit=255);
		t.date(columnNames="dateofbirth", null=false);
		 
		t.references(referenceNames='customer', null=false, polymorphic=true);
		 
		t.timestamps();
		t.create();
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
      dropTable('customerchildren');
    </cfscript>
  </cffunction>
</cfcomponent>
