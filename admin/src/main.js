import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import VueFeather from 'vue-feather';
import ToastPlugin   from 'vue-toast-notification';
// Import one of the available themes
import 'vue-toast-notification/dist/theme-default.css';


const app = createApp(App);
app.component(VueFeather.name, VueFeather)

app.use(router)
app.use(ToastPlugin)

app.mount('#app')

