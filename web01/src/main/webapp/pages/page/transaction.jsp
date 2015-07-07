<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="${ROOT_PATH }/public/style/reset.css" />
		<link rel="stylesheet" href="${ROOT_PATH }/public/style/common.css" />
		<link rel="stylesheet" href="${ROOT_PATH }/public/style/style.css" />
		<script type="text/javascript" src="${ROOT_PATH }/public/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="${ROOT_PATH }/public/DatePicker/WdatePicker.js"></script>
		<title>使用说明</title>
	</head>
	<body>
		<form action="" id="dataForm">
			<input name="user.id" type="hidden" value="${id}"/>
			<div class="container">
				<div class="content">
					<h4 class="contentNav upload">
						<a class="backup" href="${ROOT_PATH }/">&lt;&lt;返回</a>使用说明
					</h4>
					<ul class="detailBox checkDetail uploadBox">
						<li>
							印象笔记：Spring异常抛出触发事务回滚策略 - 黑。 - ITeye技术网站
						</li>
						<li>
							制造RuntimeException,在spring默认的异常回滚策略下，该异常的抛出会触发事务的回滚,数据不会被插入;<br/>
							throw new RuntimeException("抛出个运行时异常");  
						</li>
						<li>
							同样是unchecked exception，spring默认的异常回滚策略下Error的抛出也会触发事务的回滚，数据不会被插入;<br/>
							throw new Error(); 
						</li>
						<li>
							 即使是在spring默认的异常触发事务回滚策略（unchecked exception触发回滚）下， <br/>
							如果使用try-catch捕获抛出的unchecked异常后没有在catch块中采用页面硬编码的方式使用spring api对事务做显式的回滚，则事务不会回滚，数据被插入 <br/>
							“将异常捕获,并且在catch块中不对事务做显式提交=生吞掉异常” <br/>
							try {  <br/>
								throw new RuntimeException("这个抛出的运行时异常会被try-catch捕获");  <br/>
							} catch(Exception e) {  <br/>
								System.out.println("捕获到异常： " + e.getMessage());  <br/>
							}<br/>
						</li>
						<li>
							因为Exception类是个checked exception，所以这里抛出的异常不会触发事务的回滚，数据被插入 <br/>
							throw new Exception("a Exception instance");  <br/>
							该BaseException继承自Exception，也为checked exception，抛出它后: <br/>
							spring默认的回滚策略下，事务未回滚， 数据被插入； <br/>
							在TransactionProxyFactoryBean的transactionAttributes中配置 <br/>
							&lt;prop key="test*"&gt; <br/>
								... ...,-BaseException <br/>
							&lt;/prop&gt;后，事务回滚，数据未被插入 <br/>
							throw new BaseException("一个BaseException");  <br/>
						</li>
						<li style="color: red;">
							所以，实际项目中一般事务处理在service层，那么dao和service层异常全部直接抛出，在action层进行捕获处理，
							但是如果一旦在dao或者service有异常，使用try catch后，这段代码异常事务不会回滚；<br/>
							一旦使用finally  return信息，直接认为成功结束，事务无效，
							但是很多项目事务直接在action的话，存在try catch，提示错误信息，那么事务其实已经无效；<br/>
							相应补救办法：cfp2p-&gt;MyExceptionHandler，进行方法处理完，进行捕获异常，添加相应返回值。
						</li>
					</ul>
				</div>
			</div>
		</form>
	</body>
</html>