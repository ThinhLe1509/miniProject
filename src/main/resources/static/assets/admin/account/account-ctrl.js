app.controller("account-ctrl", function($scope,$http){
    $scope.items =[];
    $scope.form = {};
    $scope.roles = [];
    
    $scope.initialize = function(){
        $http.get("/rest/accounts/all").then(resp =>{
            $scope.items = resp.data;
        })

        $http.get("/rest/roles").then(resp => {
            $scope.roles = resp.data;
        })
    }

    $scope.initialize();
	

    $scope.reset = function(){
        $scope.form = {
            photo:'cloud-upload.jpg'
        }
    };


    $scope.edit = function(item){
        $scope.form = angular.copy(item);
        $(".nav-tabs a:eq(0)").tab('show')
    }

    $scope.create = function(){
        var item = angular.copy($scope.form);
        $http.post('/rest/accounts', item).then(resp =>{
            $scope.items.push(resp.data);
            $scope.reset();
            alert("them thanh cong");
        }).catch(error =>{
            alert("loi them");
            console.log("Error", error);
        })
    }

    $scope.update = function(){
        var item = angular.copy($scope.form);
        $http.put(`/rest/accounts/${item.username}`, item).then(resp =>{
            var index = $scope.items.findIndex(p => p.id == item.id);
            $scope.items[index] = item;
            alert("updload thanh cong");
			$scope.reset();
        }).catch(error =>{
            alert("loi updload");
            console.log("Error", error);
        })
    }

    $scope.delete = function(item){
        $http.delete(`/rest/accounts/${item.username}`).then(resp =>{
            var index = $scope.items.findIndex(p => p.id == item.id);
            $scope.items.splice(index, 1);
            alert("delete thanh cong");
			$scope.reset();
        }).catch(error =>{
            alert("loi delete");
            console.log("Error", error);
        })
    }

    $scope.imageChanged = function(files){
        var data = new FormData;
        data.append('file', files[0]);
        $http.post('/rest/upload/images', data, {
            transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
        }).then(resp => {
            $scope.form.photo =resp.data.name;
        }).catch(error =>{
            alert("loi upload");
            console.log("Error", error)
        })

    }



    $scope.pager ={
        page: 0,
        size: 10,
		get items(){
			var start = this.page*this.size;
			return $scope.items.slice(start, start+this.size);
		},
        get count(){
            return Math.ceil(1.0 * $scope.items.length / this.size);      
          },
        first(){
            this.page =0;
        },
        prev(){
            this.page--;
            if(this.page <0){
                this.last();
            }
        },
        next(){
            this.page++;
            if(this.page >= this.count){
                this.first();
            }
        },
        last(){
            this.page = this.count -1;
        }
		
    }

})