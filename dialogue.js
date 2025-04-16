// Dialogue system for Bit By Beat
const dialogueMessages = [
  "Welcome to Bit By Beat! Press the arrow keys to move.",
  "Collect musical notes to increase your score!",
  "Watch out for obstacles that might get in your way.",
  "You can use power-ups to help you on your journey.",
  "Try to reach the end of each level to progress.",
  "The difficulty increases as you advance through levels.",
  "Remember to use the spacebar for special actions.",
  "You can pause the game by pressing 'P'.",
  "Collect all achievements to become a music master!",
  "Don't forget to save your progress regularly.",
];

// Function to trigger dialogue in the chat box
function triggerDialogue(messageIndex) {
  // Get the chat messages container
  const chatMessages = document.querySelector(".chat-messages");

  // Check if the message index is valid
  if (messageIndex >= 0 && messageIndex < dialogueMessages.length) {
    // Create a new message element with NES.css styling
    const messageElement = document.createElement("div");
    messageElement.className = "message";

    // Create the message balloon
    const balloonElement = document.createElement("div");
    balloonElement.className = "nes-balloon from-left";

    // Create the text element
    const textElement = document.createElement("p");
    textElement.textContent = dialogueMessages[messageIndex];

    // Assemble the message
    balloonElement.appendChild(textElement);
    messageElement.appendChild(balloonElement);

    // Clear existing messages
    chatMessages.innerHTML = "";

    // Add the new message
    chatMessages.appendChild(messageElement);

    // Scroll to the bottom to ensure the message is visible
    chatMessages.scrollTop = chatMessages.scrollHeight;
  } else {
    console.error(
      `Invalid dialogue index: ${messageIndex}. Must be between 0 and ${
        dialogueMessages.length - 1
      }.`
    );
  }
}

// Optional: Function to add a message to the chat without clearing previous ones
function addDialogue(messageIndex) {
  // Get the chat messages container
  const chatMessages = document.querySelector(".chat-messages");

  // Check if the message index is valid
  if (messageIndex >= 0 && messageIndex < dialogueMessages.length) {
    // Create a new message element with NES.css styling
    const messageElement = document.createElement("div");
    messageElement.className = "message";

    // Create the message balloon
    const balloonElement = document.createElement("div");
    balloonElement.className = "nes-balloon from-left";

    // Create the text element
    const textElement = document.createElement("p");
    textElement.textContent = dialogueMessages[messageIndex];

    // Assemble the message
    balloonElement.appendChild(textElement);
    messageElement.appendChild(balloonElement);

    // Add the new message
    chatMessages.appendChild(messageElement);

    // Scroll to the bottom to ensure the message is visible
    chatMessages.scrollTop = chatMessages.scrollHeight;
  } else {
    console.error(
      `Invalid dialogue index: ${messageIndex}. Must be between 0 and ${
        dialogueMessages.length - 1
      }.`
    );
  }
}
