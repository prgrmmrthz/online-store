<?php
  include('header.php');
?>
<html>  
    <head>  
      <title>Products List</title>  
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
  <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
  <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
  <style>
  .hide
  {
     display:none;
  }
  </style>
    </head>  
    <body>  
        <div class="container">  
   <br />
   <div class="table-responsive">  
    <h3 align="center">Products List</h3><br />
    <div id="grid_table"></div>
   </div>  
  </div>
    </body>  
</html>  
<script>
    $(document).ready(function(){
      var classificationsList=[];
      $.ajax({
        type: "GET",
        url: "http://localhost/capstone/backend/selectAll.php",
        success: (result)=>{
         classificationsList=result;
        },
        error: (e)=>{
         console.debug(e);
        }
      }).done(function(){
        console.debug(classificationsList, "classificationsList");

         $('#grid_table').jsGrid({
        width: "100%",
        height: "600px",

        filtering: true,
        inserting:true,
        editing: true,
        sorting: true,
        paging: true,
        autoload: true,
        pageSize: 10,
        pageButtonCount: 5,
        deleteConfirm: "Do you really want to delete data?",

        controller: {
        loadData: function(filter){
          return $.ajax({
          type: "GET",
          url: "http://localhost/capstone/backend/productsAPI.php",
          data: filter
          });
        },
        insertItem: function(item){
          return $.ajax({
          type: "POST",
          url: "http://localhost/capstone/backend/productsAPI.php",
          data:item
          });
        },
        updateItem: function(item){
          return $.ajax({
          type: "PUT",
          url: "http://localhost/capstone/backend/productsAPI.php",
          data: item
          });
        },
        deleteItem: function(item){
          return $.ajax({
          type: "DELETE",
          url: "http://localhost/capstone/backend/productsAPI.php",
          data: item
          });
        },
        },

        fields: [
        {
          name: "id",
        type: "hidden",
        css: 'hide'
        },
        {
          name: "name", 
        type: "text", 
        width: 150, 
        validate: "required"
        },
        {
          name: "price", 
        type: "text", 
        width: 50, 
        validate: function(value)
          {
            if(value >= 0)
            {
              return true;
            }
          }
        },
        {
          name: "description", 
          type: "textarea", 
          width: 250
        },
        {
          name: "classification", 
          type: "select", 
          items: classificationsList, 
          valueField: "id", 
          textField: "name", 
          validate: "required"
        },
        {
          name: "sale",
          type: "text",
          validate: "required"
        },
        {
          type: "control"
        }
        ]

        });
      });
    });
</script>

