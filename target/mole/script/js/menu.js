$(function(){
	//initWestMenu(menus.data);
	$.ajax({
		url:"system/menu",
		type:"post",
		data:{action:"nav"},
		dataType:"json",
		cache:false,
		success:function(data){
			//console.log("success");
			//console.log(data);
			initWestMenu(data);
		},
		error:function(err){
			//console.log("error");
			//console.log("err");
		}
	})
})

function initWestMenu(menu){
	$.each(menu.data, function(i, n) {
		var menulist ='';
		//console.log(n.url)
		menulist +='<ul m_url="' + n.url + '">';
        $.each(n.menus, function(j, o) {
        	//console.log(o.url)
			menulist += '<li><div><span ref="'+o.menuid+'" rel="' + o.url + '" title="'+o.menuname+'">' + o.menuname + '</span></div></li> ';
        })
		menulist += '</ul>';
		$('#nav').accordion('add', {
            title: n.menuname,
            content: menulist,
            selected:false
        });

    });
	var ul = $('.easyui-accordion ul');
	$('#nav').accordion({
		selected:false,//选择是否展开面板
		onSelect: function(title,index){//面板点击事件
			var url = ul[index].getAttribute("m_url");
			var icon = null;
			addTab(title,url,icon);
		}
	})
	$('.easyui-accordion li span').click(function(){
		var tabTitle = $(this).attr("title");
		var url = $(this).attr("rel");
		var menuid = $(this).attr("ref");
		var icon = null;
		addTab(tabTitle,url,icon);
	});
}

function addTab(subtitle,url,icon){
	if(!$('#tabs').tabs('exists',subtitle)){
		$('#tabs').tabs('add',{
			title:subtitle,
			content:createFrame(url),
			closable:true,
			icon:icon
		});
	}else{
		$('#tabs').tabs('select',subtitle);
	}
}

function createFrame(url)
{
	var s = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
	return s;
}

