<!-- eslint-disable -->


<template>
	<div>
		Timeline
		<div style="text-align: left;width: 90%;">
			<el-timeline :reverse="reverse">
				<el-timeline-item v-for="(activity, index) in activities" :key="index" :icon="activity.icon" :type="activity.type"
				 :color="activity.color" :size="activity.size" :timestamp="activity.timestamp" placement='top'>
					{{activity.content}}
					<br>
					<!-- <img :src="url1"> -->
					<img :src="activity.url" alt="" width="200px">
					<!-- <img :src=require(url1) alt="" width="100%"> -->
				</el-timeline-item>
			</el-timeline>

		</div>







	</div>
</template>

<script>
	export default {
		data() {
			return {
				reverse: true,
				activities: '',
				url1: require('../assets/logo.png')
			};
		},
		created() {
			this.registfn()
		},
		methods: {
			test_click() {
				this.$message('ueoa');
				this.showtest = true;
			},
			registfn: function() { //这是发送ajax的方法
				let _this = this
				this.axios({
					method: 'get',
					url: 'http://10.0.0.18:9999/timeline', //+ this.hello, // get请求没有data:{}

				}).then(function(response) { //这个then是发送完请求之后要执行的函数，回调函数
					console.log(response.data)
					// console.log(_this.fastapi_r)
					_this.activities = response.data
				});
			}
		},
	};
</script>

<style>
</style>
