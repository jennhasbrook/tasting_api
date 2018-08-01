/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      user:{}
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};


var WineriesIndex  = {
  template: "#wineries-index",
  data: function() {
    return {
      message: "Wineries index page",
      wineries: {}
    };
  },
  created: function() {
    axios.get("/api/wineries").then(
      function(response){
        this.wineries = response.data;
        console.log(this.wineries);
      }.bind(this))
  },
  methods: {},
  computed: {}
};

var WineryShow = {
  template: "#winery-show",
  data: function() {
    return {
      message: "Winery Show",
      winery: {},
      appt_date: ""
    };
  },
  created: function() {
    axios.get("/api/wineries/" + this.$route.params.id).then(function(response) {
      this.winery = response.data;
      console.log(this.winery);
      }.bind(this));
  },
  methods: {
    submit: function() {
      var params = {
        appt_date: this.appt_date,
        winery_id: this.winery.id

      };
      axios
        .post("/api/appointments", params)
        .then(function(response) {
          console.log(response.data)
          router.push("/users/" + response.data.user_id );
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    
  }
},

  computed: {}
};


var UsersShow = {
  template: "#users-show",
  data: function() {
    return {
      message: "User show page!",
      user: {},
      appt_date: ""
    };
  },
  created: function() {
    axios.get("/api/users/" + this.$route.params.id).then(function(response) {
      this.user = response.data;
      console.log(this.user);
      }.bind(this))

  },
  methods: {
    deleteAppointment: function(appointment) {
      axios.delete("/api/appointments/" + appointment.id).then(function(response) {
        var index = this.user.appointments.indexOf(appointment);
        this.user.appointments.splice(index, 1);
      }.bind(this))
    },

    submit: function(appointment) {
      var params = {
    
        appt_date: this.appt_date
      };
      axios.patch("api/appointments/" + appointment.id, params).then(function(response) {
        var index = this.user.appointments.indexOf(appointment);
        console.log(response.data)
        this.user.appointments[index].appt_date = response.data.appt_date
      }.bind(this))
      .catch(function(error) {
        this.errors = error.response.data.errors;
      }.bind(this));
      },

  },
  computed: {}
};

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
        .post("/api/users", params)
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

var UsersEdit = {
  template: "#users-edit",
  data: function() {
    return {
      message: "User Edit!",
      user: {},
      id: "",
      name: "",
      email: "",
      password: "",
      phone_number: "",
      errors: []
    };
  },
  created: function() {
    axios.get("/api/users/" + this.$route.params.id).then(function(response){
      this.name = response.data.name;
      this.email = response.data.email;
      this.phone_number = response.data.phone_number
      // this.password = response.data.password;
    }.bind(this));
  },
  methods: {
    submit: function() {
      var params = {
        id: this.id,
        name: this.name,
        email: this.email,
        phone_number: this.phone_number
      };
      axios.patch("api/users/" + this.$route.params.id, params).then(function(response) {
        router.push("/users/" + this.$route.params.id);
      }.bind(this))
      .catch(function(error) {
        this.errors = error.response.data.errors;
      }.bind(this));
      },
  
  },
  computed: {}
};


var router = new VueRouter({
  routes: [
  { path: "/", component: HomePage },
  { path: "/wineries", component: WineriesIndex },
  { path: "/wineries/:id", component: WineryShow },
  { path: "/users/:id", component: UsersShow },
  { path: "/signup", component: SignupPage },
  { path: "/login", component: LoginPage },
  { path: "/logout", component: LogoutPage },
  { path: "/users/:id/edit", component: UsersEdit },


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