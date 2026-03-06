# Cat Attack 🚀🐱

A **2-player local multiplayer arcade shooter** built with the **Godot Engine**.

Players control rocket ships and compete to destroy incoming mice while avoiding enemy attacks. Each player has limited lives, and the player with the highest score when someone dies wins.

All **artwork and music were created by me**.

---

## Built With

- **Godot Engine**
- **GDScript**

---

## Play / Download

The playable build of the game can be downloaded from itch.io:

https://heathercoyne.itch.io/cat-attack

Steps to play:

1. Download **CatAttack.zip**
2. Extract the zip file
3. Run **CatAttack.exe**


---

## Gameplay

Two players battle on the same screen while waves of enemies spawn from the right side.

Players can:

- Move freely around the screen
- Shoot rockets
- Destroy enemy mice
- Avoid enemy lasers
- Compete for the highest score

The game progressively becomes harder as spawn rates increase.

---

## Controls

### Player 1
Move: **W A S D**  
Shoot: **Space**

### Player 2
Move: **Arrow Keys**  
Shoot: **Enter**

---

## Rules

Each player starts with **10 lives**.

### Damage

- Hit by laser → **-1 life**
- Hit by mouse → **-3 lives**

### Scoring

- Destroy a mouse → **+100 points**
- Destroy a laser → **+10 points**
- Hit by mouse → **-50 points**
- Hit by laser → **-5 points**

The game ends when a player reaches **0 lives**.

The player with the **highest score wins**.

---

## Screenshots

### Start Screen

<img width="1267" height="755" alt="image1" src="https://github.com/user-attachments/assets/e15e49f5-8f20-4d3e-96d8-0b275270fa9f" />


### Gameplay

<img width="1277" height="705" alt="image2" src="https://github.com/user-attachments/assets/28e6dffc-4f08-450b-bad3-6a9ddbe1b7d5" />


<img width="1272" height="699" alt="iamge3" src="https://github.com/user-attachments/assets/a81e9773-8175-4ab9-8a1a-c6c9797d6396" />


---

## Running the Project in Godot (Optional)

If you want to explore or modify the game:

1. Install **Godot Engine**
2. Open Godot
3. Click **Import Project**
4. Select `project.godot` from this repository

---

## Technical Highlights

This project includes:

- Node-based architecture using **Godot scenes**
- **Signal-based event communication**
- Enemy spawning system with **increasing difficulty**
- Player inheritance system (`player.gd`, `player1.gd`, `player2.gd`)
- Separate scripts for **HUD, enemies, rockets, and game state**
- Local multiplayer support

---

## Assets

All **sprites, UI artwork, and music were created by me** specifically for this project.

---

## Author

Heather Xin Coyne
