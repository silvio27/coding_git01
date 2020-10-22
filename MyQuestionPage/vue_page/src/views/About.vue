<template>
	<div class="about">
		<div style="border: #122B40 solid 1px;">
			<TimeLine></TimeLine>

			<h1 v-if="showtest">ueoa</h1>


			<h1>写死的内容</h1>
			<h1>{{ fastapi_r.message }}</h1>
		</div>
		<el-button type="primary" @click='test_click'>el-button</el-button>

	</div>
</template>
<style>

</style>

<script>
	import TimeLine from '../components/TimLine_Part1.vue'

	export default {
		components: {
			TimeLine,
		},
		data() {
			return {
				name: 'about',
				address: 'http://10.0.0.18:9999/b',
				hello: 'hello',
				fastapi_r: '',
				showtest: false,

			}
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
					url: this.address, //+ this.hello, // get请求没有data:{}

				}).then(function(response) { //这个then是发送完请求之后要执行的函数，回调函数
					console.log(response.data)
					// console.log(_this.fastapi_r)
					_this.fastapi_r = response.data
				});
			}
		},
	}
</script>
