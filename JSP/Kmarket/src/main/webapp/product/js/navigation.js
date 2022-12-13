$(function(){
		
		var highsold = document.getElementById('highsold');
		var lowprice = document.getElementById('lowprice');
		var highprice = document.getElementById('highprice');
		var highrating = document.getElementById('highrating');
		var highreview = document.getElementById('highreview');
		var newold = document.getElementById('newold');
		
		$(document).on('click', '#highsold', function(e){
			e.preventDefault();
			
			console.log('here1');
			let cate1 = $(this).attr('data-cate1');
			let cate2 = $(this).attr('data-cate2');
			
			console.log('here2-1 : ' + cate1);
			console.log('here2-2 : ' + cate2);
			let jsonData = {"cate1":cate1, "cate2":cate2};
			
			console.log('here3');
			$.ajax({
				url:'/Kmarket/product/productsort1.do',
				method:'GET',
				data:jsonData,
				dataType:'json',
				success:function(data){
					console.log('here4');
					$('.productlist').empty();
					
					highsold.classList.add('on');
					lowprice.classList.remove('on');
					highprice.classList.remove('on');
					highrating.classList.remove('on');
					highreview.classList.remove('on');
					newold.classList.remove('on');
					
					for(let product of data){
						let price = product.price * (100-product.discount) * 0.01;
						
						let table  = "<tr>";
							table += "<td><a href='#' class='thumb'><img src='http://3.39.231.136:8080/Kmarket/file/"+product.thumb1+"' alt='상품이미지'></a></td>";
							table += "<td>"
							table += "<h3 class='name'>"+product.prodName+"</h3>";
							table += "<a href='#' class='desc'>"+product.descript+"</a>";
							table += "</td>";
							table += "<td>";
							table += "<ul>";
							if(product.discount > 0){
								table += "<li><ins class='dis-price'>"+price+"</ins></li>";
								table += "<li><del class='org-price'>"+product.price+"</del><span class='discount'>"+product.discount+"</span></li>";	
							}else{
								table += "<li><del class='dis-price'>"+product.price+"</del></li>";	
							}
							if(product.delivery == 0){
								table += "<li><span class='free-delivery'>무료배송</span></li>";	
							}else{
								table += "<li><span>배송비 "+product.delivery+"</span></li>";	
							}
							table += "</ul>";
							table += "</td>";
							table += "<td><h4 class='seller'><i class='fas fa-home'></i>&nbsp;"+product.seller+"</h4><h5 class='badge power'>판매자등급</h5><h6 class='rating star1'>상품평</h6></td>"
							table += "</tr>"
					
						$('.productlist').append(table);
					}
					
				}
			});
			console.log('here5');
		});
		
		$(document).on('click', '#lowprice', function(e){
			e.preventDefault();
			
			console.log('here1');
			let cate1 = $(this).attr('data-cate1');
			let cate2 = $(this).attr('data-cate2');
			
			console.log('here2');
			let jsonData = {"cate1":cate1, "cate2":cate2};
			
			console.log('here3');
			$.ajax({
				url:'/Kmarket/product/productsort2.do',
				method:'GET',
				data:jsonData,
				dataType:'json',
				success:function(data){
					console.log('here4');
					$('.productlist').empty();
					
					highsold.classList.remove('on');
					lowprice.classList.add('on')
					highprice.classList.remove('on');
					highrating.classList.remove('on');
					highreview.classList.remove('on');
					newold.classList.remove('on');
					
					for(let product of data){
						let price = product.price * (100-product.discount) * 0.01;
						
						let table  = "<tr>";
							table += "<td><a href='#' class='thumb'><img src='http://3.39.231.136:8080/Kmarket/file/"+product.thumb1+"' alt='상품이미지'></a></td>";
							table += "<td>"
							table += "<h3 class='name'>"+product.prodName+"</h3>";
							table += "<a href='#' class='desc'>"+product.descript+"</a>";
							table += "</td>";
							table += "<td>";
							table += "<ul>";
							if(product.discount > 0){
								table += "<li><ins class='dis-price'>"+price+"</ins></li>";
								table += "<li><del class='org-price'>"+product.price+"</del><span class='discount'>"+product.discount+"</span></li>";	
							}else{
								table += "<li><del class='dis-price'>"+product.price+"</del></li>";	
							}
							if(product.delivery == 0){
								table += "<li><span class='free-delivery'>무료배송</span></li>";	
							}else{
								table += "<li><span>배송비 "+product.delivery+"</span></li>";	
							}
							table += "</ul>";
							table += "</td>";
							table += "<td><h4 class='seller'><i class='fas fa-home'></i>&nbsp;"+product.seller+"</h4><h5 class='badge power'>판매자등급</h5><h6 class='rating star1'>상품평</h6></td>"
							table += "</tr>"
					
						$('.productlist').append(table);
					}
					
				}
			});
			console.log('here5');
		});
		$(document).on('click', '#highprice', function(e){
			e.preventDefault();
			
			console.log('here1');
			let cate1 = $(this).attr('data-cate1');
			let cate2 = $(this).attr('data-cate2');
			
			console.log('here2');
			let jsonData = {"cate1":cate1, "cate2":cate2};
			
			console.log('here3');
			$.ajax({
				url:'/Kmarket/product/productsort3.do',
				method:'GET',
				data:jsonData,
				dataType:'json',
				success:function(data){
					console.log('here4');
					$('.productlist').empty();
					
					highsold.classList.remove('on');
					lowprice.classList.remove('on')
					highprice.classList.add('on');
					highrating.classList.remove('on');
					highreview.classList.remove('on');
					newold.classList.remove('on');
					
					for(let product of data){
						let price = product.price * (100-product.discount) * 0.01;
						
						let table  = "<tr>";
							table += "<td><a href='#' class='thumb'><img src='http://3.39.231.136:8080/Kmarket/file/"+product.thumb1+"' alt='상품이미지'></a></td>";
							table += "<td>"
							table += "<h3 class='name'>"+product.prodName+"</h3>";
							table += "<a href='#' class='desc'>"+product.descript+"</a>";
							table += "</td>";
							table += "<td>";
							table += "<ul>";
							if(product.discount > 0){
								table += "<li><ins class='dis-price'>"+price+"</ins></li>";
								table += "<li><del class='org-price'>"+product.price+"</del><span class='discount'>"+product.discount+"</span></li>";	
							}else{
								table += "<li><del class='dis-price'>"+product.price+"</del></li>";	
							}
							if(product.delivery == 0){
								table += "<li><span class='free-delivery'>무료배송</span></li>";	
							}else{
								table += "<li><span>배송비 "+product.delivery+"</span></li>";	
							}
							table += "</ul>";
							table += "</td>";
							table += "<td><h4 class='seller'><i class='fas fa-home'></i>&nbsp;"+product.seller+"</h4><h5 class='badge power'>판매자등급</h5><h6 class='rating star1'>상품평</h6></td>"
							table += "</tr>"
					
						$('.productlist').append(table);
					}
					
				}
			});
			console.log('here5');
		});
		$(document).on('click', '#highrating', function(e){
			e.preventDefault();
			
			console.log('here1');
			let cate1 = $(this).attr('data-cate1');
			let cate2 = $(this).attr('data-cate2');
			
			console.log('here2');
			let jsonData = {"cate1":cate1, "cate2":cate2};
			
			console.log('here3');
			$.ajax({
				url:'/Kmarket/product/productsort4.do',
				method:'GET',
				data:jsonData,
				dataType:'json',
				success:function(data){
					console.log('here4');
					$('.productlist').empty();
					
					highsold.classList.remove('on');
					lowprice.classList.remove('on')
					highprice.classList.remove('on');
					highrating.classList.add('on');
					highreview.classList.remove('on');
					newold.classList.remove('on');
					
					for(let product of data){
						let price = product.price * (100-product.discount) * 0.01;
						
						let table  = "<tr>";
							table += "<td><a href='#' class='thumb'><img src='http://3.39.231.136:8080/Kmarket/file/"+product.thumb1+"' alt='상품이미지'></a></td>";
							table += "<td>"
							table += "<h3 class='name'>"+product.prodName+"</h3>";
							table += "<a href='#' class='desc'>"+product.descript+"</a>";
							table += "</td>";
							table += "<td>";
							table += "<ul>";
							if(product.discount > 0){
								table += "<li><ins class='dis-price'>"+price+"</ins></li>";
								table += "<li><del class='org-price'>"+product.price+"</del><span class='discount'>"+product.discount+"</span></li>";	
							}else{
								table += "<li><del class='dis-price'>"+product.price+"</del></li>";	
							}
							if(product.delivery == 0){
								table += "<li><span class='free-delivery'>무료배송</span></li>";	
							}else{
								table += "<li><span>배송비 "+product.delivery+"</span></li>";	
							}
							table += "</ul>";
							table += "</td>";
							table += "<td><h4 class='seller'><i class='fas fa-home'></i>&nbsp;"+product.seller+"</h4><h5 class='badge power'>판매자등급</h5><h6 class='rating star1'>상품평</h6></td>"
							table += "</tr>"
					
						$('.productlist').append(table);
					}
					
				}
			});
			console.log('here5');
		});
		$(document).on('click', '#highreview', function(e){
			e.preventDefault();
			
			console.log('here1');
			let cate1 = $(this).attr('data-cate1');
			let cate2 = $(this).attr('data-cate2');
			
			console.log('here2');
			let jsonData = {"cate1":cate1, "cate2":cate2};
			
			console.log('here3');
			$.ajax({
				url:'/Kmarket/product/productsort5.do',
				method:'GET',
				data:jsonData,
				dataType:'json',
				success:function(data){
					console.log('here4');
					$('.productlist').empty();
					
					highsold.classList.remove('on');
					lowprice.classList.remove('on')
					highprice.classList.remove('on');
					highrating.classList.remove('on');
					highreview.classList.add('on');
					newold.classList.remove('on');
					
					for(let product of data){
						let price = product.price * (100-product.discount) * 0.01;
						
						let table  = "<tr>";
							table += "<td><a href='#' class='thumb'><img src='http://3.39.231.136:8080/Kmarket/file/"+product.thumb1+"' alt='상품이미지'></a></td>";
							table += "<td>"
							table += "<h3 class='name'>"+product.prodName+"</h3>";
							table += "<a href='#' class='desc'>"+product.descript+"</a>";
							table += "</td>";
							table += "<td>";
							table += "<ul>";
							if(product.discount > 0){
								table += "<li><ins class='dis-price'>"+price+"</ins></li>";
								table += "<li><del class='org-price'>"+product.price+"</del><span class='discount'>"+product.discount+"</span></li>";	
							}else{
								table += "<li><del class='dis-price'>"+product.price+"</del></li>";	
							}
							if(product.delivery == 0){
								table += "<li><span class='free-delivery'>무료배송</span></li>";	
							}else{
								table += "<li><span>배송비 "+product.delivery+"</span></li>";	
							}
							table += "</ul>";
							table += "</td>";
							table += "<td><h4 class='seller'><i class='fas fa-home'></i>&nbsp;"+product.seller+"</h4><h5 class='badge power'>판매자등급</h5><h6 class='rating star1'>상품평</h6></td>"
							table += "</tr>"
					
						$('.productlist').append(table);
					}
					
				}
			});
			console.log('here5');
		});
		$(document).on('click', '#newold', function(e){
			e.preventDefault();
			
			console.log('here1');
			let cate1 = $(this).attr('data-cate1');
			let cate2 = $(this).attr('data-cate2');
			
			console.log('here2');
			let jsonData = {"cate1":cate1, "cate2":cate2};
			
			console.log('here3');
			$.ajax({
				url:'/Kmarket/product/productsort6.do',
				method:'GET',
				data:jsonData,
				dataType:'json',
				success:function(data){
					console.log('here4');
					$('.productlist').empty();
					
					highsold.classList.remove('on');
					lowprice.classList.remove('on')
					highprice.classList.remove('on');
					highrating.classList.remove('on');
					highreview.classList.remove('on');
					newold.classList.add('on');
					
					for(let product of data){
						let price = product.price * (100-product.discount) * 0.01;
						
						let table  = "<tr>";
							table += "<td><a href='#' class='thumb'><img src='http://3.39.231.136:8080/Kmarket/file/"+product.thumb1+"' alt='상품이미지'></a></td>";
							table += "<td>"
							table += "<h3 class='name'>"+product.prodName+"</h3>";
							table += "<a href='#' class='desc'>"+product.descript+"</a>";
							table += "</td>";
							table += "<td>";
							table += "<ul>";
							if(product.discount > 0){
								table += "<li><ins class='dis-price'>"+price+"</ins></li>";
								table += "<li><del class='org-price'>"+product.price+"</del><span class='discount'>"+product.discount+"</span></li>";	
							}else{
								table += "<li><del class='dis-price'>"+product.price+"</del></li>";	
							}
							if(product.delivery == 0){
								table += "<li><span class='free-delivery'>무료배송</span></li>";	
							}else{
								table += "<li><span>배송비 "+product.delivery+"</span></li>";	
							}
							table += "</ul>";
							table += "</td>";
							table += "<td><h4 class='seller'><i class='fas fa-home'></i>&nbsp;"+product.seller+"</h4><h5 class='badge power'>판매자등급</h5><h6 class='rating star1'>상품평</h6></td>"
							table += "</tr>"
					
						$('.productlist').append(table);
					}
					
				}
			});
			console.log('here5');
		});
	});