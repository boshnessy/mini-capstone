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
var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/v4/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var PracticePage = {
  template: "#practice-page",
  data: function() {
    return {
      message: "Welcome to Vue.js in the practice page!",
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};
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
  routes: [
    { path: "/", component: HomePage }, 
    { path: "/practice", component: PracticePage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});
