# <a href="http://47.93.184.160:8082/ds-api/bc/project/projects" target="_blank">ds-api</a>
<a href="http://47.93.184.160:8082/ds-api/bc/project/projects">查看demo</a>
自动化接口生成管理系统

在你写代码调代码的时候自动生成接口的地址，请求，结果等信息

接口项目，ds-api可添加多个项目，项目管理可看到所有的项目列表
项目详情-可查看当前项目的详细信息集项目所对应的模块
![](https://github.com/syifeng/ysf-api/blob/master/img/img-6.png)


接口模块列表，展示所有模块【所有项目】的模块信息
模块详情-可查看模块下所有的接口列表
![](https://github.com/syifeng/ysf-api/blob/master/img/img-7.png)


请求参数预览，强转成json 的requestParameterMap，待后期做细化解析
![](https://github.com/syifeng/ysf-api/blob/master/img/img-5.png)

请求参数预览，由于请求参数集为<String,String[]> 类型的map，解析参数全部为String
另外，对于请求参数为requestBody为json数据格式的参数暂不支持解析
![](https://github.com/syifeng/ysf-api/blob/master/img/img-4.png)
接口结果的json结果数据预览
![](https://github.com/syifeng/ysf-api/blob/master/img/img-3.png)

接口结果参数，对接口返回的json数据进行解析并获得对应jSONObject的详细key-value及类型，层级，上级等信息
![](https://github.com/syifeng/ysf-api/blob/master/img/img-1.png)







