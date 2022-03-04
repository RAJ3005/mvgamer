import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // static targets = [""]
  connect() {
    console.log("The 'bet_form_input' controller is now loaded!")
  }
}
