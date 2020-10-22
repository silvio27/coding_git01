<template>
	<div style="display: inline-block;">
		<div v-for='(item,index) in raw_data' :key='item' style="display: inline-block;width: 400px;margin: 10px auto;padding: 0px 20px 20px 20px;">
			<el-card>
				<p>{{ index }}{{ item.name }}</p>
				<el-image style="width: 100%; border-radius: 10px;" :src='item.url' fit="cover"></el-image>
				<!-- <iframe :src="item.url" frameborder="0" allowtransparency="yes" allowfullscreen></iframe> -->
				<!-- <video :src="item.url" controls autoplay ></video> -->
			</el-card>
		</div>
	</div>
</template>

<script>
	export default {
		data() {
			return {
				raw_data: '',
			};
		},
		created() {
			this.get_raw_data()
		},
		methods: {

			get_raw_data: function() { //这是发送ajax的方法
				let _this = this
				this.axios({
					method: 'get',
					url: 'http://10.0.0.18:9999/timeline1', //+ this.hello, // get请求没有data:{}

				}).then(function(response) { //这个then是发送完请求之后要执行的函数，回调函数
					console.log(response.data)
					// console.log(_this.fastapi_r)
					_this.raw_data = response.data
				});
			}
		},
	};
</script>

<style>
</style>
