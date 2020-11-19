<?php
  include('header.php');
?>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Shop Homepage</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/vue@2.5.17/dist/vue.js"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

  <!-- Custom styles for this template -->
  <link href="css/shop-homepage.css" rel="stylesheet">

</head>

<body>
<div id="store">
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">Title</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a href="cart.php" class="nav-link" href="#">
            Cart : {{cartCount}}
          <?php 
            echo "[". $_SESSION['username'];
          ?>]
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="http://localhost/capstone/backend/logout.php">
           Logout
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">

        <h1 class="my-4">Shop Name</h1>
        <div class="list-group" id="classificationsList">
          <a v-for="t in classificationsList" href="#" class="list-group-item" v-on:click="populateProduct(t.id)">{{t.name}}</a>
        </div>

      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox" style=" width:100%; height: 250px !important;">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="../images/188f54ec8a8df592ee9cd84494e9bb91_medium.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="../images/41-414679_solar-panel-png-solar-power-system-logo2.png" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="../images/53e6d4454e57ab14f6da8c7dda793678153bdee757596c48732f7adc9245c25fbf_1280.jpg" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>

        <div class="row">

          <div v-for="t in productsList" class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" v-bind:src="'../backend/uploads/'+t.pix" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a>{{t.name}}</a>
                </h4>
                <h5>{{t.price}}</h5>
                <p class="card-text">{{t.description}}</p>
              </div>
              <div class="card-footer">
                <button v-on:click="addToCart(t.id)" class="btn btn-primary">+ Add to Cart</button>
              </div>
            </div>
          </div>

        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2020</p>
    </div>
    <!-- /.container -->
  </footer>
  </div>
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <script>
    new Vue({
            el: '#store',
            data: {
              classificationsList: [],
              productsList: [],
              cartCount: 0
            },
            methods: {
              loadClassifications: function(){
                axios.get("http://localhost/capstone/backend/selectAll.php")
                .then((response)=>this.classificationsList=response.data)
                .catch(error => console.debug(error))
              },//fn
              populateProduct: function(id){
                //console.debug(id, "catagory id")
                let formData = new FormData();
                formData.append('classId', id)
                axios
                  .post("http://localhost/capstone/backend/selectAllProducts.php", formData, { 
                      headers: {
                        'Content-Type': 'multipart/form-data'
                      }
                  })
                  .then((response)=>this.productsList=response.data)
                  .catch(error => console.debug(error))
              },//fn
              addToCart: function(id){
                let formData = new FormData();
                formData.append(`product`, id)
                axios
                  .post("http://localhost/capstone/backend/callSP.php", formData, { 
                      headers: {
                        'Content-Type': 'multipart/form-data'
                      }
                  })
                  .then((response)=>this.loadCart())
                  .catch(error => console.debug(error))
              },//fn
              loadCart: function(){
                axios.get("http://localhost/capstone/backend/cart.php")
                .then((response)=>this.cartCount=response.data.length)
                .catch(error => console.debug(error))
              }//fn
            },
            beforeMount(){
                this.loadClassifications();
                this.populateProduct(0);
                this.loadCart();
                //console.log("is Logged in");
                //console.debug(this.userId);
            },
          })
  </script>

</body>

</html>
