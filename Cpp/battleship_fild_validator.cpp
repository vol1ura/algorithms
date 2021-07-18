/*
https://www.codewars.com/kata/52bb6539a4cf1b12d90005b7

Write a method that takes a field for well-known board game "Battleship"
as an argument and returns true if it has a valid disposition of ships,
false otherwise. Argument is guaranteed to be 10*10 two-dimension array.
Elements in the array are numbers, 0 if the cell is free and 1 if occupied by ship.

Battleship (also Battleships or Sea Battle) is a guessing game for two players.
Each player has a 10x10 grid containing several "ships" and objective is to destroy
enemy's forces by targetting individual cells on his field. The ship occupies
one or more cells in the grid. Size and number of ships may differ from version to version.
In this kata we will use Soviet/Russian version of the game.

Before the game begins, players set up the board and place the ships accordingly to the following rules:
    There must be single battleship (size of 4 cells), 2 cruisers (size 3), 3 destroyers (size 2) and 4 submarines (size 1). Any additional ships are not allowed, as well as missing ships.
    Each ship must be a straight line, except for submarines, which are just single cell.
    The ship cannot overlap or be in contact with any other ship, neither by edge nor by corner.
This is all you need to solve this kata. If you're interested in more information about the game, visit this link.
*/
#include <vector>

int find_ship(std::vector< std::vector<int> > &field) {
  for(int i = 0; i < 10; ++i) {
    for(int j = 0; j < 10; ++j) {
      if(field[i][j] == 1) {
        int cnt = 1;
        if(j + 1 < 10) {
          if(field[i][j+1] == 1) { // find to right:
            cnt++;
            if(j + 2 < 10) {
              if(field[i][j+2] == 1) {
                cnt++;
                if(j + 3 < 10) {
                  if(field[i][j+3] == 1) {
                    cnt++;
                  }
                }
              }
            }
            // deleting
            int k1 = i - 1, k2 = i + 1, l1 = j - 1, l2 = j + cnt;
            if(i == 0) k1 = 0;
            if(i == 9) k2 = 9;
            if(j == 0) l1 = 0;
            if(l2 == 10) l2--;
            for(int k = k1; k <= k2; ++k) {
              for(int l = l1; l <= l2; ++l) {
                field[k][l] = 0;
              }
            }
            return cnt;
          }
          else if(i + 1 < 10) {
            if(field[i+1][j] == 1) {
              cnt++;
              if(i + 2 < 10) {
                if(field[i+2][j] == 1) {
                  cnt++;
                  if(i + 3 < 10) {
                    if(field[i+3][j] == 1) {
                      cnt++;
                    }
                  }
                }
              }
            }
          }
        }
        // deleting
        int k1 = i - 1, k2 = i + cnt, l1 = j - 1, l2 = j + 1;
        if(i == 0) k1 = 0;
        if(k2 == 10) k2--;
        if(j == 0) l1 = 0;
        if(j == 9) l2 = 9;
        for(int k = k1; k <= k2; ++k) {
          for(int l = l1; l <= l2; ++l) {
            field[k][l] = 0;
          }
        }
        return cnt;
      }
    }
  }
  return 0;
}

bool validate_battlefield(std::vector< std::vector<int> > field) {
  int s1 = 4, s2 = 3, s3 = 2, s4 = 1;
  for(int f = 0; f < 10; ++f) {
    switch(find_ship(field)) {
        case 1: s1--; break;
        case 2: s2--; break;
        case 3: s3--; break;
        case 4: s4--; break;
    };
  }
  return !(s1 || s2 || s3 || s4 || find_ship(field));
}
