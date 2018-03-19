function reorder(event) {
  var container = event.target.closest('[data-reorderable]');
  var target = event.target.closest('[draggable]');
  var data = event.dataTransfer.getData("text");
  var index = Array.from(container.children).indexOf(target) + 1;
  var url = container.getAttribute("data-reorderable");
  reorder_requset(url, data, index);
}

function reorder_requset(url, data, index) {
  data = data.split('-');
  Rails.ajax({
    data: '&['+ data[0] +']position=' + index,
    url: url + '/' + data[1],
    type: 'PATCH',
  })
}

function allowDrop(event) {
  event.preventDefault();
}

function setData(event) {
  event.dataTransfer.setData("text", event.target.id);
}

function makeReorderable() {
  if (node = document.querySelector('[data-reorderable]')) {
    node.addEventListener("dragstart", setData);
    node.addEventListener("dragover", allowDrop);
    node.addEventListener("drop", reorder);
  }
}

document.addEventListener("turbolinks:load", makeReorderable)
