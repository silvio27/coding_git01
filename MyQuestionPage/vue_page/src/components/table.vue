<template>
	<div>
		<el-input placeholder="input name you wanna search" style="width: 300px;" v-model="keyword" @change="get_raw_data(keyword)" clearable=""></el-input>
		<el-button icon="el-icon-search" type="primary" @click='get_raw_data(keyword)'></el-button>
		<div style="border: #101010 solid 0px;margin: 0 auto;width: 80%;">
			<el-table :data="tableData" style="width: 100%" stripe border max-height="800" :default-sort="{prop: 'birthday', order: 'ascending'}">
				<el-table-column type="selection" width="40" align="center">
				</el-table-column>
				<el-table-column type="index" fixed='left' align="center" label="排序" width="60">
				</el-table-column>
				<el-table-column prop="name" label="姓名" width="100" fixed="left" sortable align="center">
				</el-table-column>
				<el-table-column prop="gender" label="性别" width="80" sortable align="center">
				</el-table-column>
				<el-table-column prop="birthday" label="生日" width="100" sortable align="center">
				</el-table-column>
				<el-table-column prop="telephone" label="电话" width="120" sortable align="center">
				</el-table-column>
				<el-table-column prop="address" label="地址" sortable>
				</el-table-column>
				<el-table-column prop="id" label="id" width="180"  sortable>
				</el-table-column>
			</el-table>
		</div>
	</div>

</template>

<script>
	export default {
		data() {
			return {
				tableData: '',
				keyword: '李'
			}
		},
		mounted() {
			this.get_raw_data(this.keyword)
		},
		methods: {

			get_raw_data: function(a) { //这是发送ajax的方法
				let _this = this
				// if ( !this.keyword){
				// 	a = ''
				// }

				this.axios({
					method: 'get',
					url: 'http://10.0.0.6:9999/std_info/' + a, //+ this.hello, // get请求没有data:{}

				}).then(function(response) { //这个then是发送完请求之后要执行的函数，回调函数
					// console.log(this.url)
					// console.log(response.data)
					// console.log(_this.fastapi_r)
					_this.tableData = response.data
				});
			},
			formatter(row) {
				return row.address;
			},
		},
	}
</script>

<style>
</style>
