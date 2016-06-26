
window.onload = function() {

// the following code adds event listeners to the buttons
// you'll learn more about this later
// for this exercise, you are going to write the functions for
// what happens when the user clicks on the buttons.
  var saveButton = document.getElementById('save-button');
  saveButton.addEventListener('click', addToDoItem, false);

  var doneButton = document.getElementById('done-button');
  doneButton.addEventListener('click', markAsDone, false);


  function addToDoItem() {
    //Get value of the form as text
    var input = document.getElementById("todo-input").value;
    //Create li element
    var listItem = document.createElement('li');
    //Add text to the li item
    listItem.textContent = input;
    //Get the parent element (ul) of the to do list
    var toDoList = Array.prototype.slice.call(document.getElementsByClassName("todo-list-items"))[0];
    //Add the new item to bottom of the list
    toDoList.insertBefore(listItem, toDoList.firstElementChild.nextSibbling);
    //Reset form value to empty
    document.getElementById("todo-input").value = "";

  }

  function markAsDone() {
    doneButton.classList.add('liked');
    doneButton.innerHTML = "Liked!";
    document.querySelector('h1').style.color = "red";
    
    //Get the first list item (as a li element)
    var toDoListItem = Array.prototype.slice.call(document.getElementsByClassName("todo-list-items"))[0].children[1];
    //Set the class of the li element to done
    toDoListItem.classList.add('done');
    //Get the parent element from the li of the done list
    var doneList = Array.prototype.slice.call(document.getElementsByClassName("done-list-items"))[0]
    //Add the list item that is finished to the done list
    doneList.insertBefore(toDoListItem,doneList.firstElementChild.nextSibbling);
    
  }
  
}
