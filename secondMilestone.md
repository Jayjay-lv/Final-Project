# Second Milestone

## What was the original goal of your project?

The original of this project was to create a card matching game that makes the user choose a card, it get flipped, then the user picks a 
second card which get flipped and if the cards match, then they disappear. If the cards dont match, then they get automatically flipped 
back over. I wanted the game to have good transitions and pictures and actually look like a game.

## How have the goals of your project changed?
My overall goals for this project haven't really changed, but my smaller goals have constantly. I set new goals when writing new portions of the game. My overall goals haven't changed because I've been able to get past all the roadblocks that would stop me from reaching these goals so far. My overall goal is to have a game that looks smooth when it runs

## What is a significant thing that you learned while building this project?

In this project, I learned how to use CollectionView, which allows for a grid of views which can be re-used through the reuse identifier for the cells of the views. The CollectionView allows for a bunch of views to populate the screen without having to make them one-by-one. This basically made all the card objects for me, and I created the game logic through using the CollectionView. The collectionView cells
are pretty tricky since a lot of things can happen when they get re-used, so learning how to fix those errors was pretty informative



## Describe an unexpected challenge that came up during this project, and how you overcame it.

When running the app, I realized their was an issue where when I scrolled down and a row of cells went out of view, when I would scroll back up the cells would sometimes change. I don't really know why this happened, however I solved the issue with the help of someone from stackoverflow. The only major issues I had were with the cells and how they were being re-used. I had a tough time figuring out how to fix these problems, and when I would fix one, I would realize that their was a whole other problem regarding the cells that needed fixing

## Knowing what you know now, if you were to rebuild this project completely from scratch, what would you do differently, and why?

I would put in all the framwork for the cells and the collectionView before doing anything more complicated before. The cells required the most 
amount of research to have them behave how I wanted them to, so if I could redo it, I would do the cells first. The cells were by far the most annoying for me to deal with. I kept finding out weird behaviors of the cells when they would be re-used, and had to learn how to make the cells not do that

