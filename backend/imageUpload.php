<?php
  include('header.php');
?>
<html>  
    <head>  
    
        <title>Image Upload</title>  
        <!-- CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

        <!-- jQuery and JS bundle w/ Popper.js -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        <link href="https://unpkg.com/vue-bootstrap-typeahead/dist/VueBootstrapTypeahead.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/vue@2.5.17/dist/vue.js"></script>
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
        <script src="https://unpkg.com/vue-image-upload-resize"></script>
        <script src="https://unpkg.com/vue-bootstrap-typeahead"></script>
        <style>
          #app {
            font-family: 'Avenir', Helvetica, Arial, sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            text-align: center;
            color: #2c3e50;
            margin-top: 60px;
          },
          .hide
          {
            display:none;
          },
          #wrapper {
            padding-top: 50px;
            width: 400px;
            margin: 0 auto 0 auto;
          },
          #fileInput {
            display: none;
          }
          h1,
          h2 {
            font-weight: normal;
          }
          ul {
            list-style-type: none;
            padding: 0;
          }
          li {
            display: inline-block;
            margin: 0 10px;
          }
          a {
            color: #42b983;
          }
          .my-8 {
            margin-top: 4rem;
            margin-bottom: 4rem;
          }
        </style>
    </head>  
    <body>  
      <div id="wrapper" class="container">
        <div class="header">
          <h4>Image Upload</h4>
        </div>
        <div id="app" class="col">
        </div>
        <br>

        <div id='myapp'>

          <input type="file" id="file" ref="file" />
          <br><br>
          <button type="button" @click='uploadFile()' >Upload file</button>
        </div>

      <script>

          const template = `
            <div>
              Select Product to Upload Image: 
              <vue-bootstrap-typeahead
                v-model="query"
                :data="products"
                placeholder="Enter a product"
                :serializer="item => item.name"
                @hit="getProduct($event)"
              />
              <p class="lead">
                Selected Product: <strong>{{query}}</strong>
              </p>
            </div>

            `

            

           var selectBox= new Vue({
              template,
              components: {
                VueBootstrapTypeahead
              },
              data() {
                return {
                  query: '',
                  products: [],
                  selectedProductId:0,
                }
              },
              methods: {
                loadProducts: function(){
                  fetch("http://localhost/capstone/backend/selectAllProducts.php")
                  .then(response => response.json())
                  .then(data => (this.products=data));
                },
                getProduct: function(event){
                  this.selectedProductId=event.id;
                },
                setImage: function(output) {
                  this.hasImage = true;
                  this.image = output;
                  console.log('Info', output.info)
                  console.log('Exif', output.exif)
                }
              },
              beforeMount(){
                  this.loadProducts();
              },
            }).$mount('#app')

           var app = new Vue({
            el: '#myapp',
            data: {
              file: "",
            },
            methods: {

              uploadFile: function(){

                this.file = this.$refs.file.files[0];
                //console.debug(this.file);

                let formData = new FormData();
                formData.append('file', this.file);
                formData.append('productId', selectBox.selectedProductId)
                //console.debug('product id', selectBox.selectedProductId);
                
                axios.post('imageUploadAPI.php', formData,
                {
                    headers: {
                      'Content-Type': 'multipart/form-data'
                    }
                })
                .then(function (response) {

                    if(!response.data){
                      alert('File not uploaded.');
                    }else{
                      alert('File uploaded successfully.');
                    }

                })
                .catch(function (error) {
                    console.log(error);
                });

              }
            }
          })
      </script>
  </body>  
</html>