$(function(){
	
		var chkProd = document.getElementsByName("RowCheck");
		var rowCnt  = chkProd.length;
		
		$("input[name='all']").click(function(){
			var chk_listArr = $("input[name='RowCheck']");
			for (var i=0; i<chk_listArr.length; i++){
				chk_listArr[i].checked = this.checked;
			}
		});
		$("input[name='RowCheck']").click(function(){
			if($("input[name='RowCheck']:checked").length == rowCnt){
				$("input[name='all']")[0].checked = true;
			}
			else{
				$("input[name='all']")[0].checked = false;
			}
		});
	});
	$('input[name=selectdelete]').click(function deleteProd(){
		var valueArr = [];
		var list = $('input[name=RowCheck]');
		console.log('here 0: '+list);
		for(var i=0; i<list.length; i++){
			if(list[i].checked){
				valueArr.push(list[i].val());
			}
		}
		if(valueArr.length == 0){
			alert("선택된 글이 없습니다.");
		}
		else{
			confirm("정말 삭제하시겠습니까?");
			
				let jsonData={"valueArr" : valueArr}
				console.log('here 1: '+jsonData);
			$.ajax({
					url:'/Kmarket/admin/delete.do',
					method :'post',
					traditional: true,
					data : jsonData,
					dataType:'json',
				success:function(data) {						console.log('here 2: '+Data);
						alert('삭제 완료');
						location.href='/Kmarket/admin/product/list.do';
					},
				error: function(){
					alert('에러 발생');
				}
				});
		
		}
});