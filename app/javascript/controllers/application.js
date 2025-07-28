// Add this to your existing application.js
import "@hotwired/turbo-rails"
import "./controllers"  // Make sure this line exists

// Add comment controller to registration
import CommentController from "./controllers/comment_controller"

Stimulus.register("comment", CommentController)
