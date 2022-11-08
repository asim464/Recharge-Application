export default [
  {
    title: 'Dashbaord',
    route: 'dashboard-ecommerce',
    icon: 'HomeIcon',
  },
  {
    title: 'Registration',
    route: 'vehicle-registration',
    icon: 'FileTextIcon',
  },
  {
    title: 'Add Company',
    route: 'add-company',
    icon: 'CopyIcon',
  },
  {
    title: 'Fleet Management',
    icon: 'PieChartIcon',                 
    children: [
      {
        title: 'Add Fleet',
        route: 'fleet-management',          
      },
      {
        title: 'Assign Vehicle',
        route: 'assign_vehicles',          
      },
    ]
  },
]
