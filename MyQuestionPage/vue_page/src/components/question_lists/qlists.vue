<template>
	<div>

		<div style="position: fixed;left: 5%;z-index: 99;">
			<el-button type="success" @click="add_new_question">Add your Question</el-button>
		</div>
		<br>
		<br>

		<!-- 搜索框 -->
		<!-- 		<div style="margin-right: -50%;margin-bottom: 1%;">
			<el-input placeholder="搜索你的问题" style='width: 300px;' clearable=""></el-input>
			<el-button type="primary" icon="el-icon-search"></el-button>
		</div> -->

		<div style="margin: 0 auto;width: 90%;">
			<el-table :data="tableData" style="width: 100%" border stripe size='large' @cell-click="select_cell">
				<el-table-column label="ID" width="40" type="index" align="center" fixed="left">
				</el-table-column>

				<!-- 				<el-table-column prop="question_title" label="问题" min-width="400" fixed="left" sortable>
					<template slot-scope="scope">
						<el-popover trigger="hover" placement="top">
							<p>姓名</p>
							<p>住址</p>
							<div slot="reference" class="name-wrapper">
								{{ scope.row.question_title}}
							</div>
						</el-popover>
					</template>
				</el-table-column> -->



				<el-table-column label="问题" min-width="400" fixed="left" sortable>
					<div slot-scope="scope">
						{{ scope.row.question_title}} <a :href='scope.row.source'><i class='el-icon-link' v-if='scope.row.source'></i></a>
					</div>
				</el-table-column>
				<el-table-column prop="create_time" label="创建时间" min-width="110" align="center" sortable>
				</el-table-column>
				<el-table-column prop="update_time" label="更新时间" min-width="160" align="center" sortable>
				</el-table-column>
				<el-table-column prop="frequency" label="回答次数" min-width="80" align="center" fixed="right" sortable>
				</el-table-column>
				<el-table-column prop="q_id" v-if="false">
				</el-table-column>
			</el-table>
		</div>

		<!-- 分页 -->

		<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" :current-page="currentPage" :page-sizes="page_sizes" :page-size='page_size' layout="total, sizes, prev, pager, next" :total="total_qs">
		</el-pagination>


		<!-- 抽屉 -->
		<div>
			<el-drawer title="My Answer" :visible.sync="drawer" :direction="direction" :before-close="handleClose" size='50%'>

				<div style="width: 90%;text-align: left;margin: -20px auto 0;">
					<h1>Q: {{ drawer_title }}
						<el-button icon="el-icon-plus" type="success" style="float: right;" @click='add_new_comment="true"'></el-button>
					</h1>
					<el-card v-if='add_new_comment'>
						<div style="text-align: left;">

							<el-input type="textarea" :autosize="{ minRows: 10, maxRows: 20}" placeholder="请输入内容" v-model="textarea2">
							</el-input>
							<el-button type="success" style="display: inline-block;" @click='add_new_answer'>提交</el-button>


						</div>

					</el-card>
				</div>

				<div v-for='(i,index) in answer_data' :key='i' style="width: 90%;margin: 20px auto;overflow-y: scroll;">

					<el-card class="box-card">
						<el-divider content-position="left">{{i.update_time}}</el-divider>
						<!-- <h4 style="text-align: left;margin-top: 0px;">2020-02-02</h4> -->
						<div style="text-align: left;">
							{{index+1}}. {{i.answer}}
						</div>

					</el-card>
				</div>

				<el-button icon="el-icon-receiving" type="info" size='medium' style="margin: 20px;position:relative;left: -35%;" disabled>归档</el-button>


			</el-drawer>
		</div>
	</div>
</template>

