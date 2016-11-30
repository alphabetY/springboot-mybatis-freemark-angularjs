
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>ECharts</title>
</head>
<body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="height:400px"></div>
    <!-- ECharts单文件引入 -->
    <script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
    <script type="text/javascript">
        // 路径配置
        require.config({
            paths: {
                echarts: 'http://echarts.baidu.com/build/dist'
            }
        });
        
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/radar' // 使用柱状图就加载bar模块，按需加载
            ],
            
         function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main')); 
                
                var 

                option = {
                    title : {
                        text: '预算 vs 开销（Budget vs spending）',
                        subtext: '纯属虚构'
                    },
                    tooltip : {
                        trigger: 'axis'
                    },
                    legend: {
                        orient : 'vertical',
                        x : 'right',
                        y : 'bottom',
                        data:['预算分配（Allocated Budget）','实际开销（Actual Spending）']
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    polar : [
                       {
                           indicator : [
                               { text: '销售（sales）', max: 6000},
                               { text: '管理（Administration）', max: 16000},
                               { text: '信息技术（Information Techology）', max: 30000},
                               { text: '客服（Customer Support）', max: 38000},
                               { text: '研发（Development）', max: 52000},
                               { text: '市场（Marketing）', max: 25000}
                            ]
                        }
                    ],
                    calculable : true,
                    series : [
                        {
                            name: '预算 vs 开销（Budget vs spending）',
                            type: 'radar',
                            data : [
                                {
                                    value : [4300, 10000, 28000, 35000, 50000, 19000],
                                    name : '预算分配（Allocated Budget）'
                                },
                                 {
                                    value : [5000, 14000, 28000, 31000, 42000, 21000],
                                    name : '实际开销（Actual Spending）'
                                }
                            ]
                        }
                    ]
                };
                                    
                	                    
                // 为echarts对象加载数据 
                myChart.setOption(option); 
            }
        );
    </script>
     <script type="text/javascript">  
        function getChartData() {  
            //获得图表的options对象  
            var options = myChart.getOption();  
            //通过Ajax获取数据  
            $.ajax({  
                type : "post",  
                async : false, //同步执行  
                url : "${pageContext.request.contextPath}/echarts/line_data",  
                data : {},  
                dataType : "json", //返回数据形式为json  
                success : function(result) {  
                    if (result) {  
                       // options.legend.data = result.legend;  
                       // options.xAxis[0].data = result.category;  
                        options.series[0].data[0].value = result.series[0].value;  
                        options.series[0].data[1].value = result.series[1].value;
                        myChart.hideLoading();  
                        myChart.setOption(options);  
                    }  
                },  
                error : function(errorMsg) {  
                    alert("图表请求数据失败啦!");  
                    myChart.hideLoading();  
                }  
            });  
        }  
    </script>  
    
    
    
    
</body>