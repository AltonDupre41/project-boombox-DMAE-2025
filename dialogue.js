// Simplified dialogue structure using basic arrays
const dialogues = [
  // Dialogue ID 0: Welcome dialogue
  [
    "Welcome to Bit By Beat! Get ready to play some awesome music.",
    "Use the controls to create your own beats and melodies.",
    "Have fun exploring the world of music!",
  ],

  // Dialogue ID 1: Tutorial dialogue
  [
    "Let's learn how to use the instruments.",
    "Click on different parts of the screen to interact with the game.",
    "Try experimenting with different combinations to create unique sounds!",
  ],

  // Add more dialogues as needed
];

/**
 * Display dialogue in the chat box
 * @param {number} dialogueId - The ID of the dialogue to display
 */
function triggerDialogue(dialogueId) {
  console.log(`triggerDialogue called with ID: ${dialogueId}`);

  // Convert dialogueId to number if it's a string
  dialogueId = parseInt(dialogueId, 10);

  const dialogue = dialogues[dialogueId];
  if (!dialogue) {
    console.error(
      `Dialogue ID ${dialogueId} not found in dialogues array:`,
      dialogues
    );
    return;
  }

  const chatMessages = document.querySelector(".chat-messages");
  if (!chatMessages) {
    console.error("Chat messages element not found. Creating one...");
    // Create the element if it doesn't exist
    const chatContainer = document.createElement("div");
    chatContainer.className = "chat-messages";
    document.body.appendChild(chatContainer);
    console.log("Created chat-messages container");
  }

  const chatMessagesElement = document.querySelector(".chat-messages");
  chatMessagesElement.innerHTML = ""; // Clear previous messages

  // Loop through each message in the dialogue array
  dialogue.forEach((messageText) => {
    console.log(`Adding message: ${messageText}`);
    const messageElement = document.createElement("div");
    messageElement.textContent = messageText;
    messageElement.className = "message";
    chatMessagesElement.appendChild(messageElement);
  });

  // Scroll to the bottom of the chat
  chatMessagesElement.scrollTop = chatMessagesElement.scrollHeight;

  console.log(`Displayed dialogue ID: ${dialogueId}`);
}

// Make sure triggerDialogue is explicitly in the global scope
window.triggerDialogue = triggerDialogue;

console.log(
  "dialogue.js loaded, triggerDialogue function is available in global scope:",
  typeof window.triggerDialogue === "function"
);
