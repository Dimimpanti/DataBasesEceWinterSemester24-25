#  My First C++ Projects: Game Development
Welcome to my repository! Here, you'll find my initial projects created while learning C++. These projects showcase simple, yet fun, command-line games.

## About the Connect 4

**Connect 4** is a two-player game where players take turns dropping colored discs into a vertical grid. The first player to connect four of their own discs in a row (horizontally, vertically, or diagonally) wins the game.

In this implementation, Player 1 and Player 2 are represented by two different colors—either Red (R) or Yellow (Y)—and the game is played in the terminal.

## How to Play

### Choose Colors:
- Player 1 selects a color (Red or Yellow) at the beginning of the game. Player 2 is automatically assigned the other color.
- Colors are represented by the characters 'R' and 'Y' on the board.

### Taking Turns:
- The players alternate turns, starting with Player 1.
- Each player chooses a column (from 0 to 6) to drop their disc.
- The disc will fall to the lowest available row in the chosen column.

### Winning Condition:
- The game checks for a winning condition (four consecutive discs of the same color) after each turn.
- A player wins if they connect four discs horizontally, vertically, or diagonally.

### Ending the Game:
- When a player wins, the game announces the winner and exits.

## Code Structure

### Main Functions:
- `printTable`: Prints the current game board with ASCII characters to represent the grid.
- `colorChoice`: Allows Player 1 to choose a color, assigning the other color to Player 2.
- `PlayRound`: Manages each player's turn, prompting them to choose a column and placing their disc.
- `checkWin`: Checks for any winning condition (horizontal, vertical, diagonal) for a given player after each turn.

### Variables:
- `tb[6][7]`: A 2D array representing the game board with 6 rows and 7 columns.
- `player1` and `player2`: Characters ('R' or 'Y') representing each player's color.
- `col1` and `col2`: Integers to store the column choices for each player.

 ## About the Noughts and Crosses

**Noughts and Crosses** (also known as Tic-Tac-Toe) is a two-player game played on a 3x3 grid. Players take turns marking a cell with their chosen symbol, either "X" or "O". The first player to align three of their symbols in a row, column, or diagonal wins.

In this implementation, the game is played in the terminal, and each player selects a cell by providing its grid coordinates.

## How to Play

### Choose Symbols:
- Player 1 selects a symbol at the start of the game (either "X" or "O").
- Player 2 is automatically assigned the other symbol.
  
### Grid Layout:
The board is a 3x3 grid, represented by the following coordinates:
```plaintext
| 00 | 01 | 02 |
| 10 | 11 | 12 |
| 20 | 21 | 22 |
```

## Code Structure

### Main Functions:
- **`printTable`**: Prints the current game board with ASCII characters to represent the grid.
- **`SymbolsChoice`**: Allows Player 1 to choose a symbol and assigns the other symbol to Player 2.
- **`CheckCell`**: Validates the cell chosen by a player, ensuring it is within bounds and unoccupied.
- **`PlayRound`**: Manages each player's turn, prompting them to choose a cell and marking it.
- **`checkVictory`**: Checks for any winning condition (horizontal, vertical, diagonal) after each move.

### Variables:
- **`tb[3][3]`**: A 2D array representing the 3x3 game board.
- **`player1` and `player2`**: Characters representing each player's chosen symbol ('X' or 'O').
- **`row`, `col`**: Integers for tracking the cell chosen by the player during each turn.

#  SmartHome ft. Smartwatch Database

Welcome to the **SmartHome ft. Smartwatch** database project!  
This system combines smart home automation with smartwatch health tracking and personalized user notifications — all managed through a structured and secure relational database.

---

##  📌 What It’s About

The database supports:
- Smart device control (lights, heating, locks, gardening)
- Smartwatch health tracking (pulses, distance, temperature)
- Role-based access (admin, family member, child, guest)
- User activity planning with reminders and notifications

🎯 The goal? Full control of your home and health, in one place.

---

##  🧱 ER Diagram

Visual overview of the database schema:

![ER Diagram](mydb.png)

---

## 🗃️ Files Included

- 📄 **report_work1_team1.pdf**  
  Full project report describing design, entities, relationships & requirements.

- 🖼️ **mydb.png**  
  ER diagram showing the full database schema and associations.

- 🧠 **query1.sql**, **query2.sql**, ...  
  A set of SQL scripts containing queries like:
  - 🔋 Smartwatches with low battery
  - 👥 Users and their roles
  - 📢 Activity-based reminders
  - 🔥 Actuator energy stats

---

## 🧠 Key Entities

| Entity        | Description |
|---------------|-------------|
| `User`        | Stores user info and role |
| `Device`      | Abstract parent for all devices |
| `Smartwatch`  | Monitors health data + reminds |
| `Sensor`      | Triggers based on conditions |
| `Actuator`    | Executes actions in the smart home |
| `Activity`    | Daily scheduled tasks |
| `Notification`| Messages sent to the smartwatch |
| `Permission`  | Device access rights |
| `Role`        | Defines access levels for users |

🔁 Relationships like `commands`, `reminds`, `notifies`, `hasPermission`, and `does` connect users, roles, devices, and activities intelligently.

---

## 🔐 Role Permissions Overview

| Role          | Capabilities |
|---------------|--------------|
| `admin`       | Full control over all devices and settings |
| `familyMember`| Controls most devices except sensors |
| `child`       | Controls lights and TV only |
| `guest`       | No device control, just notifications |

---

## 🚀 Example Queries

Here are some useful queries included:

- Get smartwatches with battery < 20%  
- Find all notifications sent to users with pulses > 90  
- List activities longer than 1 hour  
- Get roles with both “controlLights” and “controlHeating”  
- Find which roles control **all** devices (division query!)

---

## 🛠️ How to Run the Project

Follow these simple steps to get the SmartHome database up and
