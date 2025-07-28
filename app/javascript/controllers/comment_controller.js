import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "body", "links"]
  
  // Show edit form, hide body and action links
  edit() {
    this.formTarget.classList.remove("d-none")
    this.bodyTarget.classList.add("d-none")
    this.linksTarget.classList.add("d-none")
  }
  
  // Hide edit form, show body and action links
  cancel() {
    this.formTarget.classList.add("d-none")
    this.bodyTarget.classList.remove("d-none")
    this.linksTarget.classList.remove("d-none")
  }
}
