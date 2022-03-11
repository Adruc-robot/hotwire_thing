import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll"
export default class extends Controller {
  // on start
  connect() {
    const messages = document.getElementById("messages");
    messages.addEventListener("DOMNodeInserted", this.resetScroll)
    this.resetScroll(messages);
  }
  //on stop
  disconnect() {
    const messages = document.getElementById("messages");
    messages.removeEventListener("DOMNodeInserted", this.resetScroll)
    
  }
  //the thing
  resetScroll() {
    messages.scrollTop = messages.scrollHeight - messages.clientHeight;
  }
}
