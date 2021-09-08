const app = angular.module("shopping-cart-app",[]);
app.controller("shopping-cart-ctrl" , function($scope ,$http){

    // quan ly gio hang
    $scope.cart={
        items:[],
        
        //them vao gio hang
        add(id){
          var item = this.items.find(item => item.id ==id );
          if (item) {
              item.qty++;
              this.saveToLocalStorage();
          } else {
             $http.get(`/rest/products/${id}`) .then(resp => {
                 resp.data.qty =1;
                 this.items.push(resp.data);
                 this.saveToLocalStorage();
             })
          }
        }, 

        //xoa san pham khoi gio hang
        remove(id){
            var index = this.items.findIndex(item => item.id == id);
            this.items.splice(index, 1);
            this.saveToLocalStorage();
        },

        //xoa sach gio hang
        clear(){
            this.items = []
            this.saveToLocalStorage();
        },

        //tinh thanh tien cua 1 sp
        amt_of(item){},

        //tinh tong so luong cac mat hang trong gio
        get count(){
            return this.items
            .map(item => item.qty )
            .reduce((total , qty) => total +=qty ,0);
        },
            
        //tinh tong thanh tien cac mat hang trong gio
        get amount(){
            return this.items
            .map(item => item.qty * item.price)
            .reduce((total , qty) => total +=qty ,0);
        },

        //luu gio hang vao cac local storage
        saveToLocalStorage(){
            var json = JSON.stringify(angular.copy(this.items));
            localStorage.setItem("cart" ,json);
        },

        //doc gio hang vao local storage
        loadFormLocalstorage(){
            var json = localStorage.getItem("cart");
            this.items = json ? JSON.parse(json) : [];
        }
    }
    $scope.cart.loadFormLocalstorage();
    
    $scope.order = {
		createDate: new Date(),
		address: "",
		account: { username: $("#username").text() },
		get orderDetails() {
			return $scope.cart.items.map(item => {
				return {
					product: { id: item.id },
					price: item.price,
					quantity: item.qty
				}
			});
		},
		purchase() {
			var order = angular.copy(this);
			//Thực hiện đặt hàng
			$http.post("/rest/orders", order).then(resp => {
				alert("Đặt hàng thành công!");
				$scope.cart.clear();
				location.href = "/order/detail/" + resp.data.id;

			}).catch(error => {
				alert("Đặt hàng lỗi!")
				console.log(error)
			})
		}
	}
})