<script>
	export default {
		data() {
			return {
				drawer: false,
				direction: 'rtl',
				drawer_title: '',
				onpage: true,
				add_new_comment: false,
				textarea2: '',
				tableData: '',
				address: '',
				base_url: 'http://10.0.0.6:9999/',
				get_all_q_url: 'http://10.0.0.6:9999/get_all_q',
				t_id: '',
				answer_data: '',
				page: '',
				page_sizes: [5,10,15,20,50,100],
				page_size: 20,
				total_qs: 99, //sql count all questions
				currentPage: 1,
				new_question: '',
				new_q_source:'',
			}
		},
		mounted() {
			this.get_data(),
			this.get_all_data_count()
		},
		methods: {
			handleSizeChange: function(val) {
				this.page_size = val
				this.get_data()
			},
			
			handleCurrentChange: function(page) {//点击分页的页面
				// console.log(page)
				this.currentPage = page
				this.get_data()
			},

			get_all_data_count: function() {//从后端获得问题总数
				let _this = this
				this.axios({
					method: 'get',
					url: this.base_url + 'get_all_q_c/' // get请求没有data:{}
				}).then(function(response) { //这个then是发送完请求之后要执行的函数，回调函数
					// console.log(response.data)
					_this.total_qs = response.data
				});
			},

			get_data: function() { //从后端获取数据根据页面和显示数量
				let _this = this
				this.axios({
					method: 'get',
					url: this.base_url + 'get_all_q', //+ this.hello, // get请求没有
					params: {
						page: _this.currentPage,
						size: _this.page_size
					}
				}).then(function(response) { //这个then是发送完请求之后要执行的函数，回调函数
					console.log(response.data)
					_this.tableData = response.data
				});
			},
			
			add_question: function() { //向后端添加问题
				let _this = this
				this.axios({
					method: 'post',
					url: this.base_url + 'add_new_question', //+ this.hello, // get请求没有
					data: {
						content: _this.new_question,
						source: _this.new_q_source
					}
				}).then(function(response) { //这个then是发送完请求之后要执行的函数，回调函数
					console.log(response.data)
					// console.log(_this.fastapi_r)
					_this.textarea2 = ''
					_this.get_all_data_count()
					_this.currentPage = Math.ceil(_this.total_qs/_this.page_size) // 根据所有问题数量计算，返回最后一页
					_this.get_data()
				});
			},

			add_new_question: function() { //从弹出框添加新的问题
				this.$prompt('请输问题', '提示', {
					confirmButtonText: '确定',
					cancelButtonText: '取消',
					// inputPattern: /[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?/,
					// inputErrorMessage: '邮箱格式不正确'
				}).then(({
					value
				}) => {
					this.$message({
							type: 'success',
							message: '新增问题: ' + value
						},
						console.log(value),
						this.new_question = value,
						this.add_question(),
					);
				}).catch(() => {
					this.$message({
						type: 'info',
						message: '取消输入'
					});
				});
			},

			add_new_answer: function() { //点击按钮添加新的问题
				// console.log('done');
				this.answer_data = this.textarea2;
				this.add_answer()
				this.add_new_comment = false;
				this.$notify.success({
					title: '新的评论',
					message: '数据已更新',
					position: 'bottom-left'
				});
				// this.get_data() // 仅仅更新主页目前的内容，是否还需要传参数？
				// this.get_answer(this.t_id)
			},

			add_answer: function() { //向后端添加答案
				let _this = this
				console.log(_this.t_id)
				this.axios({
					method: 'post',
					url: this.base_url + 'add_new_answer/', //+ this.hello, // get请求没有
					data: {
						q_id: _this.t_id,
						answer: _this.answer_data
					}
				}).then(function(response) { //这个then是发送完请求之后要执行的函数，回调函数
					console.log(response.data)
					// console.log(_this.fastapi_r)
					_this.textarea2 = ''
					_this.get_answer(_this.t_id)
					_this.get_data()
				});
			},

			get_answer: function(q_id) { //从后端获得答案列表
				let _this = this
				console.log(q_id)
				this.axios({
					method: 'get',
					url: this.base_url + 'get_answer/' + q_id, //+ this.hello, // get请求没有data:{}
				}).then(function(response) { //这个then是发送完请求之后要执行的函数，回调函数
					console.log(response.data)
					// console.log(_this.fastapi_r)
					_this.answer_data = response.data
				});
			},

			select_cell: function(cell) {//单元格选择反馈
				console.log(cell.id)
				this.t_id = cell.id
				this.drawer_title = cell.question_title
				this.get_answer(cell.id)
				this.drawer = true
				this.$notify.info({
					title: cell.id,
					message: cell.question_title,
					position: 'top-left'
				});
			},


		}
	}
</script>

<style>
	.el-drawer.rtl {
		overflow: scroll;
	}
</style>
