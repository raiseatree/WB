
<cfcomponent extends="plugins.dbmigrate.Migration" hint="creates customers table">
  <cffunction name="up">
    <cfscript>
      t = createTable(name="customers");
      t.string(columnNames="firstname,surname,email,address,city,postcode",null=false,limit=255);
      t.string(columnNames="address2", null=true, default="", limit=255);
      
      t.references(referenceNames="promocode", polymorphic=true, null=true);
      
      t.timestamps();
      t.create();
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
      dropTable('customers');
    </cfscript>
  </cffunction>
</cfcomponent>
