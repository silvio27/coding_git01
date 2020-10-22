<template>
	<div id="app">
		<!-- <HelloWorld msg="Welcome to Your Vue.js App" /> -->
		<!-- <about></about> -->
		<!-- <pic_list></pic_list> -->
		<questionlists></questionlists>
		<!-- <a href="https://ibb.co/FJRBgjd"><img src="https://i.ibb.co/ZKqhWkb/IQ-test-135.png" alt="IQ-test-135" border="0" /></a> -->
		<!-- <a href="https://sm.ms/image/6FXjnPgTo4IfxSD" target="_blank"><img src="https://i.loli.net/2020/10/13/6FXjnPgTo4IfxSD.png" alt="abc1.png" width="30%"></a> -->

		<!-- <mytable></mytable> -->
<!-- 		<postt></postt> -->
		
	</div>
</template>

<script>
	// import HelloWorld from './components/HelloWorld.vue'
	// import about from './views/About.vue'
	// import pic_list from './components/pic_list.vue'
	// import mytable from './components/table.vue'
	import questionlists from './components/question_lists/qlists.vue'
	// import postt from './components/postt.vue'

	

	export default {
		name: 'app',
		components: {
			// HelloWorld
			// about,
			// pic_list
			// mytable
			questionlists,
			// postt,

		}
	}
</script>

<style>
	#app {
		font-family: 'Avenir', Helvetica, Arial, sans-serif;
		-webkit-font-smoothing: antialiased;
		-moz-osx-font-smoothing: grayscale;
		text-align: center;
		color: #2c3e50;
		margin-top: 60px;
	}
</style>
