 $("#city-search").on("keyup", function(){
   autocomplete()
 });

 function autocomplete(){
   $.ajax({
     url: '/search',
     type: 'POST',
     data: $("#city-search").serialize(), //takes the form data and authenticity toke and converts it into a standard URL
     dataType: 'json', //specify what type of data you're expecting back from the servers
     error: function() {
         console.log("Something went wrong");
     },
     success: function(data) {
       $("#list").html("");

       data.forEach(function(element) {
         var option = document.createElement("option");
         option.value = element;

         //append option to list
         $("#list").append(option);
       });
     }
   });
 }
