import Trix from "trix"

Trix.config.textAttributes.textColour = {
	styleProperty: "color",
  inheritable: true
 }
Trix.config.textAttributes.underline = {
  style: { "textDecoration": "underline" },
  inheritable: true,
  parser: function(element) {
    return element.style.textDecoration === "underline"
  }
}
Trix.config.textAttributes.center = {
  style: { "textAlign": "center",
  "display": "block" },
  inheritable: true,
  parser: function(element) {
    return element.style.textAlign === "center"
  }
}
Trix.config.blockAttributes.heading = { tagName: 'h2',
    terminal: true,
    breakOnReturn: true,
    group: false }

addEventListener("trix-initialize", function(event) {
  var extraHTML = '<input type="color" class="trix-button colourPicker"/>'
  extraHTML += '<button type="button" class="trix-button" data-trix-attribute="underline" title="underline"><h5 style="margin-bottom: 0px; font-weight: bold">U</h5></button>'
  extraHTML += '<button type="button" class="trix-button" data-trix-attribute="center" title="center"><i class="fas fa-align-center"></i></button>'
  extraHTML += '<button type="button" class="trix-button" data-trix-attribute="heading" title="Subheading"><h5 style="margin-bottom: 0px; font-weight: bold">H2</h5></button>'

	event.target.toolbarElement.
  	querySelector(".trix-button-group--text-tools").
		insertAdjacentHTML("beforeend", extraHTML)

  document.
    querySelectorAll(".colourPicker").forEach(function(cp){
      cp.addEventListener("input", function (event) {
        var trix_element = event.target.closest('trix-toolbar').nextElementSibling
        trix_element.editor.activateAttribute("textColour", event.target.value)
    })
  })
})
