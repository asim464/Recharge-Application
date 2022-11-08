export default [
  {
    path: '/fleet-management',
    name: 'fleet-management',
    component: () => import('@/views/pages/application/FleetManagement.vue'),    
  },
  {
    path: '/add-company',
    name: 'add-company',
    component: () => import('@/views/pages/application/AddCompany.vue'),    
  },
  {
    path: '/error-404',
    name: 'error-404',
    component: () => import('@/views/error/Error404.vue'),
    meta: {
      layout: 'full',
      resource: 'Auth',
      action: 'read',
    },
  },
  {
    path: '/login',
    name: 'auth-login',
    component: () => import('@/views/pages/authentication/Login.vue'),
    meta: {
      layout: 'full',
      resource: 'Auth',
      redirectIfLoggedIn: true,
    },
  },  
  {
    path: '/assign_vehicles',
    name: 'assign_vehicles',
    component: () => import('@/views/pages/application/AddCompany.vue'),    
  },
  
]
