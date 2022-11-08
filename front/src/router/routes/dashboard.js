export default [
  {
    path: '/vehicleRegistration',
    name: 'vehicle-registration',
    component: () => import('@/views/pages/application/RegistrationManagement.vue'),
  },
  {
    path: '/dashboard',
    name: 'dashboard-ecommerce',
    component: () => import('@/views/dashboard/ecommerce/Ecommerce.vue'),
  },
]
