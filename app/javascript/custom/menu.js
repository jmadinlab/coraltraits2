// Menu manipulation

// Add toggle listeners to listen for clicks.
document.addEventListener("turbo:load", function() {
  let hamburger = document.querySelector("#hamburger");
  hamburger.addEventListener("click", function(event) {
    event.preventDefault();
    let menu = document.querySelector("#navbar-menu");
    menu.classList.toggle("collapse");
  });

  let data = document.querySelector("#data");
  data.addEventListener("click", function(event) {
    event.preventDefault();
    let menu = document.querySelector("#dropdown-data")
    menu.classList.toggle("active");
  });

  let about = document.querySelector("#about");
  about.addEventListener("click", function(event) {
    event.preventDefault();
    let menu = document.querySelector("#dropdown-about")
    menu.classList.toggle("active");
  });

  let account = document.querySelector("#account");
  account.addEventListener("click", function(event) {
    event.preventDefault();
    let menu = document.querySelector("#dropdown-account")
    menu.classList.toggle("active");
  });



});

document.addEventListener("turbo:load", function() {
  let method = document.querySelector("#method");
  method.addEventListener("click", function(event) {
    event.preventDefault();
    let menu = document.querySelector("#myDIV");
    menu.classList.toggle("collapse");
  });
});


document.addEventListener("turbo:load", function() {

  document.querySelectorAll("#countlist p").forEach(function(el) {  // loop through each user
    var pubcount = el.querySelector(".pubcount");  // get the record count element
    var pricount = el.querySelector(".pricount");  // get the record count element
    var model1 = pubcount.dataset.model1;   // get the user id data param
    var itemid1 = pubcount.dataset.itemid1;   // get the user id data param
    var model2 = pubcount.dataset.model2;   // get the user id data param
    var itemid2 = pubcount.dataset.itemid2;   // get the user id data param

    var class1 = pubcount.dataset.class1;   // get the user id data param

    if (model2) {
      fetch( "/observations/count/"+model1+"/"+itemid1+"/"+model2+"/"+itemid2 )
        .then(response => response.json())
        .then(function(data) {
          console.log(data);
          pubcount.innerHTML = data.pub;   // change the content of the span to the count
          pricount.innerHTML = data.pri;   // change the content of the span to the count
      });
    } else {
      if (class1) {
        fetch( "/observations/count/"+model1+"/"+itemid1+"/"+class1 )
          .then(response => response.json())
          .then(function(data) {
            console.log(data);
            pubcount.innerHTML = data.pub;   // change the content of the span to the count
            pricount.innerHTML = data.pri;   // change the content of the span to the count
        });
      } else {
        fetch( "/observations/count/"+model1+"/"+itemid1 )
          .then(response => response.json())
          .then(function(data) {
            console.log(data);
            pubcount.innerHTML = data.pub;   // change the content of the span to the count
            pricount.innerHTML = data.pri;   // change the content of the span to the count
        });
      }
    }
  });
});
