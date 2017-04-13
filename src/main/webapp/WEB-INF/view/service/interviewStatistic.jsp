<%--
  Created by IntelliJ IDEA.
  User: chenyong
  Date: 2017-04-09
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/acharts-min.js"></script>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <title>统计展示</title>
</head>
<body>
<div style="position: relative;left:20px">
<button type="button" id="commentSta" class="btn btn-success">评价统计</button>
<button type="button" id="jobSta" class="btn btn-success">随访员工作统计</button>
<button type="button" id="hpSta" class="btn btn-success">住院统计</button>
</div>
<div class="detail-section">
    <div id="canvas">

    </div>
</div>

<script>

        $("#commentSta").click(function(){
            $("#canvas").remove();
            location.href="/randominterview/statistic";
        })

        $("#jobSta").click(function(){

            jobSta();

        })

        $("#hpSta").click(function(){
            $.ajax({
                url: "/randominterview/hpstatistic",
                type: "POST",
                dataType: "json",
                success: function (data) {
                    lineShape(data);
                },
                error:function(){
                }
            });




        })




    function jobSta(){
        $.ajax({
            url: "/randominterview/taskstatistic",
            type: "POST",
            dataType: "json",
            success: function (data) {
                category(data);
            },
            error:function(){
            }
        });

    }



        function lineShape(data){
            $("#canvas").empty();
            var name= new Array();
            var val= new Array();
            for(var i in data.datas){
                name[i] = data.datas[i].name;
                val[i] = data.datas[i].value;
            }
            var chart = new AChart({
                id : 'canvas',
                width : 950,
                height : 500,
                plotCfg : {
                    margin : [50,50,80] //画板的边距
                },
                title: {
                    text: data.title
                },
                subTitle: {
                    text: '没有的日期代表当天没有病人入住'
                },
                xAxis : {
                    categories :name
                },
                yAxis: {
                    ticks : [0,1,2,3,4,5,6,7,8,9,10,11,12],//y轴添加title
                    title: {
                        text: '数量',
                        rotate: -90
                    }
                },
                tooltip : {

                    shared : true, //是否多个数据序列共同显示信息
                    crosshairs : true //是否出现基准线
                },
                series : [{
                    name: '入住统计',
                    data: val
                }]
            });

            chart.render();

        }


    function category(data){
        $("#canvas").empty();
        var val = data.datas;
        var chart = new AChart({
            id : 'canvas',
            width : 950,
            height : 400,
            xAxis : {
                type : 'category'
            },
            seriesOptions : {
                columnCfg : {
                    allowPointSelect : true,
                    xField : 'x',
                    item : {
                        cursor : 'pointer',
                        stroke : 'none'
                    }
                }
            },
            yAxis : {
                min : 0
            },
            series: [ {
                name: data.title,
                events : {
                    itemclick : function (ev) {
                        var point = ev.point,
                            //item = ev.item, //点击的项
                            obj = point.obj; //point.obj是点击的配置项的信息
                        alert(obj.x); //执行一系列操作
                    }/*,
                     itemselected : function(ev){ //选中事件

                     },
                     itemunselected : function(ev){ //取消选中事件

                     }
                     */
                },
                data: [
                    {x:val[0].name,y : val[0].value,attrs : {fill : '#7179cb'}},
                    {x:val[1].name,y : val[1].value,attrs : {fill : '#17c6a3'}},
                    {x:val[2].name,y : val[2].value,attrs : {fill : '#1c86ee'}},
                    {x:val[3].name,y : val[3].value,attrs : {fill : '#00c5cd'}},
                    {x:val[4].name,y : val[4].value,attrs : {fill : '#232141'}},
                    {x:val[5].name,y : val[5].value,attrs : {fill : '#0acb89'}},
                    {x:val[6].name,y:val[6].value,attrs : {fill : '#0c4fcb'}},


                ]
            }]

        });

        chart.render();
    }

</script>
<!-- https://g.alicdn.com/bui/acharts/1.0.29/acharts-min.js -->



<script type="text/javascript">
    var o=  eval("("+'${object}'+")");
    var arra = new Array();
    for(var i in o.datas){
        var a = new Array();
        a[0]=o.datas[i].name;
        a[1]=o.datas[i].value;
        arra[i]=a;
    }
    var chart = new AChart({
        id : 'canvas',
        width : 950,
        height : 500,
        title : {
            text : o.title
        },
        legend : null ,//不显示图例
        seriesOptions : { //设置多个序列共同的属性
            pieCfg : {
                allowPointSelect : true,
                labels : {
                    distance : 40,
                    label : {
                        //文本信息可以在此配置
                    },
                    renderer : function(value,item){ //格式化文本
                        return value + ' ' + (item.point.percent * 100).toFixed(2)  + '%';
                    }
                }
            }
        },
        tooltip : {
            pointRenderer : function(point){
                return (point.percent * 100).toFixed(2)+ '%';
            }
        },
        series : [{
            type: 'pie',
            name: o.title,
            legendType : 'circle', //显示在legend上的图形
            legend : {
                position : 'bottom', //位置
                back : null, //背景清空
                spacingX : 15, //增加x方向间距
                itemCfg : { //子项的配置信息
                    label : {
                        fill : '#999',
                        'text-anchor' : 'start',
                        cursor : 'pointer'
                    }
                }
            },
            events : {
                itemclick : function (ev) {
                    var point = ev.point
                    //item = ev.item, //点击的项
                    console.log(point); //执行一系列操作
                },
                //选中事件
                itemselected : function(ev){
                    console.log(ev.point.xValue + ' selected');
                },
                //取消选中
                itemunselected : function(ev){
                    console.log(ev.point.xValue + ' unselected');
                }
            },
            data: arra
        }]
    });

    chart.render();


</script>

</body>
</html>
