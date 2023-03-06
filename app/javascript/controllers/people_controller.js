import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="people"
export default class extends Controller {
  updateStage(e) {
    const personId = e.target.dataset.personId;
    $.ajax({
      type: 'PATCH',
      url: `people/${personId}`,
      data: {
        person: {stage: e.target.value},
        authenticity_token: $("meta[name='csrf-token']").attr("content")
      },
    });
  }
}
