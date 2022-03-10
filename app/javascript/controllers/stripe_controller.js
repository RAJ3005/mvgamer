import { Controller } from "stimulus";

export default class extends Controller {
  static values = { api: String, session: String };

  sendToStripe(event) {
    event.preventDefault();
    const stripe = Stripe(this.apiValue);
    stripe.redirectToCheckout({
      sessionId: this.sessionValue,
    });
  }
}
