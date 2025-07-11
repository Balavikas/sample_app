/// Menu manipulation
// Add toggle listeners to listen for clicks.
function addToggleListenerEvent(selectedId, menuId, css_class) {
  let selector = document.querySelector(`#${selectedId}`);
  selector.addEventListener('click', (event) => {
    event.preventDefault();
    let menu = document.querySelector(`#${menuId}`);
    menu.classList.toggle(css_class);
  });
}

document.addEventListener("turbo:load", function() {
  addToggleListenerEvent("account", "dropdown-menu", "active");
  addToggleListenerEvent("hamburger", "navbar-menu", "collapse");
})