function fetchData(event) {
  var url = event.target.getAttribute("data-datalist")
  var list = event.target.getAttribute("list")
  console.log(url, list)
}

function makeDatalist() {
  if (node = document.querySelector('[data-datalist]')) {
    node.addEventListener("keyup", fetchData);
  }
}

document.addEventListener("turbolinks:load", makeDatalist)
