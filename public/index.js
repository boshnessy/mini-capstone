// var productTemplate = document.querySelector('#product-card');
// var productContainer = document.querySelector('.row');

// // productContainer.appendChild(productTemplate.content.cloneNode(true));

// /* global axios */
// axios.get("http://localhost:3000/v4/products").then(function(response) {
//   console.log(response.data);
//   var products = response.data;
//   for (var i = 0; i < products.length; i++) {
//     var productClone = productTemplate.content.cloneNode(true);
//     productClone.querySelector('.card-title').innerText = products[i].name;
//     productClone.querySelector('.price').innerText = products[i].price;
//     productClone.querySelector('.description').innerText = products[i].description;
//     productClone.querySelector('.image-url').src = products[i].images.url;
//     productContainer.appendChild(productClone);
//   }
// });

/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      products: []
    };
  },
  created: function() {
    axios.get("/v4/products").then(function(response) {
      this.products = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var router = new VueRouter({
  routes: [{ path: "/", component: HomePage }],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
});
