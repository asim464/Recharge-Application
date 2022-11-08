import { createWebHistory, createRouter } from 'vue-router';
import DashboardApp from './components/Dashboard.vue'
import LoginApp from './components/Login.vue'
import CompanyApp from './components/Company.vue'
import RegistrationApp from './components/Registration.vue'
import AddFleet from './components/AddFleet.vue'
import AssignVehicle from './components/AssignVehicle.vue'
// import PageNotFound from './components/PageNotFound.vue'
import UserManagement from './components/UserManagement.vue'
import RechargeApp from './components/RechargeApp.vue'
import ManageMenu from './components/AssignMenu.vue'
import AddRoles from './components/AddRoles.vue'
import MenuManagement from './components/MenuManagement.vue'
import ComplaintApp from '@/components/Complaint.vue'
import BackendApp from '@/components/BackendApp.vue'
import MtagApp from '@/components/MtagRegister.vue'

const routes = [
	{
		path: '/',
		name: 'login',
		component: LoginApp,
		meta: {
			hideNavbar: true,
			auth: false,
		},

	},

	{
		path: "/dashboard",
		component: BackendApp,
		meta: {
			auth: true,
		},
		beforeEnter: (to, next) => {
			if (
				to.meta.auth &&
				localStorage.getItem('token') != null
			) {
				next
			}
			else {
				router.push('/')
			}
		},
		children: [
			{
				path: '/dashboard',
				name: 'dashboard',
				component: DashboardApp
			},
			{
				path: '/company',
				name: 'company',
				component: CompanyApp
			},
			{
				path: '/register',
				name: 'register',
				component: RegistrationApp
			},
			{
				path: '/fleets',
				name: 'AddFleet',
				component: AddFleet
			},
			{
				path: '/vehicle',
				name: 'AssignVehicle',
				component: AssignVehicle		
			},
			{
				path: '/usermanagement',
				name: 'UserManagement',
				component: UserManagement
			},
		
			{
				path: '/recharge',
				name: 'RechargeApp',
				component: RechargeApp		
			},
		
			{
				path: '/menu_manage',
				name: 'ManageMenu',
				component: ManageMenu		
			},
			{
				path: '/add_roles',
				name: 'AddRoles',
				component: AddRoles
			},
			{
				path: '/management',
				name: 'MenuManagement',
				component: MenuManagement
			},
			{
				path: '/complaint',
				name: 'Complaint',
				component: ComplaintApp
			},
			{
				path: '/Mtag',
				name: 'Mtag',
				component: MtagApp
			},
		],
	},
	
	// {
	// 	path: '/:pathMatch(.*)*',
	// 	name: 'PageNotFound',
	// 	component: PageNotFound,
	// 	meta:{
	// 		hideNavbar:true
	// 	}
	// },
	// { 
	// 	path: "*",
	// 	name:'PageNotFound',
	// 	component: PageNotFound,
	// 	meta:{
	// 		auth:false,
	// 		hideNavbar:true
	// 	}
	// },
	// { 
	// 	path: "*", 
	// 	redirect: "/" 
	// },
];

const router = createRouter({
	history: createWebHistory(),
	routes,
});

export default router;
