const dialogues = [
  // Dialogue ID 0
  ["*phone ringing*"],

  // Dialogue ID 1
  ["Hello"],

  // Dialogue ID 2
  ["Boombie!"],

  // Dialogue ID 3
  ["I thought I blocked this number"],

  // Dialogue ID 4
  ["Don’t be like that. I hope your song is finished, the concert is tonight."],

  // Dialogue ID 5
  [
    "Of course it’s done! I’m one of the greatest musicians in the world! Who do you take me for?!",
  ],

  // Dialogue ID 6
  ["Right. We’ll see tonight"],

  // Dialogue ID 7
  ["*click*"],

  // Dialogue ID 8
  ["I haven’t even started"],

  // Dialogue ID 9
  [
    "It’s been a while since I made a new song. The hardest part is choosing each piece of the sound, because even the smallest change can completely alter the song. What if it turns out that the other sound I didn’t pick ends up being the better choice? Awww, I’m getting anxious just thinking about it!",
  ],

  // Dialogue ID 10
  [
    "My first choice, the bassline! Hmm they’re both probably really good, how will I choose??",
  ],

  // Dialogue ID 11
  [
    "Bassline 1: This gear hums with restless energy. It buzzes like a neon sign in a sleepless city.",
  ],

  // Dialogue ID 12
  [
    "Bassline 2: This gear pulses like a calm heartbeat. Steady. Simple. Certain.",
  ],

  // Dialogue ID 13
  ["Boombie!"],

  // Dialogue ID 14
  ["Old man R.C.! How are you? Did you get that bent needle replaced?"],

  // Dialogue ID 15
  ["Yea yea, you’re so funny Boombie. How is the song coming?"],

  // Dialogue ID 16
  ["What do you mean? The concert is today, I finished it weeks ago!"],

  // Dialogue ID 17
  [
    "Don’t lie to me, Boombie. I’ve mentored you for far too long to know that’s not the case",
  ],

  // Dialogue ID 18
  ["...I can’t decide on the sound, what if I make the wrong choice?"],

  // Dialogue ID 19
  ["What if you don’t make a choice at all?"],

  // Dialogue ID 20
  ["...Well I wouldn’t have a song at all…"],

  // Dialogue ID 21
  ["If you ask me that would be much worse than either choice"],

  // Dialogue ID 22
  ["I guess so…"],

  // Dialogue ID 23
  [
    "Boombie, it’s true that each decision is important. But no matter what choice you make, I know you’ll do great. The worst mistake you could make would be not making a decision at all. Take what comes with the decision and keep moving forward. I think you’ll make a great decision though",
  ],

  // Dialogue ID 24
  ["…"],

  // Dialogue ID 25
  ["I guess I never thought about it like that."],

  // Dialogue ID 26
  [
    "And that’s ok. That’s why I’m here. I’ll be at the concert tonight, and I expect a great song. Take care, Boombie.",
  ],

  // Dialogue ID 27
  [
    "The chord is next. I’ll try and take old man R.C.’s advice, and not think too hard. I’ve got a great musical ear, I don’t know why I’m even overthinking it!",
  ],

  // Dialogue ID 28
  ["Chord 1.1: A delicate gear, light as a feather—floaty and ethereal."],

  // Dialogue ID 29
  [
    "Chord 1.2: This gear is heavy with motion—like factory pistons in perfect chaos.",
  ],

  // Dialogue ID 30
  ["Chord 2.1: This gear hums a long breath—held just a second too long."],

  // Dialogue ID 31
  ["Chord 2.2: This gear speaks in bold steps. No fear. No hesitation."],

  // Dialogue ID 32
  [
    "Woah, this is nice! There’s more work to be done, but it’s really coming together! R.C. was right, better to move forward than stay in the same place out of fear.",
  ],

  // Dialogue ID 33
  ["*Phone ringing*"],

  // Dialogue ID 34
  ["Ughhhhhh"],

  // Dialogue ID 35
  ["Helloooo?"],

  // Dialogue ID 36
  ["Rehearsal started an hour ago, where are you???"],

  // Dialogue ID 37
  ["Uhhh… in traffic"],

  // Dialogue ID 38
  ["You live down the street"],

  // Dialogue ID 39
  ["I needed to hit the bank"],

  // Dialogue ID 40
  ["...It’s Sunday"],

  // Dialogue ID 41
  ["..."],

  // Dialogue ID 42
  ["…"],

  // Dialogue ID 43
  [
    "Well if you’re not coming to rehearsal can I at least get a snippet of the song. The crew wants to make sure they’re in tune for the show",
  ],

  // Dialogue ID 44
  ["Uhh, can’t right now, still driving"],

  // Dialogue ID 45
  ["You’re literally a Boombox."],

  // Dialogue ID 46
  ["What’s that? You’re breaking up"],

  // Dialogue ID 47
  ["I know you can hear me!!!"],

  // Dialogue ID 48
  ["I’m in a tunnel, I’ll call you back!!!"],

  // Dialogue ID 49
  ["*click*"],

  // Dialogue ID 50
  ["Gosh she’s worse than my mother"],

  // Dialogue ID 51
  [
    "The song is coming along nicely, but a melody would take it to the next level!",
  ],

  // Dialogue ID 52
  [
    "Melody 1.1: This gear thrums with boldness—each note walks tall and leaves footprints behind.",
  ],

  // Dialogue ID 53
  [
    "Melody 1.2: This gear chirps and hops like it’s playing a game. Playful but precise.",
  ],

  // Dialogue ID 54
  ["Melody 2.1: This gear quivers with tension and a nervous rhythm."],

  // Dialogue ID 55
  [
    "Melody 2.2: This gear is cracked but shining. It sings a harmonic tune of perseverance.",
  ],

  // Dialogue ID 56
  [
    "Now we’re cooking! A melody is just what I needed, and this might be my best work yet! All it takes is a little bit of determination and now I’m back on top!!!",
  ],

  // Dialogue ID 57
  ["…"],

  // Dialogue ID 58
  [
    "Well, let me not get ahead of myself. I should probably find a way to make it to the concert on time first XD",
  ],

  // Dialogue ID 59
  ["I made it!!! Time to rock this place! #1 hit single here I come!!!"],

  // Dialogue ID 60
  ["Boombie!"],

  // Dialogue ID 61
  ["Hey, it’s… you!"],

  // Dialogue ID 62
  ["…"],

  // Dialogue ID 63
  ["…"],

  // Dialogue ID 64
  [
    "I’ve served as your manager for the last 10 years and you can’t even remember my name?",
  ],

  // Dialogue ID 65
  ["Of course I know your name"],

  // Dialogue ID 66
  ["…"],

  // Dialogue ID 67
  ["…"],

  // Dialogue ID 68
  ["So anyways time for my performance ok byeeee :)"],

  // Dialogue ID 69
  ["Well it better be good"],

  // Dialogue ID 70
  [
    "Every choice we make—no matter how small—shapes the melody of our lives. A single decision can send us down a path we never imagined, for better or worse. But the worst thing we can do... is nothing. Because standing still doesn’t stop the world from moving—it just leaves us behind.",
  ],

  // Dialogue ID 71
  ["Great work kid, I knew you’d pull through!"],

  // Dialogue ID 72
  [
    "Thank you sir, I couldn’t have done it without you! It’s crazy how such seemingly small decisions can have such a major impact in the grand scheme of things!",
  ],

  // Dialogue ID 73
  ["You never cease to amaze me on all fronts"],

  // Dialogue ID 74
  ["Aside from composing, it’s my specialty :D"],

  // Dialogue ID 75
  [
    "Yeah no kidding. Everyone’s super hyped for your upcoming world tour, and if the rest of the new album is anything like this, you’ll knock it out of the park!",
  ],

  // Dialogue ID 76
  ["…"],

  // Dialogue ID 77
  ["What"],
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
