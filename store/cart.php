<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Shop</title>

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
          <li class="nav-item">
            <a class="nav-link" href="index.php">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a href="cart.php" class="nav-link" href="index.php">
            Cart : {{cartCount}}
          <?php 
            session_start();
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
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">

        <div>
          <h3>Cart</h3>
        </div>

        <div class="row">
          <div class="col-12">
          <table class="table table-image">
            <thead>
              <tr>
                <th scope="col">Quantity</th>
                <th scope="col">Image</th>
                <th scope="col">Product Name</th>
                <th scope="col">Price</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="t in cartList">
                <th scope="row">{{t.quantity}}</th>
                <td class="w-25">
                  <img v-bind:src="'../backend/uploads/'+t.pix" class="img-fluid img-thumbnail">
                </td>
                <td>{{t.name}}</td>
                <td>{{t.price}}</td>
                <td>
                  <button v-on:click="deleteCart(t.id)" class="btn btn-danger">X</button>
                </td>
              </tr>
              <tr>
                <td>Total</td>
                <td col-span="4"><b>{{total.toFixed(2)}}</b></td>
              </tr>
            </tbody>
          </table>
          <a href="http://localhost/capstone/admin/pages/forms/general.html" v-on:click="setTotal()" class="btn btn-primary">Checkout</a>   
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
              cartList: [],
              cartCount: 0,
              total: 0
            },
            methods: {
              loadCart: function(){
                axios.get("http://localhost/capstone/backend/cart.php")
                .then((response)=>{
                  this.cartList=response.data;
                  this.cartCount=response.data.length;
                  this.total=response.data.reduce((a, b) => a + Number(b.price), 0) || 0.00;
                  })
                .catch(error => console.debug(error))
              },//fn
              deleteCart: function(id){
                let formData = new FormData();
                formData.append('data', id);
                axios.post("http://localhost/capstone/backend/cart.php", formData, { 
                      headers: {
                        'Content-Type': 'multipart/form-data'
                      }
                  })
                .then((response)=>{
                  console.debug(response);
                  this.loadCart();
                })
                .catch(error => console.debug(error))
              },//fn
              setTotal: function(){
                localStorage.setItem('orderTotal', this.total);
              },//fn
            },
            beforeMount(){
                this.loadCart();
                //console.log("is Logged in");
                //console.debug(this.userId);
            },
          })
  </script>

</body>

</html>
