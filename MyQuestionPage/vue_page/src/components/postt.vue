<template>
	<div>
		<div style="width: 300px;">
			<el-input v-model="id" placeholder="input id" ></el-input>
		</div>
		<div style="width: 300px;">
			<el-input v-model="title" placeholder="input title"></el-input>
		</div>
		
		
		<el-button @click='pppp'>click</el-button>

	</div>

</template>

<script>
	export default {
		data() {
			return {
				id: 3,
				title: 'uee',
				base_url: 'http://10.0.0.6:9999'
			}
		},
		mounted() {

		},
		methods: {
			handleCurrentChange: function(page) {
				console.log(page)
				this.currentPage = page
				this.get_data(this.currentPage + '-' + this.page_size)
			},
			pppp: function() {
				let _this = this
				this.axios({
					method:'post',
					url: this.base_url + '/post',
					data: {
						id: _this.id,
						title: _this.title
					}
				}).then(function(response) { //这个then是发送完请求之后要执行的函数，回调函数
					console.log(response.data)
					// console.log(_this.fastapi_r)
					_this.title = ''
				}).catch(function(error) {
					console.log(error)
				});
			},
		}
	}
</script>

<style>
</style>
