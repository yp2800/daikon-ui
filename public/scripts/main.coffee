module = angular.module 'daikon',[
  'ngRoute',
  'ngSanitize',
  'ngAnimate',
  'ngResource',
  'ui.bootstrap',
  'ui.grid',
  'angular.filter',
  'tableSort',
  'jsonFormatter',
  'angularMoment',
  'angular-loading-bar',
  'isteven-multi-select',
]

module.constant 'config',
  etcd: "etcd2/v2/keys"
  grafana: "grafana/"

module.filter 'secondsAgo', ->
  (input)->
    d = new Date(input)
    d = (new Date()).valueOf() - d.valueOf()
    return "#{Math.ceil(d/1000)}S ago"

module.config ($routeProvider,$locationProvider,$sceProvider)->
  $sceProvider.enabled false
  $locationProvider.html5Mode true
  $routeProvider
  .when '/env/list',
    templateUrl: 'public/templates/env-list.html'
    controller: 'EnvListCtrl'
  .when '/env/:env',
    templateUrl: 'public/templates/env-info.html'
    controller: 'EnvInfoCtrl'
  .when '/app/list',
    templateUrl: 'public/templates/app-list.html'
    controller: 'AppListCtrl'
  .when '/app/:env/:app',
    templateUrl: 'public/templates/app-info.html'
    controller: 'AppInfoCtrl'
  .when '/app/create',
    templateUrl: 'public/templates/app-create.html'
    controller: 'AppCreateCtrl'
  .when '/instance/list',
    templateUrl: 'public/templates/instance-list.html'
    controller: 'InstanceListCtrl'
  .when '/instance/:id',
    templateUrl: 'public/templates/instance-info.html'
    controller: 'InstanceInfoCtrl'
  .when '/server/list',
    templateUrl: 'public/templates/server-list.html'
    controller: 'ServerListCtrl'
  .when '/server/:name',
    templateUrl: 'public/templates/server-info.html'
    controller: 'ServerInfoCtrl'
  .when '/home',
    templateUrl: 'public/templates/home.html'
    controller: 'HomeCtrl'
  .otherwise redirectTo: '/home'

